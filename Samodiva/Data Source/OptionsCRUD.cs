using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Samodiva.Data_Source
{
    public class OptionsCRUD : DataAccess
    {
        public void SetOption(Option option)
        {
            context.Options.Add(option);
            context.SaveChanges();
        }

        public Option GetOption(int ID)
        {
            return (from c in context.Options
                    where c.Id == ID
                    select c).FirstOrDefault();
        }

        public string GetOption(string Key)
        {
            return (from c in context.Options
                    where string.Equals(c.Key, Key)
                    select c).FirstOrDefault().Value;
        }

        public IEnumerable<Option> GetOptions()
        {
            return (from c in context.Options
                    select c);
        }

        public void EditOption(Option option)
        {
            Option op = GetOption(option.Id);
            if (op!=null)
            {
                op = option;
                context.SaveChanges();
            }
        }

        public void DeleteOption(Option option)
        {
            context.Options.Remove(option);
            context.SaveChanges();
        }

        public void DeleteOption(int ID)
        {
            context.Options.Remove(GetOption(ID));
            context.SaveChanges();
        }
    }
}
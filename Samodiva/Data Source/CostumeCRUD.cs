using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Samodiva.Data_Source
{
    public class CostumeCRUD : DataAccess
    {
        public void SetCostume(Costume costume)
        {
            context.Costumes.Add(costume);
            context.SaveChanges();
        }

        public IEnumerable<Costume> GetCostumes()
        {
            return (from c in context.Costumes
                    select c);
        }

        public Costume GetCostume(int ID)
        {
            return (from c in context.Costumes
                    where c.id == ID
                    select c).FirstOrDefault();
        }

        public void EditCostume(Costume editedCostume)
        {
            Costume c = GetCostume(editedCostume.id);
            c = editedCostume;
            context.SaveChanges();
        }

        public void DeleteCostume(Costume costume)
        {
            context.Costumes.Remove(costume);
            context.SaveChanges();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Samodiva.Data_Source
{
    public class AwardCRUD : DataAccess
    {
        public void SetNewAward(Award newAward)
        {
            context.Awards.Add(newAward);
            context.SaveChanges();
        }

        public IEnumerable<Award> GetAwards()
        {
            return (from c in context.Awards
                    orderby c.id descending
                    select c);
        }

        public Award GetAward(int id)
        {
            return (from c in context.Awards
                    where c.id == id
                    select c).FirstOrDefault();
        }

        public IEnumerable<Award> GetNAwards(int N)
        {
            return (from c in context.Awards.ToList()
                    orderby c.Date descending
                    select c).Take(N);
        }

        public void EditAward(Award editedAward)
        {
            Award a = GetAward(editedAward.id);
            a = editedAward;
            context.SaveChanges();
        }

        public void DeleteAward(Award award)
        {
            context.Awards.Remove(award);
            context.SaveChanges();
        }
    }
}
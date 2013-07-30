using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Samodiva.Data_Source
{
    public class ParticipantCRUD : DataAccess
    {
        public void SetTheBest(Participant thebest)
        {
            context.Participants.Add(thebest);
            context.SaveChanges();
        }

        public Participant GetTheBest(int ID)
        {
            return (from c in context.Participants
                    where c.id == ID
                    select c).FirstOrDefault();
        }

        public IEnumerable<Participant> GetAllParticipants()
        {
            return (from c in context.Participants
                    orderby c.Date descending
                    select c);
        }

        public IEnumerable<Participant> GetNParticipants(int N)
        {
            return (from c in context.Participants.ToList()
                    orderby c.Date descending
                    select c).Take(N);
        }

        public void EditTheBest(Participant thebest)
        {
            Participant p = GetTheBest(thebest.id);
            p = thebest;
            context.SaveChanges();
        }

        public void DeleleTheBest(Participant thebest)
        {
            context.Participants.Remove(thebest);
            context.SaveChanges();
        }

        public void DeleleTheBest(int ID)
        {
            context.Participants.Remove(GetTheBest(ID));
            context.SaveChanges();
        }
    }
}
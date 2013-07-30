using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Samodiva.Data_Source
{
    public class ScheduleCRUD : DataAccess
    {
        public Schedule GetSchedule()
        {
            return (from c in context.Schedules
                    select c).FirstOrDefault();
        }

        public bool SetSchedule(string Text)
        {
            Schedule sch = GetSchedule();
            if (sch == null)
            {
                sch = new Schedule();
                sch.Text = Text;
                context.Schedules.Add(sch);
            }
            else
            {
                sch.Text = Text;
            }

            try
            {
                context.SaveChanges();
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }
    }
}
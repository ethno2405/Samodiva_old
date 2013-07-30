using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace Samodiva.Data_Source
{
    public class AboutUsCRUD : DataAccess
    {
        public void SetAboutUs(About_Us Text)
        {
            if (GetAboutUs()==null)
            {
                context.About_Us.Add(Text);
            }
            else
            {
                GetAboutUs().Text = Text.Text;
            }
            context.SaveChanges();
        }

        public About_Us GetAboutUs()
        {
            return (from c in context.About_Us
                    select c).FirstOrDefault();
        }
    }
}
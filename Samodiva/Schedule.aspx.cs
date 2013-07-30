using Samodiva.Data_Source;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Samodiva
{
    public partial class Schedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (ScheduleCRUD crud = new ScheduleCRUD())
            {
                litSchedule.Text = crud.GetSchedule().Text;
            }
        }
    }
}
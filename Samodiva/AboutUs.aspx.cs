using Samodiva.Data_Source;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Samodiva
{
    public partial class AboutUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (AboutUsCRUD crud = new AboutUsCRUD())
            {
                litAboutUs.Text = crud.GetAboutUs().Text;
            }
        }
    }
}
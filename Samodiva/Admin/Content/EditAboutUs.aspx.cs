using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Samodiva.Data_Source;

namespace Samodiva.Admin
{
    public partial class EditAboutUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                About_Us text;
                using (AboutUsCRUD crud = new AboutUsCRUD())
                {
                    text = crud.GetAboutUs();
                }
                if (text == null)
                    return;
                tbAboutUs.Text = text.Text;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            About_Us about;
            using (AboutUsCRUD crud = new AboutUsCRUD())
            {
                about = crud.GetAboutUs();
                about.Text = tbAboutUs.Text.Trim();
                crud.SetAboutUs(about);
            }
            Response.Redirect("~/Admin/Content/EditAboutUs.aspx");
        }
    }
}
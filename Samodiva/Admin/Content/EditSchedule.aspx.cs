using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Samodiva.Data_Source;

namespace Samodiva.Admin
{
    public partial class EditSchedule : System.Web.UI.Page
    {
        protected ScheduleCRUD crud = new ScheduleCRUD();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Data_Source.Schedule schedule = crud.GetSchedule();
                if (schedule != null)
                {
                    tbSchedule.Text = schedule.Text;
                }
                else
                {
                    tbSchedule.Text = "Not set!";
                }
            }
        }

        protected void btnSubmitSchedule_Click(object sender, EventArgs e)
        {
            if (crud.SetSchedule(tbSchedule.Text.Trim()))
            {
                lblError.Text = "Changes applyed!";
                Response.Redirect("~/Admin/Content/EditSchedule.aspx");
            }
            lblError.Text = "Oops something went wrong!";
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Samodiva.Data_Source;

namespace Samodiva.Admin
{
    public partial class PreviewNews : System.Web.UI.Page
    {
        protected NewsCRUD crud = new NewsCRUD();
        protected int NewsID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.TryParse(Request.QueryString["ID"], out NewsID))
            {
                Data_Source.News news = crud.GetNews(NewsID);
                lblTitle.Text = news.Title;
                litBody.Text = news.Body;
                lblDate.Text = news.Date.ToShortDateString();
                return;
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Content/EditNews.aspx?ID=" + NewsID);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Content/EditNews.aspx");
        }
    }
}
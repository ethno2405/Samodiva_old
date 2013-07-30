using Samodiva.Class_Library;
using Samodiva.Data_Source;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Samodiva
{
    public partial class News : System.Web.UI.Page
    {
        private int NewsID;
        protected void ShowNews(int id)
        {
            mvNews.SetActiveView(vSingleNews);
            Data_Source.News news;
            using (NewsCRUD crud = new NewsCRUD())
            {
                news = crud.GetNews(id);
            }
            if (news == null) return;

            lblTitle.Text = news.Title;
            litMce.Text = news.Body;
            lblDate.Text = news.Date.ToShortDateString();
            
            return;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.TryParse(Request.QueryString["ID"], out NewsID))
            {
                ShowNews(NewsID);
                return;
            }
            mvNews.SetActiveView(vAllNews);
        }
    }
}
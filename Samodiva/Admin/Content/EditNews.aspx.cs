using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using Samodiva.Data_Source;

namespace Samodiva.Admin
{
    public partial class EditNews : System.Web.UI.Page
    {
        protected static bool PostBack = false;
        protected NewsCRUD crud = new NewsCRUD();
        protected int NewsID;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.UrlReferrer == null) PostBack = false;
            if (!int.TryParse(Request.QueryString["ID"], out NewsID))
            { 
                PostBack = false;
                btnCancel.Visible = false;
                btnSubmitNews.Visible = true;
                btnEditNews.Visible = false;
                IEnumerable<Data_Source.News> arrNews = crud.GetNews();
                if (rptrNews.Visible = arrNews.Any())
                {
                    rptrNews.DataSource = arrNews.ToList();
                    rptrNews.DataBind();

                    int i = 0;
                    foreach (Data_Source.News n in arrNews)
                    {
                        (rptrNews.Items[i].FindControl("lblNewsDate") as Label).Text = n.Date.ToShortDateString();
                        (rptrNews.Items[i].FindControl("lbNewsTitle") as LinkButton).Text = n.Title;
                        (rptrNews.Items[i].FindControl("lbNewsTitle") as LinkButton).PostBackUrl = "~/Admin/Content/PreviewNews.aspx?ID=" + n.id;
                        (rptrNews.Items[i].FindControl("btnEditNews") as Button).PostBackUrl = "~/Admin/Content/EditNews.aspx?ID=" + n.id;
                        (rptrNews.Items[i].FindControl("btnDeleteNews") as Button).ID = "btnDeleteNews" + i;
                        (rptrNews.Items[i].FindControl("btnDeleteNews" + i) as Button).CommandArgument = n.id.ToString();
                        ++i;
                    }
                }
                return;
            }

            btnCancel.PostBackUrl = "~/Admin/Content/EditNews.aspx";
            btnCancel.Visible = true;
            rptrNews.Visible = false;
            if (!PostBack)
            {
                PostBack = true;
                Data_Source.News news = crud.GetNews(NewsID);
                if (news == null) return;
                btnSubmitNews.Visible = false;
                btnEditNews.Visible = true;
                tbNewsTitle.Text = news.Title;
                tbNewsBody.Text = news.Body;
            }
        }

        protected void btnSubmitNews_Click(object sender, EventArgs e)
        {
            Validate("News");
            if (Page.IsValid)
            {
                Data_Source.News news = new Data_Source.News();
                news.Title = tbNewsTitle.Text.Trim();
                news.Body = tbNewsBody.Text.Trim();
                news.Date = DateTime.Now;
                crud.SetNews(news);
                PostBack = false;
                Response.Redirect("~/Admin/Content/EditNews.aspx");
            }
        }

        protected void btnEditNews_Click(object sender, EventArgs e)
        {
            Validate("News");
            if (Page.IsValid)
            {
                Data_Source.News news = crud.GetNews(NewsID);
                news.Title = tbNewsTitle.Text.Trim();
                news.Body = tbNewsBody.Text.Trim();
                crud.EditNews(news);
                PostBack = false;
                tbNewsBody.Text = string.Empty;
                tbNewsTitle.Text = string.Empty;
                Response.Redirect("~/Admin/Content/EditNews.aspx");
            }
        }

        protected void btnDeleteNews_Click(object sender, EventArgs e)
        {
            int ID;
            if (int.TryParse((sender as Button).CommandArgument, out ID))
            {
                crud.DeleteNews(ID);
                Response.Redirect("~/Admin/Content/EditNews.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            tbNewsBody.Text = string.Empty;
            tbNewsTitle.Text = string.Empty;
            Response.Redirect("~/Admin/Content/EditNews.aspx");
        }
    }
}
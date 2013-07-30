using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Samodiva.Data_Source;
using System.Configuration;
using Samodiva.Class_Library;
using System.Web.UI.HtmlControls;
using System.Collections.Specialized;

namespace Samodiva
{
    public partial class Home : System.Web.UI.Page
    {
        protected OptionsCRUD optionsCrud = new OptionsCRUD();
        protected AwardCRUD awardsCrud = new AwardCRUD();
        protected ParticipantCRUD theBestCrud = new ParticipantCRUD();
        protected NewsCRUD newsCrud = new NewsCRUD();

        protected void Page_UnLoad(object sender, EventArgs e)
        {
            optionsCrud.Dispose();
            awardsCrud.Dispose();
            theBestCrud.Dispose();
            newsCrud.Dispose();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            int NumberOfNews;
            if (int.TryParse(optionsCrud.GetOption("NumberOfNews"), out NumberOfNews))
            {
                IEnumerable<Data_Source.News> news = newsCrud.GetNNews(NumberOfNews);
                if (news.Any())
                {
                    rptrLastNews.DataSource = news;
                    rptrLastNews.DataBind();

                    int i = 0;
                    foreach (Data_Source.News n in news)
                    {

                        (rptrLastNews.Items[i].FindControl("hlTitle") as HtmlAnchor).InnerText = n.Title;
                        (rptrLastNews.Items[i].FindControl("hlTitle") as HtmlAnchor).Attributes.Add("onclick", string.Concat("Load('News.aspx?ID=", n.id.ToString(), "','#slider2',2)"));
                        (rptrLastNews.Items[i].FindControl("lblBody") as Label).Text = n.Body.Length >= 80 ? StripHTML.Strip(string.Concat(n.Body.Substring(0, 80), "...")) : StripHTML.Strip(n.Body);
                        ++i;
                    }
                }
            }

            int NumberOfTheBest;
            if (int.TryParse(optionsCrud.GetOption("NumberOfTheBest"), out NumberOfTheBest))
            {
                IEnumerable<Participant> theBest = theBestCrud.GetNParticipants(NumberOfTheBest);
                if (theBest.Any())
                {
                    rptrLastTheBest.DataSource = theBest;
                    rptrLastTheBest.DataBind();

                    int i = 0;
                    foreach (Participant p in theBest)
                    {
                        (rptrLastTheBest.Items[i].FindControl("lblName") as Label).Text = p.Name;
                        (rptrLastTheBest.Items[i].FindControl("ibPicture") as HtmlControl).Attributes.Add("style", "background-image: url(" + string.Concat(ConfigurationManager.AppSettings["TheBestThumb"], p.Image_URL) + ");");
                        (rptrLastTheBest.Items[i].FindControl("divNewTheBestThumb") as HtmlControl).Attributes.Add("onclick", string.Concat("Load('TheBest.aspx?ID=", p.id.ToString(), "','#slider5',5)"));
                        ++i;
                    }
                }
            }

            int NumberOfAwards;
            if (int.TryParse(optionsCrud.GetOption("NumberOfAwards"), out NumberOfAwards))
            {
                IEnumerable<Award> awards = awardsCrud.GetNAwards(NumberOfAwards);
                if (awards.Any())
                {
                    rptrLastAwards.DataSource = awards;
                    rptrLastAwards.DataBind();

                    int i = 0;
                    foreach (Award a in awards)
                    {
                        (rptrLastAwards.Items[i].FindControl("ibAward") as HtmlControl).Attributes.Add("style", "background-image: url(" + string.Concat(ConfigurationManager.AppSettings["AwardsThumb"], a.Image_Url) + ");");
                        (rptrLastAwards.Items[i].FindControl("divNewAwardsThumb") as HtmlControl).Attributes.Add("onclick", string.Concat("Load('Awards.aspx?ID=", a.id.ToString(), "','#slider3',3)"));
                        (rptrLastAwards.Items[i].FindControl("lblAwardTitle") as Label).Text = a.Title;
                        ++i;
                    }
                }
            }
        }
    }
}
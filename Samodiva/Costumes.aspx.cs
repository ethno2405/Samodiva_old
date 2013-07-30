using Samodiva.Class_Library;
using Samodiva.Data_Source;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Samodiva
{
    public partial class Costumes : System.Web.UI.Page
    {
        private int CostumeId;
        protected void ShowCostume(int id)
        {
            mvCostumes.SetActiveView(vSingle);
            Data_Source.Costume costume;
            using (var crud = new CostumeCRUD())
            {
                costume = crud.GetCostume(id);
            }
            if (costume == null) return;
            lblTitle.Text = costume.Title;
            imgPicture.ImageUrl = string.Concat(ConfigurationManager.AppSettings["CostumesPictures"], costume.Image_Url);
            litDescription.Text = costume.Description;
            return;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.TryParse(Request.QueryString["ID"], out CostumeId))
            {
                ShowCostume(CostumeId);
                return;
            }

            mvCostumes.SetActiveView(vAll);
            IEnumerable<Costume> costumes;
            using (var crud = new CostumeCRUD())
            {
                costumes = crud.GetCostumes();
                if (rptrCostumes.Visible = costumes.Any())
                {
                    rptrCostumes.DataSource = costumes.ToList();
                    rptrCostumes.DataBind();

                    int i = 0;
                    foreach (var c in costumes)
                    {
                        (rptrCostumes.Items[i].FindControl("lblTitle") as Label).Text = c.Title;
                        (rptrCostumes.Items[i].FindControl("ibCostume") as HtmlControl).Attributes.Add("style", "background-image: url(" + string.Concat(ConfigurationManager.AppSettings["CostumesThumb"], c.Image_Url) + ");");
                        (rptrCostumes.Items[i].FindControl("liCostume") as HtmlControl).Attributes.Add("onclick", string.Concat("Load('Costumes.aspx?ID=", c.id, "','#slider6')"));
                        (rptrCostumes.Items[i].FindControl("lblShortDescription") as Label).Text = c.Description.Length >= 80 ? StripHTML.Strip(string.Concat(c.Description.Substring(0, 80), "...")) : StripHTML.Strip(c.Description);
                        ++i;
                    }
                }
            }           
        }

        protected void lbBack_Click(object sender, EventArgs e)
        {

        }

        
    }
}
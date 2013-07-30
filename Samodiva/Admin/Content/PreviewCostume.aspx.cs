using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Samodiva.Data_Source;

namespace Samodiva.Admin
{
    public partial class PreviewCostume : System.Web.UI.Page
    {
        protected static string PrevPage = string.Empty;
        protected CostumeCRUD crud = new CostumeCRUD();
        protected void Page_Load(object sender, EventArgs e)
        {
            int ID;
            if (int.TryParse(Request.QueryString["ID"], out ID))
            {
                if (!Page.IsPostBack)
                {
                    try
                    {
                        PrevPage = Request.UrlReferrer.ToString();
                    }
                    catch (Exception)
                    {
                        PrevPage = "~/Admin/Content/EditCostumes.aspx";
                    }
                }
                Costume costume = crud.GetCostume(ID);
                lblTitle.Text = costume.Title;
                if (costume.Image_Url == null)
                {
                    lblNoPicture.Visible = true;
                    imgPicture.Visible = false;
                }
                else
                {
                    imgPicture.ImageUrl = ConfigurationManager.AppSettings["CostumesPictures"] + costume.Image_Url;
                }
                litDesctiption.Text = costume.Description;
                btnEdit.PostBackUrl = "~/Admin/Content/EditCostumes.aspx?ID=" + ID;
                btnCancel.PostBackUrl = PrevPage;
            }
        }
    }
}
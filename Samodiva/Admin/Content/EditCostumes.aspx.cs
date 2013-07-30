using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Samodiva.Class_Library;
using Samodiva.Data_Source;

namespace Samodiva.Admin
{
    public partial class EditCostumes : System.Web.UI.Page
    {
        private static bool PostBack = false;
        protected CostumeCRUD crud = new CostumeCRUD();
        protected int CostumeID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.UrlReferrer == null) PostBack = false;
            if (!int.TryParse(Request.QueryString["ID"], out CostumeID))
            {
                btnEdit.Visible = false;
                btnSubmit.Visible = true;
                btnCancel.Visible = false;
                IEnumerable<Costume> Costumes = crud.GetCostumes();
                if (rptrCostumes.Visible = Costumes.Any())
                {
                    rptrCostumes.DataSource = Costumes.ToList();
                    rptrCostumes.DataBind();
                    int i = 0;
                    foreach (Costume c in Costumes)
                    {
                        (rptrCostumes.Items[i].FindControl("hlTitle") as Label).Text = c.Title;
                        (rptrCostumes.Items[i].FindControl("litDescription") as Literal).Text = c.Description;
                        (rptrCostumes.Items[i].FindControl("imgCostume") as ImageButton).PostBackUrl = "~/Admin/Content/PreviewCostume.aspx?ID=" + c.id;
                        (rptrCostumes.Items[i].FindControl("imgCostume") as ImageButton).ImageUrl = ConfigurationManager.AppSettings["CostumesThumb"] + c.Image_Url;
                        (rptrCostumes.Items[i].FindControl("btnEditCostume") as Button).PostBackUrl = "~/Admin/Content/EditCostumes.aspx?ID=" + c.id;
                        (rptrCostumes.Items[i].FindControl("btnDelete") as Button).ID = "btnDelete" + i;
                        (rptrCostumes.Items[i].FindControl("btnDelete" + i) as Button).CommandArgument = c.id.ToString();
                        ++i;
                    }
                }
                return;
            }
            btnEdit.Visible = true;
            btnSubmit.Visible = false;
            btnCancel.Visible = true;
            rptrCostumes.Visible = false;
            if (!PostBack)
            {
                PostBack = true;
                Costume costume = crud.GetCostume(CostumeID);
                if (costume == null) return;
                tbCostumeTitle.Text = costume.Title;
                tbCostumeDescription.Text = costume.Description;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Validate("Costume");
            if (Page.IsValid)
            {
                Costume costume = new Costume();
                costume.Title = tbCostumeTitle.Text.Trim();
                costume.Description = tbCostumeDescription.Text.Trim();
                if (PictureUpload.HasFile)
                {
                    Guid imgFileName = Guid.NewGuid();
                    costume.Image_Url = imgFileName.ToString() + ".jpg";
                    ResizerJPG.SaveAsJpg(Server.MapPath(ConfigurationManager.AppSettings["CostumesPictures"] + imgFileName.ToString() + ".jpg"), System.Drawing.Image.FromStream(PictureUpload.FileContent), 50L);
                    ResizerJPG.ResizeImage(Server.MapPath(ConfigurationManager.AppSettings["CostumesPictures"] + imgFileName.ToString() + ".jpg"), Server.MapPath(ConfigurationManager.AppSettings["CostumesThumb"] + imgFileName.ToString() + ".jpg"), 150, 138, true, 50L);
                }
                crud.SetCostume(costume);
                Response.Redirect("~/Admin/Content/EditCostumes.aspx");
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Validate("Costume");
            if (Page.IsValid)
            {
                Costume editedCostume = crud.GetCostume(CostumeID);
                editedCostume.Title = tbCostumeTitle.Text.Trim();
                editedCostume.Description = tbCostumeDescription.Text.Trim();
                if (PictureUpload.HasFile)
                {
                    File.Delete(Server.MapPath(ConfigurationManager.AppSettings["CostumesPictures"] + editedCostume.Image_Url));
                    File.Delete(Server.MapPath(ConfigurationManager.AppSettings["CostumesThumb"] + editedCostume.Image_Url));
                    Guid imgFileName = Guid.NewGuid();
                    editedCostume.Image_Url = imgFileName.ToString() + ".jpg";
                    ResizerJPG.SaveAsJpg(Server.MapPath(ConfigurationManager.AppSettings["CostumesPictures"] + imgFileName.ToString() + ".jpg"), System.Drawing.Image.FromStream(PictureUpload.FileContent), 50L);
                    ResizerJPG.ResizeImage(Server.MapPath(ConfigurationManager.AppSettings["CostumesPictures"] + imgFileName.ToString() + ".jpg"), Server.MapPath(ConfigurationManager.AppSettings["CostumesThumb"] + imgFileName.ToString() + ".jpg"), 150, 138, true, 50L);
                }
                crud.EditCostume(editedCostume);
                PostBack = false;
                Response.Redirect("~/Admin/Content/EditCostumes.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            PostBack = false;
            Response.Redirect("~/Admin/Content/EditCostumes.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int id;
            if (int.TryParse((sender as Button).CommandArgument, out id))
            {
                Costume costume = crud.GetCostume(id);
                if (File.Exists(Server.MapPath(ConfigurationManager.AppSettings["CostumesPictures"] + costume.Image_Url)) || File.Exists(Server.MapPath(ConfigurationManager.AppSettings["CostumesThumb"] + costume.Image_Url)))
                {
                    File.Delete(Server.MapPath(ConfigurationManager.AppSettings["CostumesPictures"] + costume.Image_Url));
                    File.Delete(Server.MapPath(ConfigurationManager.AppSettings["CostumesThumb"] + costume.Image_Url));
                }
                crud.DeleteCostume(costume);
                Response.Redirect("~/Admin/Content/EditCostumes.aspx");
            }
        }
    }
}
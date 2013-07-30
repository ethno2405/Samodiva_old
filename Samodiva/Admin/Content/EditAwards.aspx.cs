using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Samodiva.Data_Source;
using Samodiva.Class_Library;
using System.Configuration;
using System.IO;

namespace Samodiva.Admin
{
    public partial class EditAwards : System.Web.UI.Page
    {
        private static bool PostBack = false;
        protected AwardCRUD crud = new AwardCRUD();
        protected int AwardID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.UrlReferrer == null) PostBack = false;
            if (!int.TryParse(Request.QueryString["ID"], out AwardID))
            {
                
                btnCancel.Visible = false;
                btnSubmitAward.Visible = true;
                btnEditAward.Visible = false;
                IEnumerable<Award> awards = crud.GetAwards();

                rptrAwards.Visible = true;
                rptrAwards.DataSource = awards.ToList();
                rptrAwards.DataBind();
                int i = 0;
                foreach (Award a in awards)
                {
                    (rptrAwards.Items[i].FindControl("lblAwardDate") as Label).Text = a.Date.ToShortDateString();
                    (rptrAwards.Items[i].FindControl("lblAwardTitle") as Label).Text = a.Title;
                    (rptrAwards.Items[i].FindControl("imgAward") as Image).ImageUrl = ConfigurationManager.AppSettings["AwardsThumb"] + a.Image_Url;
                    (rptrAwards.Items[i].FindControl("litDescription") as Literal).Text = a.Description;
                    (rptrAwards.Items[i].FindControl("btnEdit") as Button).PostBackUrl = "~/Admin/Content/EditAwards.aspx?ID=" + a.id;
                    (rptrAwards.Items[i].FindControl("btnDelete") as Button).ID = "btnDelete" + i;
                    (rptrAwards.Items[i].FindControl("btnDelete" + i) as Button).CommandArgument = a.id.ToString();
                    ++i;
                }
                return;
            }
            btnSubmitAward.Visible = false;
            btnEditAward.Visible = true;
            rptrAwards.Visible = false;
            btnCancel.Visible = true;
            if (!PostBack)
            {
                PostBack = true;
                Award EditAward = crud.GetAward(AwardID);
                tbAwardTitle.Text = EditAward.Title;
                tbAwardDescription.Text = EditAward.Description;
            }
        }

        protected void btnSubmitAward_Click(object sender, EventArgs e)
        {
            Validate("NewAward");
            Validate("AwardPicture");
            if (Page.IsValid)
            {
                Award newAward = new Award();
                newAward.Title = tbAwardTitle.Text.Trim();
                newAward.Description = tbAwardDescription.Text.Trim();
                Guid imgFileName = Guid.NewGuid();
                newAward.Image_Url = imgFileName.ToString() + ".jpg";
                newAward.Date = DateTime.Now;
                ResizerJPG.SaveAsJpg(Server.MapPath(ConfigurationManager.AppSettings["AwardsPictures"] + imgFileName.ToString() + ".jpg"), System.Drawing.Image.FromStream(PictureUpload.FileContent), 50L);
                ResizerJPG.ResizeImage(Server.MapPath(ConfigurationManager.AppSettings["AwardsPictures"] + imgFileName.ToString() + ".jpg"), Server.MapPath(ConfigurationManager.AppSettings["AwardsThumb"] + imgFileName.ToString() + ".jpg"), 150, 134, true, 50L);
                crud.SetNewAward(newAward);
                Response.Redirect("~/Admin/Content/EditAwards.aspx");
            }
        }

        protected void btnEditAward_Click(object sender, EventArgs e)
        {
            Validate("NewAward");
            if (!Page.IsValid) return;
            Award editedAward = crud.GetAward(AwardID);
            if (editedAward != null)
            {
                editedAward.Title = tbAwardTitle.Text.Trim();
                editedAward.Description = tbAwardDescription.Text.Trim();
                if (PictureUpload.HasFile)
                {
                    File.Delete(Server.MapPath(ConfigurationManager.AppSettings["AwardsPictures"] + editedAward.Image_Url));
                    File.Delete(Server.MapPath(ConfigurationManager.AppSettings["AwardsThumb"] + editedAward.Image_Url));
                    Guid imgFileName = Guid.NewGuid();
                    editedAward.Image_Url = imgFileName.ToString() + ".jpg";
                    ResizerJPG.SaveAsJpg(Server.MapPath(ConfigurationManager.AppSettings["AwardsPictures"] + imgFileName.ToString() + ".jpg"), System.Drawing.Image.FromStream(PictureUpload.FileContent), 50L);
                    ResizerJPG.ResizeImage(Server.MapPath(ConfigurationManager.AppSettings["AwardsPictures"] + imgFileName.ToString() + ".jpg"), Server.MapPath(ConfigurationManager.AppSettings["AwardsThumb"] + imgFileName.ToString() + ".jpg"), 150, 134, true, 50L);
                }

                crud.EditAward(editedAward);
                PostBack = false;
                Response.Redirect("~/Admin/Content/EditAwards.aspx");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int id;
            if (int.TryParse((sender as Button).CommandArgument, out id))
            {
                Award a = crud.GetAward(id);
                if (a == null) return;
                File.Delete(Server.MapPath(ConfigurationManager.AppSettings["AwardsPictures"] + a.Image_Url));
                File.Delete(Server.MapPath(ConfigurationManager.AppSettings["AwardsThumb"] + a.Image_Url));
                crud.DeleteAward(a);
                Response.Redirect("~/Admin/Content/EditAwards.aspx");
            }
        }
    }
}
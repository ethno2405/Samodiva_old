using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Samodiva.Data_Source;
using Samodiva.Class_Library;
using System.IO;

namespace Samodiva.Admin
{
    public partial class Pictures : System.Web.UI.Page
    {
        protected int PictureID;

        protected PictureCRUD pictureCrud = new PictureCRUD();

        protected CategoryCRUD categoryCrud = new CategoryCRUD();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.TryParse(Request.QueryString["ID"], out PictureID))
            {
                mvPictures.SetActiveView(vSinglePicture);
                Data_Source.Picture pic = pictureCrud.GetPicture(PictureID);
                if (pic == null) return;
                lblTitle.Text = pic.Title;
                lblDescription.Text = pic.Description;
                imgPicture.ImageUrl = ConfigurationManager.AppSettings["Pictures"] + pic.URL;
                lblDate.Text = pic.Date.ToShortDateString();
                btnEdit.PostBackUrl = "~/Admin/Content/EditPicture.aspx?ID=" + pic.Id;
                btnDelete.CommandArgument = pic.Id.ToString();
                return;
            }

            mvPictures.SetActiveView(vAllPictures);

            var categories = categoryCrud.GetAllCategories();
            ddlCategories.Items.Add(new ListItem("None", "None"));
            foreach (var caregory in categories)
            {
                ddlCategories.Items.Add(new ListItem(caregory.Name.Trim(), caregory.Id.ToString()));
            }

            IEnumerable<Picture> Pictures = pictureCrud.GetAllPictures();
            if (rptrPictures.Visible = Pictures.Any())
            {
                rptrPictures.DataSource = Pictures.ToList();
                rptrPictures.DataBind();
                int i = 0;
                foreach (Picture pic in Pictures)
                {
                    (rptrPictures.Items[i].FindControl("lblPictureTitle") as Label).Text = pic.Title;
                    (rptrPictures.Items[i].FindControl("imgPicture") as ImageButton).ImageUrl = ConfigurationManager.AppSettings["PicturesThumb"] + pic.URL;
                    (rptrPictures.Items[i].FindControl("imgPicture") as ImageButton).PostBackUrl = "~/Admin/Content/Pictures.aspx?ID=" + pic.Id;
                    (rptrPictures.Items[i].FindControl("lblPicturePostedOn") as Label).Text = pic.Date.ToShortDateString();
                    (rptrPictures.Items[i].FindControl("btnPictureEdit") as Button).ID = "btnPictureEdit" + i;
                    (rptrPictures.Items[i].FindControl("btnPictureEdit" + i) as Button).PostBackUrl = "~/Admin/Content/EditPicture.aspx?ID=" + pic.Id;
                    (rptrPictures.Items[i].FindControl("btnPictureDelete") as Button).ID = "btnPictureDelete" + i;
                    (rptrPictures.Items[i].FindControl("btnPictureDelete" + i) as Button).CommandArgument = pic.Id.ToString();
                    ++i;
                }
            }
        }

        protected void btnSubmitPicture_Click(object sender, EventArgs e)
        {
            Validate("Pictures");
            if (Page.IsValid)
            {
                Picture newPic = new Picture();
                newPic.Title = tbPictureTitle.Text.Trim();
                newPic.Description = tbPictureDescription.Text.Trim();
                newPic.Date = DateTime.Now;
                int categoryId;
                if (int.TryParse(ddlCategories.SelectedItem.Value, out categoryId))
                {
                    newPic.CategoryId = categoryId;
                }
                
                Guid imgFileName = Guid.NewGuid();
                newPic.URL = imgFileName + ".jpg";
                ResizerJPG.SaveAsJpg(Server.MapPath(ConfigurationManager.AppSettings["Pictures"] + imgFileName + ".jpg"), System.Drawing.Image.FromStream(PictureUpload.FileContent), 50L);
                ResizerJPG.ResizeImage(Server.MapPath(ConfigurationManager.AppSettings["Pictures"] + imgFileName + ".jpg"), Server.MapPath(ConfigurationManager.AppSettings["PicturesThumb"] + imgFileName + ".jpg"), 240, 180, true, 50L);
                pictureCrud.SetPicture(newPic);
                XmlGalleryBuilder.WriteBigXML("big.xml");
                XmlGalleryBuilder.WriteThumbsXML("thumbs.xml");
                Response.Redirect("~/Admin/Content/Pictures.aspx");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int id;
            if (int.TryParse((sender as Button).CommandArgument, out id))
            {
                Picture pic = pictureCrud.GetPicture(id);
                File.Delete(Server.MapPath(ConfigurationManager.AppSettings["Pictures"] + pic.URL));
                File.Delete(Server.MapPath(ConfigurationManager.AppSettings["PicturesThumb"] + pic.URL));
                pictureCrud.DeletePicture(pic);
                XmlGalleryBuilder.WriteBigXML("big.xml");
                XmlGalleryBuilder.WriteThumbsXML("thumbs.xml");
                Response.Redirect("~/Admin/Content/Pictures.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Content/Pictures.aspx");
        }
    }
}
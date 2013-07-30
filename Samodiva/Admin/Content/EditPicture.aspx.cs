using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Samodiva.Data_Source;
using Samodiva.Class_Library;

namespace Samodiva.Admin
{
    public partial class EditPicture : System.Web.UI.Page
    {
        protected PictureCRUD pictureCrud = new PictureCRUD();

        protected CategoryCRUD categoryCrud = new CategoryCRUD();

        protected int PicID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.TryParse(Request.QueryString["ID"], out PicID))
            {
                if (!IsPostBack)
                {
                    Data_Source.Picture pic = pictureCrud.GetPicture(PicID);
                    if (pic == null) return;
                    var categories = categoryCrud.GetAllCategories();
                    ddlCategories.Items.Add(new ListItem("None", "None"));
                    foreach (var caregory in categories)
                    {
                        ddlCategories.Items.Add(new ListItem(caregory.Name.Trim(), caregory.Id.ToString()));
                    }

                    if (pic.CategoryId.HasValue)
                    {
                        ddlCategories.Items.FindByValue(pic.CategoryId.Value.ToString()).Selected = true;
                    }
                    else
                    {
                        ddlCategories.Items.FindByValue("None");
                    }

                    tbTitle.Text = pic.Title;
                    tbDescription.Text = pic.Description;
                    imgPicture.ImageUrl = ConfigurationManager.AppSettings["Pictures"] + pic.URL;
                    lblDate.Text = pic.Date.ToShortDateString();
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Validate("Picture");
            if (Page.IsValid)
            {
                Data_Source.Picture pic = pictureCrud.GetPicture(PicID);
                pic.Title = tbTitle.Text.Trim();
                pic.Description = tbDescription.Text.Trim();
                if (fuPicture.HasFile)
                {
                    File.Delete(Server.MapPath(ConfigurationManager.AppSettings["Pictures"] + pic.URL));
                    File.Delete(Server.MapPath(ConfigurationManager.AppSettings["PicturesThumb"] + pic.URL));
                    Guid imgFileName = Guid.NewGuid();
                    pic.URL = imgFileName.ToString() + ".jpg";
                    ResizerJPG.SaveAsJpg(Server.MapPath(ConfigurationManager.AppSettings["Pictures"] + pic.URL), System.Drawing.Image.FromStream(fuPicture.FileContent), 50L);
                    ResizerJPG.ResizeImage(Server.MapPath(ConfigurationManager.AppSettings["Pictures"] + pic.URL), Server.MapPath(ConfigurationManager.AppSettings["PicturesThumb"] + pic.URL), 528, 360, true, 50L);
                }

                int categoryId;
                if (int.TryParse(ddlCategories.SelectedValue, out categoryId))
                {
                    pic.CategoryId = categoryId;
                }
                else
                {
                    pic.CategoryId = null;
                }
                
                pictureCrud.EditPicture(pic);
                XmlGalleryBuilder.WriteBigXML("big.xml");
                XmlGalleryBuilder.WriteThumbsXML("thumbs.xml");
                Response.Redirect("~/Admin/Content/Pictures.aspx");
            }
        }
    }
}
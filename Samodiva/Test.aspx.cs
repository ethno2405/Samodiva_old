using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Samodiva.Data_Source;
using System.Configuration;
using Samodiva.Class_Library;

namespace Samodiva
{
    public partial class Test : System.Web.UI.Page
    {
        protected CategoryCRUD categoryCrud = new CategoryCRUD();

        protected PictureCRUD pictureCrud = new PictureCRUD();

        protected void Page_Load(object sender, EventArgs e)
        {
            int categoryId;
            var categories = categoryCrud.GetAllCategories().ToList();
            rptrCategories.DataSource = categories;
            rptrCategories.DataBind();

            var i = 0;
            foreach (var cat in categories)
            {
                (rptrCategories.Items[i].FindControl("hlCategoryName") as HyperLink).Text = cat.Name;
                (rptrCategories.Items[i].FindControl("hlCategoryName") as HyperLink).NavigateUrl = string.Format("~/Test.aspx?categoryId={0}", cat.Id);
                i++;
            }

            if (!int.TryParse(Request.QueryString["categoryId"], out categoryId) )
            {
                var pictures = pictureCrud.GetAllPictures();
                rptrPictures.DataSource = pictures;
                rptrPictures.DataBind();

                var j = 0;
                foreach (var picture in pictures)
                {
                    (rptrPictures.Items[j].FindControl("hlPicture") as HyperLink).ImageUrl = string.Concat(ConfigurationManager.AppSettings["PicturesThumb"], picture.URL);
                    (rptrPictures.Items[j].FindControl("lblTitle") as Label).Text = picture.Title;
                    (rptrPictures.Items[j].FindControl("lblShorDescription") as Label).Text = picture.Description.Length >= 80 ? StripHTML.Strip(string.Concat(picture.Description.Substring(0, 80), "...")) : StripHTML.Strip(picture.Description);
                    j++;
                }

                return;
            }

            var category = categoryCrud.GetCategory(categoryId);
            if (category == null)
            {
                return;
            }

            rptrPictures.DataSource = category.Pictures;
            rptrPictures.DataBind();

            var index = 0;
            foreach (var picture in category.Pictures)
            {
                (rptrPictures.Items[index].FindControl("hlPicture") as HyperLink).ImageUrl = string.Concat(ConfigurationManager.AppSettings["PicturesThumb"], picture.URL);
                (rptrPictures.Items[index].FindControl("lblTitle") as Label).Text = picture.Title;
                (rptrPictures.Items[index].FindControl("lblShorDescription") as Label).Text = picture.Description.Length >= 80 ? StripHTML.Strip(string.Concat(picture.Description.Substring(0, 80), "...")) : StripHTML.Strip(picture.Description);
                index++;
            }
        }
    }
}
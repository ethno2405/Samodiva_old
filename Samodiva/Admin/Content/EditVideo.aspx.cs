using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Samodiva.Data_Source;
using Samodiva.Class_Library;

namespace Samodiva.Admin
{
    public partial class EditVideo : System.Web.UI.Page
    {
        protected VideoCRUD crud = new VideoCRUD();
        protected int VidID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.TryParse(Request.QueryString["ID"], out VidID))
            {
                if (!IsPostBack)
                {
                    Video vid = crud.GetVideo(VidID);
                    if (vid == null) return;
                    tbTitle.Text = vid.Title;
                    tbDescription.Text = vid.Description;
                    tbURL.Text = vid.URL;
                    lblDate.Text = vid.Date.ToShortDateString();
                    litEmbed.Text = "<embed pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src=\"" + vid.URL.Replace("watch?v=", "v/") + "\" width=\"600px\" height=\"450px\" type=\"application/x-shockwave-flash\" wmode=\"transparent\" quality=\"high\" scale=\"exactfit\" allowfullscreen=\"true\">";
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Validate("Video");
            if (IsValid)
            {
                Video vid = crud.GetVideo(VidID);
                if (vid == null) return;
                vid.Title = tbTitle.Text.Trim();
                vid.Description = tbDescription.Text.Trim();
                vid.URL = tbURL.Text.Trim();
                vid.ThumbURL = "//i1.ytimg.com/vi/" + vid.URL.Substring(vid.URL.IndexOf("v=") + 2, 11) + "/default.jpg";
                crud.EditVideo(vid);
                XmlGalleryBuilder.WriteVideoXML("videos.xml");
                Response.Redirect("~/Admin/Content/Videos.aspx");
            }
        }
    }
}
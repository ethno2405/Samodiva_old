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
    public partial class Videos : System.Web.UI.Page
    {
        protected VideoCRUD crud = new VideoCRUD();
        protected int VidID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.TryParse(Request.QueryString["ID"], out VidID))
            {
                mvVideos.SetActiveView(vSingleVideo);
                Video vid = crud.GetVideo(VidID);
                if (vid == null) return;
                lblTitle.Text = vid.Title;
                lblDate.Text = vid.Date.ToShortDateString();
                litEmbed.Text = "<embed pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src=\"" + vid.URL.Replace("watch?v=", "v/") + "\" width=\"600px\" height=\"450px\" type=\"application/x-shockwave-flash\" wmode=\"transparent\" quality=\"high\" scale=\"exactfit\" allowfullscreen=\"true\">";
                lblDescription.Text = vid.Description;
                btnEdit.PostBackUrl = "~/Admin/Content/EditVideo.aspx?ID=" + vid.Id;
                btnDelete.CommandArgument = vid.Id.ToString();
                return;
            }
            mvVideos.SetActiveView(vAllVideos);
            IEnumerable<Video> vids = crud.GetAllVideos();
            if (rptrVideos.Visible = vids.Any())
            {
                rptrVideos.DataSource = vids.ToList();
                rptrVideos.DataBind();
                int i = 0;
                foreach (Video v in vids)
                {
                    (rptrVideos.Items[i].FindControl("lblVideoTitle") as Label).Text = v.Title;
                    (rptrVideos.Items[i].FindControl("ibVideoThumb") as ImageButton).ImageUrl = v.ThumbURL;
                    (rptrVideos.Items[i].FindControl("ibVideoThumb") as ImageButton).PostBackUrl = "~/Admin/Content/Videos.aspx?ID=" + v.Id;
                    (rptrVideos.Items[i].FindControl("lblVideoPostedOn") as Label).Text = v.Date.ToShortDateString();
                    (rptrVideos.Items[i].FindControl("btnEditVideo") as Button).ID = "btnEditVideo" + i;
                    (rptrVideos.Items[i].FindControl("btnEditVideo" + i) as Button).PostBackUrl = "~/Admin/Content/EditVideo.aspx?ID=" + v.Id;
                    (rptrVideos.Items[i].FindControl("btnDeleteVideo") as Button).ID = "btnDeleteVideo" + i;
                    (rptrVideos.Items[i].FindControl("btnDeleteVideo" + i) as Button).CommandArgument = v.Id.ToString();
                    ++i;
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int id;
            if (int.TryParse((sender as Button).CommandArgument, out id))
            {
                crud.DeleteVideo(id);
                XmlGalleryBuilder.WriteVideoXML("videos.xml");
            }
            Response.Redirect("~/Admin/Content/Videos.aspx");
        }

        protected void btnSubmitVideo_Click(object sender, EventArgs e)
        {
            Validate("Video");
            if (IsValid)
            {
                Video vid = new Video();
                vid.Title = tbVideoTitle.Text.Trim();
                vid.Description = tbVideoDescription.Text.Trim();
                vid.Date = DateTime.Now;
                vid.URL = tbVideoLink.Text.Trim();
                if (vid.URL.Contains("&"))
                {
                    vid.URL = vid.URL.Remove(vid.URL.IndexOf("&"));
                }

                vid.ThumbURL = "//i1.ytimg.com/vi/" + vid.URL.Substring(vid.URL.IndexOf("v=") + 2, 11) + "/default.jpg";
                crud.SetVideo(vid);
                XmlGalleryBuilder.WriteVideoXML("videos.xml");
                Response.Redirect("~/Admin/Content/Videos.aspx");
            }
        }
    }
}
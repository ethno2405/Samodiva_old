using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Samodiva.Data_Source;
using System.Configuration;
using System.IO;
using Samodiva.Class_Library;

namespace Samodiva.Admin.Content
{
    public partial class EditTheBest : System.Web.UI.Page
    {
        protected int BestID;
        protected ParticipantCRUD crud = new ParticipantCRUD();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.TryParse(Request.QueryString["ID"], out BestID))
            {
                if (!IsPostBack)
                {
                    Participant best = crud.GetTheBest(BestID);
                    if (best == null) return;
                    tbName.Text = best.Name;
                    tbText.Text = best.Text;
                    lblDate.Text = best.Date.ToShortDateString();
                    imgPicture.ImageUrl = ConfigurationManager.AppSettings["TheBestPictures"] + best.Image_URL;
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Validate("TheBest");
            if (IsValid)
            {
                Participant best = crud.GetTheBest(BestID);
                best.Name = tbName.Text.Trim();
                best.Text = tbText.Text.Trim();
                if (fuPictures.HasFile)
                {
                    File.Delete(Server.MapPath(ConfigurationManager.AppSettings["TheBestPictures"] + best.Image_URL));
                    File.Delete(Server.MapPath(ConfigurationManager.AppSettings["TheBestThumb"] + best.Image_URL));
                    Guid imgFileName = Guid.NewGuid();
                    best.Image_URL = imgFileName + ".jpg";
                    ResizerJPG.SaveAsJpg(Server.MapPath(ConfigurationManager.AppSettings["TheBestPictures"] + best.Image_URL), System.Drawing.Image.FromStream(fuPictures.FileContent), 50L);
                    ResizerJPG.ResizeImage(Server.MapPath(ConfigurationManager.AppSettings["TheBestPictures"] + best.Image_URL), Server.MapPath(ConfigurationManager.AppSettings["TheBestThumb"] + best.Image_URL), 528, 360, true, 50L);
                }
                crud.EditTheBest(best);
                Response.Redirect("~/Admin/Content/TheBest.aspx");
            }
        }
    }
}
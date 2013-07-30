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
    public partial class MenageTheBest : System.Web.UI.Page
    {
        protected ParticipantCRUD crud = new ParticipantCRUD();
        protected int BestID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.TryParse(Request.QueryString["ID"], out BestID))
            {
                mvTheBest.SetActiveView(vSingle);
                Participant thebest = crud.GetTheBest(BestID);
                if (thebest == null) return;
                btnDelete.Visible = true;
                btnEdit.Visible = true;
                lblName.Text = thebest.Name;
                lblText.Text = thebest.Text;
                imgTheBest.ImageUrl = ConfigurationManager.AppSettings["TheBestPictures"] + thebest.Image_URL;
                lblDate.Text = thebest.Date.ToShortDateString();
                btnEdit.PostBackUrl = "~/Admin/Content/EditTheBest.aspx?ID=" + thebest.id;
                btnDelete.CommandArgument = thebest.id.ToString();
                return;
            }
            mvTheBest.SetActiveView(vAll);
            IEnumerable<Participant> allTheBest = crud.GetAllParticipants();
            if (rptrTheBest.Visible = allTheBest.Any())
            {
                rptrTheBest.DataSource = allTheBest.ToList();
                rptrTheBest.DataBind();

                int i = 0;
                foreach (Participant p in allTheBest)
                {
                    (rptrTheBest.Items[i].FindControl("lblName") as Label).Text = p.Name;
                    (rptrTheBest.Items[i].FindControl("lblDate") as Label).Text = p.Date.ToShortDateString();
                    (rptrTheBest.Items[i].FindControl("imgTheBest") as ImageButton).ImageUrl = ConfigurationManager.AppSettings["TheBestThumb"] + p.Image_URL;
                    (rptrTheBest.Items[i].FindControl("imgTheBest") as ImageButton).PostBackUrl = "~/Admin/Content/TheBest.aspx?ID=" + p.id;
                    (rptrTheBest.Items[i].FindControl("litDescriptionTheBest") as Literal).Text = p.Text;
                    (rptrTheBest.Items[i].FindControl("btnEdit") as Button).PostBackUrl = "~/Admin/Content/EditTheBest.aspx?ID=" + p.id;
                    (rptrTheBest.Items[i].FindControl("btnDelete") as Button).ID = "btnDelete" + i;
                    (rptrTheBest.Items[i].FindControl("btnDelete" + i) as Button).CommandArgument = p.id.ToString();
                    ++i;
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int id;
            if (int.TryParse((sender as Button).CommandArgument, out id))
            {
                Participant thebest = crud.GetTheBest(id);
                if (thebest == null) return;
                if (File.Exists(Server.MapPath(ConfigurationManager.AppSettings["TheBestPictures"] + thebest.Image_URL)))
                {
                    File.Delete(Server.MapPath(ConfigurationManager.AppSettings["TheBestPictures"] + thebest.Image_URL));
                    File.Delete(Server.MapPath(ConfigurationManager.AppSettings["TheBestThumb"] + thebest.Image_URL));
                }
                crud.DeleleTheBest(thebest);
                Response.Redirect("~/Admin/Content/TheBest.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Validate("TheBest");
            if (IsValid)
            {
                Participant thebest = new Participant();
                thebest.Name = tbName.Text.Trim();
                thebest.Text = tbText.Text.Trim();
                thebest.Date = DateTime.Now;
                if (PictureUpload.HasFile)
                {
                    Guid imgFileName = Guid.NewGuid();
                    thebest.Image_URL = imgFileName + ".jpg";
                    ResizerJPG.SaveAsJpg(Server.MapPath(ConfigurationManager.AppSettings["TheBestPictures"] + thebest.Image_URL), System.Drawing.Image.FromStream(PictureUpload.FileContent), 50L);
                    ResizerJPG.ResizeImage(Server.MapPath(ConfigurationManager.AppSettings["TheBestPictures"] + thebest.Image_URL), Server.MapPath(ConfigurationManager.AppSettings["TheBestThumb"] + thebest.Image_URL), 240, 180, true, 50L);
                }
                crud.SetTheBest(thebest);
                Response.Redirect("~/Admin/Content/TheBest.aspx");
            }
        }
    }
}
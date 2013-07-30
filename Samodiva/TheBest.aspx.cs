using Samodiva.Data_Source;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Samodiva
{
    public partial class TheBest : System.Web.UI.Page
    {
        protected ParticipantCRUD crud = new ParticipantCRUD();
        protected int TheBestID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.TryParse(Request.QueryString["ID"], out TheBestID))
            {
                mvTheBest.SetActiveView(vSingle);
                Participant theBest = crud.GetTheBest(TheBestID);
                if (theBest == null) return;
                lblName.Text = theBest.Name;
                imgPicture.ImageUrl = string.Concat(ConfigurationManager.AppSettings["TheBestPictures"], theBest.Image_URL);
                lblDate.Text = theBest.Date.ToShortDateString();
                litDescription.Text = theBest.Text;
                return;
            }

            mvTheBest.SetActiveView(vAll);
        }
    }
}
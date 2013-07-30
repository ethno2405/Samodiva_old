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
    public partial class Awards : System.Web.UI.Page
    {
        protected AwardCRUD crud = new AwardCRUD();
        protected int AwardID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.TryParse(Request.QueryString["ID"], out AwardID))
            {
                mvAwards.SetActiveView(vSingleAward);
                Data_Source.Award award = crud.GetAward(AwardID);
                if (award == null) return;
                lblTitle.Text = award.Title;
                imgPicture.ImageUrl = string.Concat(ConfigurationManager.AppSettings["AwardsPictures"], award.Image_Url);
                litDescription.Text = award.Description;
                lblDate.Text = award.Date.ToShortDateString();
                return;
            }

            mvAwards.SetActiveView(vAllAwards);
        }
    }
}
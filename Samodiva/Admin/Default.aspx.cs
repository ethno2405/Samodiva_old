using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Samodiva.Class_Library;
using Samodiva.Class_Library.Hash;
using Samodiva.Data_Source;

namespace Samodiva.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected UserCRUD crud = new UserCRUD();

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Hash.GetSHA256("24051991"));
        }

        protected void Login_Authenticate(object sender, AuthenticateEventArgs e)
        {
            Data_Source.User user = new Data_Source.User();

            string Password = Hash.GetSHA256((lvAdmin.FindControl("LoginForm") as Login).Password);
            string Username = (lvAdmin.FindControl("LoginForm") as Login).UserName;
            string IP = Request.ServerVariables["REMOTE_ADDR"];
            e.Authenticated = crud.Login(Username, Password, IP);
        }

        protected void Unnamed_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {
            Response.Redirect("~/Admin/Default.aspx");
        }

        protected void Unnamed_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            Response.Redirect("~/Admin/Default.aspx");
        }

        protected void Unnamed_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            Response.Redirect("~/Admin/Default.aspx");
        }
    }
}
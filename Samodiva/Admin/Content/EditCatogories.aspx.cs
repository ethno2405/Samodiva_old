using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Samodiva.Data_Source;

namespace Samodiva.Admin.Content
{
    public partial class EditCatogories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ListViewCategories_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            Validate("RequiredOnAdd");
            e.Cancel = !Page.IsValid;
        }

        protected void ListViewCategories_ItemEditing(object sender, ListViewUpdateEventArgs e)
        {
            Validate("RequiredOnEdit");
            e.Cancel = !Page.IsValid;
        }
    }
}
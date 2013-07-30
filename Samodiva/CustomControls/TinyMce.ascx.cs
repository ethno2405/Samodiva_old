using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Samodiva.CustomControls
{
    public partial class TinyMce : System.Web.UI.UserControl
    {
        public string ReadOnly
        {
            get;
            set;

        }
        private string _cssFile;
        public string cssFile{
            get{
                if (string.IsNullOrEmpty(_cssFile))
                {return "/CSS/Master.css";}
                else
                    return _cssFile;

            }
            set { _cssFile = value; }
        }
        public string ControlClass { get; set; }
        public string Width { get; set; }
        public string Height { get; set; }
        public string WrapDivClass { get; set; }
        public string Autoresize { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (ReadOnly == "true")
            {
                mvTinyMCE.SetActiveView(vReadOnly);
                vReadOnlyControlClass.Text = ControlClass;
                vReadOnlyCssFile.Text = cssFile;
                vReadOnlyHeight.Text = "height : \""+Height+"\",";
                vReadOnlyWidth.Text = Width;
                litWrapDivClass.Text ="."+WrapDivClass;
                if(Autoresize!="false")
                litAutoResize.Text = "plugins : \"autoresize\",";

            }
            else if (ReadOnly == "false")
            {
                mvTinyMCE.SetActiveView(vEditor);
                vEditorControlClass.Text = ControlClass;
                vEditorCSSFile.Text = cssFile;
                vReadOnlyWidth.Text = Width;
                vReadOnlyHeight.Text = "height : \"" + Height + "\",";
            }
            else
                throw new ArgumentException("The ReadOnly Value of TinyMce.ascx must be bool");
        }
    }
}
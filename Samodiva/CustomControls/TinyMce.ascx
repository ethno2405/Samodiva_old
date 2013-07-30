<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TinyMce.ascx.cs" Inherits="Samodiva.CustomControls.TinyMce" %>


<asp:Literal ID="litStartScript" runat="server" Text='<script type="text/javascript">'></asp:Literal>
<asp:MultiView ID="mvTinyMCE" runat="server">
    <asp:View ID="vReadOnly" runat="server">
        tinyMCE.init({
        mode: "specific_textareas",
        theme : "advanced",
        skin: "o2k7",
        skin_variant: "black",
        readonly: true,
        <asp:Literal ID="litAutoResize" runat="server"></asp:Literal>
        init_instance_callback : "myCustomInitInstance",
        editor_selector: "<asp:Literal ID="vReadOnlyControlClass" runat="server"></asp:Literal>",
        content_css: "<asp:Literal ID="vReadOnlyCssFile" runat="server"></asp:Literal>",
      <asp:Literal ID="vReadOnlyHeight" runat="server"></asp:Literal>
        width:"<asp:Literal ID="vReadOnlyWidth" runat="server"></asp:Literal>",
        theme_advanced_resizing: true,
        

    });
    function myCustomInitInstance(inst) {
    tinymce.dom.Event.add(inst.getWin(), 'resize', function(e) {
       var heights=$("<asp:Literal ID="litWrapDivClass" runat="server"></asp:Literal>").find("iframe").contents().find("html").height()+"px";
      //alert("try");
      //alert(heights);
        $(".mceIframeContainer").find("iframe").css('height', heights); 
          //console.debug(o.element.nodeName);
          //alert("win");
          // SetWidthsAndHeights();
            var midheight = ($("#middle").height() )
          $(".RightBackground").css("height", midheight + "px");
          $(".LeftBackground").css("height", midheight + "px");
          $("#LBorder").css("height", (midheight -115 ) + "px");
          $("#RBorder").css("height", (midheight -115) + "px");
    });
}
    
    


    </asp:View>
    <asp:View ID="vEditor" runat="server">
        tinyMCE.init({
        // General options
        mode: "specific_textareas",
        theme : "advanced",
        skin: "o2k7",
        skin_variant: "black",
        plugins: "autolink,lists,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",
        editor_selector: "<asp:Literal ID="vEditorControlClass" runat="server"></asp:Literal>",
        height : "<asp:Literal ID="vEditorHeight" runat="server"></asp:Literal>",
        width:"<asp:Literal ID="vEditorWidth" runat="server"></asp:Literal>",
      

        // Theme options
        theme_advanced_buttons1: "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
        theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
        theme_advanced_buttons3: "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
        theme_advanced_buttons4: "insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage",
        theme_advanced_toolbar_location: "top",
        theme_advanced_toolbar_align: "left",
        theme_advanced_statusbar_location: "bottom",
        theme_advanced_resizing: false,

        // Skin options

      

        // Example content CSS (should be your site CSS)
        content_css: "<asp:Literal ID="vEditorCSSFile" runat="server"></asp:Literal>",

         
        

        // Replace values for the template plugin
        template_replace_values: {
            username: "Some User",
            staffid: "991234"
        }
    });


    </asp:View>

</asp:MultiView>
<asp:Literal ID="litEndScript" runat="server" Text="</script>"></asp:Literal>
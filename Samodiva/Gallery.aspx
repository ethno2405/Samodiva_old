<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Samodiva.Gallery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Галерия</title>
    <script type="text/javascript" src="Scripts/animation.js"></script>
    <script type="text/javascript">
            
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="DivCustomizableGridGalleryFX"></div>
        <script type="text/javascript" src="grid-gallery/swfobject.js"></script>
        <script type="text/javascript">
            var flashvars = {};
            var params = {};
            params.base = "http://" + window.location.host + "/grid-gallery/";
            params.scale = "noscale";
            params.salign = "tl";
            params.wmode = "transparent";
            params.allowFullScreen = "true";
            params.allowScriptAccess = "always";
            var host = "http://" + window.location.host + "/grid-gallery/";
            swfobject.embedSWF( host + "CustomizableGridGalleryFX.swf", "DivCustomizableGridGalleryFX", "100%", $("#content").height()*0.997, "9.0.0", false, flashvars, params);
        </script>
        <div style="display:none" id="Gallery"></div>
    </form>
</body>
</html>

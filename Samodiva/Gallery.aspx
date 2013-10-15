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
        <%--<div id="DivCustomizableGridGalleryFX"></div>
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
        <div style="display:none" id="Gallery"></div>--%>
        <div id="controls"></div>
        <div id="loading"></div>
        <div id="slideshow"></div>
        <div id="caption"></div>
        <div id="thumbs">
            <%--<ul class="thumbs noscript">
                <asp:Repeater ID="rptPictures" runat="server">
                    <ItemTemplate>
                        <li>
                            <a class="thumb" name="optionalCustomIdentifier" href="path/to/slide" title="your image title">
                                <img src="path/to/thumbnail" alt="your image title again for graceful degradation" />
                            </a>
                            <div class="caption">
                                
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>--%>
                <asp:ListView ID="lvAwards" runat="server" DataSourceID="dsPictures">
                    <LayoutTemplate>
                        <ul class="AwardsList thumbs">
                            <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                        </ul>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <li>
                            <a class="thumb" name="optionalCustomIdentifier" href="<%# ConfigurationManager.AppSettings["Pictures"] + Eval("URL") %>" title="<%# Eval("Title") %>">
                                <img src="<%# ConfigurationManager.AppSettings["PicturesThumb"] + Eval("URL") %>" alt="<%# Eval("Title") %>" />
                            </a>
                            <div class="caption">
                                <p>
                                    <%# Eval("Description") %>
                                </p>
                                <p>
                                    <%# Eval("Date") %>
                                </p>
                            </div>
                        </li>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <h4>No pictures were found!
                        </h4>
                    </EmptyDataTemplate>
                </asp:ListView>
            <asp:EntityDataSource ID="dsPictures" runat="server" ConnectionString="name=SamodivaDBEntities" DefaultContainerName="SamodivaDBEntities" EnableFlattening="False" EntitySetName="Pictures"></asp:EntityDataSource>
            <%--</ul>--%>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Awards.aspx.cs" Inherits="Samodiva.Awards" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Награди</title>
    <script type="text/javascript" src="Scripts/animation.js"></script>
    <script type="text/javascript">
            
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:MultiView ID="mvAwards" runat="server">
            <asp:View ID="vAllAwards" runat="server">
                <asp:ListView ID="lvAwards" runat="server" DataSourceID="EntityDataSourceAwards">
                    <LayoutTemplate>
                        <ul class="AwardsList">
                            <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                        </ul>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <a onclick="Load('Awards.aspx?ID=<%# Eval("id") %>','#slider3')">
                            <li class="SingleAward">
                                <div class="imgBorder">
                                    <div class="imgSingleAward" style="background-image: url(Img/Awards/Thumbnails/<%# Eval("Image_Url") %>);"></div>
                                </div>
                                <span class="AwardTitle"><%# Eval("Title") %></span>
                            </li>
                        </a>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <h4>No pictures were found!
                        </h4>
                    </EmptyDataTemplate>
                </asp:ListView>
                <div style="display: none" id="Awards"></div>
                <asp:EntityDataSource runat="server" ID="EntityDataSourceAwards" DefaultContainerName="SamodivaDBEntities" ConnectionString="name=SamodivaDBEntities" EnableFlattening="False" EntitySetName="Awards" EntityTypeFilter="Award" Select="it.[id], it.[Title], it.[Image_Url], it.[Date]" OrderBy="it.Date DESC"></asp:EntityDataSource>
            </asp:View>
            <asp:View ID="vSingleAward" runat="server">
                <div class="PreviewAward">
                    <asp:Label ID="lblTitle" CssClass="PreviewTitle" runat="server"></asp:Label>
                    <br />
                    <asp:Image ID="imgPicture" CssClass="PreviewPicture" runat="server" />
                    <br />
                    <asp:Label ID="lblDate" CssClass="Date" runat="server"></asp:Label>
                    <div class="PreviewDescription">
                        <asp:Literal ID="litDescription" runat="server"></asp:Literal>
                    </div>
                    <a id="lbBack" onclick="Load('Awards.aspx','#slider3')" class="Link">Назад</a>
                </div>
            </asp:View>
        </asp:MultiView>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TheBest.aspx.cs" Inherits="Samodiva.TheBest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Най-добрите</title>
    <script type="text/javascript" src="Scripts/animation.js"></script>
    <script type="text/javascript">

    </script>
</head>
<body>
    <form runat="server">
        <asp:MultiView ID="mvTheBest" runat="server">
            <asp:View ID="vAll" runat="server">
                <asp:ListView ID="lvTheBest" runat="server" DataSourceID="EntityDataSourceTheBest">
                    <LayoutTemplate>
                        <ul class="TheBestList">
                            <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                        </ul>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <a onclick="Load('TheBest.aspx?ID=<%# Eval("id") %>','#slider5')">
                            <li class="TheBestThumb">
                                <div class="imgBorder">
                                    <div class="imgTheBest" style="background-image: url(Img/TheBest/Thumbnails/<%# Eval("Image_URL") %>);"></div>
                                </div>
                                <span id="lblTitle" class="TheBestName"><%# Eval("Name") %></span>
                            </li>
                        </a>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <h4>No pictures were found!
                        </h4>
                    </EmptyDataTemplate>
                </asp:ListView>
                <asp:EntityDataSource runat="server" ID="EntityDataSourceTheBest" DefaultContainerName="SamodivaDBEntities" ConnectionString="name=SamodivaDBEntities" EnableFlattening="False" EntitySetName="Participants" EntityTypeFilter="Participant" Select="it.[id], it.[Image_URL], it.[Name], it.[Date]" OrderBy="it.Date DESC"></asp:EntityDataSource>
                <div style="display: none" id="TheBest"></div>
            </asp:View>
            <asp:View ID="vSingle" runat="server">
                <asp:Label ID="lblName" runat="server" CssClass="PreviewTitle"></asp:Label>
                <br />
                <asp:Image ID="imgPicture" runat="server" CssClass="PreviewPicture" />
                <br />
                <asp:Label ID="lblDate" runat="server"></asp:Label>
                <div class="PreviewDescription">
                    <asp:Literal ID="litDescription" runat="server"></asp:Literal>
                </div>
                <a id="lbBack" runat="server" onclick="Load('TheBest.aspx','#slider5')" class="Link">Назад</a>
            </asp:View>
        </asp:MultiView>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Costumes.aspx.cs" Inherits="Samodiva.Costumes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Костюми</title>
    <script type="text/javascript" src="Scripts/animation.js"></script>
    <script type="text/javascript">
            
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:MultiView ID="mvCostumes" runat="server">
                    <asp:View ID="vAll" runat="server">
                        <asp:Repeater ID="rptrCostumes" runat="server">
                            <HeaderTemplate>
                                <ul class="CostumesList">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li class="SingleCostume" id="liCostume" runat="server">
                                    <asp:Label ID="lblTitle" CssClass="SingleCostumeTitle" runat="server"></asp:Label>
                                    <div class="imgBorder">
                                        <div id="ibCostume" runat="server" class="CostumeImage"></div>
                                    </div>
                                    <asp:Label ID="lblShortDescription" CssClass="CostumeDescription" runat="server"></asp:Label>
                                </li>
                            </ItemTemplate>
                            <FooterTemplate>
                                </ul>
                            </FooterTemplate>
                        </asp:Repeater>
                        <div style="display:none" id="Costumes"></div>
                    </asp:View>
                    <asp:View ID="vSingle" runat="server">
                        <asp:Label ID="lblTitle" runat="server" CssClass="PreviewTitle"></asp:Label>
                        <asp:Image ID="imgPicture" runat="server" CssClass="PreviewPicture" />
                        <div class="PreviewDescription">
                            <asp:Literal ID="litDescription" runat="server" />
                        </div>
                        <a id="lbBack" class="Link" onclick="Load('Costumes.aspx','#slider6')">Назад</a>
                    </asp:View>
                </asp:MultiView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>

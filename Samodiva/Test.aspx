<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Samodiva.Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="rptrCategories" runat="server">
            <HeaderTemplate>
                <ul>
                    <li>
                        <asp:HyperLink ID="hlCategoryName" runat="server" Text="All" NavigateUrl="~/Test.aspx"></asp:HyperLink>
                    </li>
            </HeaderTemplate>
            <ItemTemplate>
                <li>
                    <asp:HyperLink ID="hlCategoryName" runat="server"></asp:HyperLink>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
        <asp:Repeater ID="rptrPictures" runat="server">
            <HeaderTemplate>
                <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li>
                    <asp:Label ID="lblTitle" runat="server" />
                    <asp:HyperLink ID="hlPicture" runat="server"></asp:HyperLink>
                    <asp:Label ID="lblShorDescription" runat="server" />
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
    </div>
    </form>
</body>
</html>

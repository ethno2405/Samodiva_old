<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="PreviewCostume.aspx.cs" Inherits="Samodiva.Admin.PreviewCostume" %>
<asp:Content ID="Content1" ContentPlaceHolderID="phAdminHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phAdminContent" runat="server">
    <asp:Label ID="LabelTitle" runat="server" Text="Title:"></asp:Label>
    <asp:Label ID="lblTitle" runat="server"></asp:Label>
    <asp:Image ID="imgPicture" runat="server" />
    <asp:Label ID="lblNoPicture" runat="server" Text="Picture not found!" Visible="false"></asp:Label>
    <asp:Label ID="lblDescription" runat="server" Text="Description:"></asp:Label>
    <p>
        <asp:Literal ID="litDesctiption" runat="server"></asp:Literal>
    </p>
    <asp:Button ID="btnEdit" runat="server" Text="Edit" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
</asp:Content>

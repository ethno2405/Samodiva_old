<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="PreviewNews.aspx.cs" Inherits="Samodiva.Admin.PreviewNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="phAdminHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phAdminContent" runat="server">
    <asp:Label ID="LabelTitle" runat="server" Text="Title:"/>
    <asp:Label ID="lblTitle" runat="server" />
    <br />
    <asp:Label ID="Date" runat="server" Text="Date:"></asp:Label>
    <asp:Label ID="lblDate" runat="server"></asp:Label>
    <br />
    <asp:Label ID="Body" runat="server" Text="Body:"></asp:Label>
    <p> 
        <asp:Literal ID="litBody" runat="server"></asp:Literal>
    </p>
    <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
</asp:Content>

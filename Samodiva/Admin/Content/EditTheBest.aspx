<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EditTheBest.aspx.cs" Inherits="Samodiva.Admin.Content.EditTheBest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="phAdminHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phAdminContent" runat="server">
    <asp:Label ID="lblName" runat="server" Text="Name:" AssociatedControlID="tbName"></asp:Label>
    <asp:TextBox ID="tbName" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="tbName" ErrorMessage="Title is required!" ValidationGroup="TheBest"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="revName" runat="server" ControlToValidate="tbName" ErrorMessage="Title must be between 1 and 128 symbols!"  ValidationExpression=".{0,128}" ValidationGroup="TheBest"></asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="lblText" runat="server" Text="Text:" AssociatedControlID="tbText"></asp:Label>
    <asp:TextBox ID="tbText" runat="server" TextMode="MultiLine"></asp:TextBox>
    <br />
    <asp:FileUpload ID="fuPictures" runat="server" />
    <br />
    <asp:Image ID="imgPicture" runat="server" />
    <br />
    <asp:Label ID="lblDate" runat="server"></asp:Label>
    <br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" PostBackUrl="~/Admin/Content/TheBest.aspx" />
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EditVideo.aspx.cs" Inherits="Samodiva.Admin.EditVideo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="phAdminHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phAdminContent" runat="server">
    <asp:Label Text="Title:" ID="lblTitle" AssociatedControlID="tbTitle" runat="server" />
    <asp:TextBox runat="server" ID="tbTitle" />
    <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="Title is required!" ControlToValidate="tbTitle" ValidationGroup="Video"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="revTitle" runat="server" ErrorMessage="Title must be between 1 and 128 symbols!" ControlToValidate="tbTitle" ValidationExpression=".{0,128}" ValidationGroup="Video"></asp:RegularExpressionValidator>
    <br />
    <asp:Label Text="Uploded on:" runat="server" ID="LabelDate" />
    <asp:Label ID="lblDate" runat="server"></asp:Label>
    <br />
    <asp:Label Text="URL:" runat="server" ID="lblURL" AssociatedControlID="tbURL" />
    <asp:TextBox ID="tbURL" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvVideoURL" runat="server" ErrorMessage="Video URL is required!" ControlToValidate="tbURL" ValidationGroup="Video"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="revURL" runat="server" ErrorMessage="Invalid URL!" ControlToValidate="tbURL" ValidationGroup="Video" ValidationExpression="^http:\/\/(?:www\.)?youtube.com\/watch\?(?=[^?]*v=\w+)(?:[^\s?]+)?$"></asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="lblDescription" runat="server" Text="Description:" AssociatedControlID="tbDescription"></asp:Label>
    <asp:TextBox ID="tbDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
    <br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" PostBackUrl="~/Admin/Content/Videos.aspx" />
    <br />
    <asp:Literal ID="litEmbed" runat="server"></asp:Literal>
</asp:Content>

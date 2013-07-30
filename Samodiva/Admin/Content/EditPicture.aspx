<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="EditPicture.aspx.cs" Inherits="Samodiva.Admin.EditPicture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="phAdminHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phAdminContent" runat="server">
    <asp:Label ID="lblTitle" runat="server" AssociatedControlID="tbTitle" Text="Title:"></asp:Label>
    <asp:TextBox ID="tbTitle" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="tbTitle"
        ErrorMessage="Title is required!" ValidationGroup="Picture"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="revTitle" runat="server" ControlToValidate="tbTitle"
        ValidationGroup="Picture" ErrorMessage="Title must be between 1 and 128 symbols!"
        ValidationExpression=".{0,128}"></asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="lblDescription" runat="server" AssociatedControlID="tbDescription"
        Text="Description:"></asp:Label>
    <asp:TextBox ID="tbDescription" runat="server" TextMode="MultiLine " Width="100%"
        Height="600px"></asp:TextBox>
    <br />
    <asp:Label ID="lblUplodedOn" runat="server" Text="Uploded on:"></asp:Label>
    <asp:Label ID="lblDate" runat="server"></asp:Label>
    <br />
    <asp:Label ID="Picture" runat="server" Text="Picture:"></asp:Label>
    <br />
    <asp:FileUpload ID="fuPicture" runat="server" />
    <br />
    <asp:DropDownList ID="ddlCategories" runat="server">
    </asp:DropDownList>
    <br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" PostBackUrl="~/Admin/Content/Pictures.aspx" />
    <br />
    <asp:Image ID="imgPicture" runat="server" />
</asp:Content>

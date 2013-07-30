<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="EditNews.aspx.cs" Inherits="Samodiva.Admin.EditNews" %>

<%@ Register TagName="Tiny" TagPrefix="Mce" Src="~/CustomControls/TinyMce.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="phAdminHead" runat="server">
    <script type="text/javascript" src="/TinyMce/tiny_mce.js"></script>
    <Mce:Tiny ID="BigMCE" runat="server" ReadOnly="false" ControlClass="mceBigMce" Width="100%" Height="700px" Autoresize="false" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phAdminContent" runat="server">
    <asp:Label ID="lblTitle" runat="server" Text="Title:" AssociatedControlID="tbNewsTitle"></asp:Label>
    <asp:TextBox ID="tbNewsTitle" runat="server" Text=""/>
    <asp:RequiredFieldValidator ID="rfvTitle" runat="server"
        ControlToValidate="tbNewsTitle"
        ErrorMessage="Title is required!"
        ValidationGroup="News"
        Display="Dynamic"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="revTitle" runat="server"
        ControlToValidate="tbNewsTitle"
        ErrorMessage="News body must be between 1 and 128 symbols!"
        ValidationExpression=".{0,128}"
        ValidationGroup="News"
        Display="Dynamic"></asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="lblNewsBody" Text="Body:" runat="server" AssociatedControlID="tbNewsBody" />
    <asp:TextBox ID="tbNewsBody" runat="server" CssClass="mceBigMce" TextMode="MultiLine"
            Height="700px" Width="100%"></asp:TextBox>
    <div class="Buttons">
        <asp:Button ID="btnSubmitNews" Text="Submit" runat="server" OnClick="btnSubmitNews_Click" />
        <asp:Button ID="btnEditNews" Text="Edit" runat="server" OnClick="btnEditNews_Click" />
        <asp:Button ID="btnCancel" Text="Cancel" runat="server" Visible="false" OnClick="btnCancel_Click"/>
    </div>
    <ul>
        <asp:Repeater ID="rptrNews" runat="server">
            <ItemTemplate>
                <li>
                    <asp:Label ID="lblNewsDate" runat="server"></asp:Label>
                    <asp:LinkButton ID="lbNewsTitle" runat="server"></asp:LinkButton>
                    <asp:Button ID="btnEditNews" Text="Edit" runat="server" />
                    <asp:Button ID="btnDeleteNews" Text="Delete" runat="server" OnClick="btnDeleteNews_Click" />
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</asp:Content>

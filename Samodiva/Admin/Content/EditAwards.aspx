<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="EditAwards.aspx.cs" Inherits="Samodiva.Admin.EditAwards" %>

<%@ Register TagName="Tiny" TagPrefix="Mce" Src="~/CustomControls/TinyMce.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="phAdminHead" runat="server">
    <script type="text/javascript" src="/TinyMce/tiny_mce.js"></script>
    <Mce:Tiny ID="BigMCE" runat="server" ReadOnly="false" ControlClass="mceBigMce" Width="100%" Height="700px" Autoresize="false" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phAdminContent" runat="server">
    <div class="EditArea">
        <asp:Label ID="lblAwardTitle" Text="Title: " runat="server" AssociatedControlID="tbAwardTitle" />
        <asp:TextBox ID="tbAwardTitle" runat="server" />
        <asp:RequiredFieldValidator ID="rfvTitle" runat="server"
            ControlToValidate="tbAwardTitle"
            ErrorMessage="Title is required!"
            ValidationGroup="NewAward"
            Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revTitle" runat="server"
            ControlToValidate="tbAwardTitle"
            ValidationExpression=".{0,128}"
            ErrorMessage="Title must be between 1 and 128 symbols!"
            ValidationGroup="NewAward"
            Display="Dynamic">
        </asp:RegularExpressionValidator>
        <br />
        <asp:Label ID="lblPicture" Text="Picture: " runat="server" />
        <asp:FileUpload ID="PictureUpload" runat="server" />
        <asp:RequiredFieldValidator ID="rfvFile" runat="server"
            ControlToValidate="PictureUpload"
            ErrorMessage="Picture is required!"
            ValidationGroup="AwardPicture"
            Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblAwardDescription" Text="Description: " runat="server" AssociatedControlID="tbAwardDescription" />
          <asp:TextBox ID="tbAwardDescription" runat="server" CssClass="mceBigMce" TextMode="MultiLine"
            Height="700px" Width="100%"></asp:TextBox>
        <br />
        <div class="Buttons">
            <asp:Button ID="btnSubmitAward" Text="Submit" runat="server" OnClick="btnSubmitAward_Click" />
            <asp:Button ID="btnEditAward" Text="Edit" runat="server" OnClick="btnEditAward_Click" />
            <asp:Button ID="btnCancel" Text="Cencel" runat="server" PostBackUrl="~/Admin/Content/EditAwards.aspx" Visible="false" />
        </div>
    </div>
    <asp:Repeater ID="rptrAwards" runat="server">
        <ItemTemplate>
            <div class="SingleAward">
                <asp:Label ID="lblAwardTitle" runat="server" />
                <br />
                <asp:Image ID="imgAward" runat="server" />
                <br />
                <asp:Label ID="lblAwardDate" runat="server" />
                <p>
                    <asp:Literal ID="litDescription" runat="server" />
                </p>
                <div class="Buttons">
                    <asp:Button ID="btnEdit" Text="Edit" runat="server" />
                    <asp:Button ID="btnDelete" Text="Delete" runat="server" OnClick="btnDelete_Click" />
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>

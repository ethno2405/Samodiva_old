<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="EditCostumes.aspx.cs" Inherits="Samodiva.Admin.EditCostumes" %>
<%@ Register TagName="Tiny" TagPrefix="Mce" Src="~/CustomControls/TinyMce.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="phAdminHead" runat="server">
    <script type="text/javascript" src="/TinyMce/tiny_mce.js"></script>
    <Mce:Tiny ID="BigMCE" runat="server" ReadOnly="false" ControlClass="mceBigMce" Width="100%" Height="700px" WrapDivClass="EditArea" Autoresize="false" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phAdminContent" runat="server">
    <div class="EditArea">
        <asp:Label ID="lblCostumeTitle" Text="Title: " runat="server" AssociatedControlID="tbCostumeTitle" />
        <asp:TextBox ID="tbCostumeTitle" runat="server" />
        <asp:RequiredFieldValidator ID="rfvTitle" runat="server" 
            ControlToValidate="tbCostumeTitle" 
            ErrorMessage="Title is required!" 
            Display="Dynamic"
            ValidationGroup="Costume"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revTitle" runat="server" 
            ControlToValidate="tbCostumeTitle" 
            ValidationExpression=".{0,128}"
            ErrorMessage="Title must be between 1 and 128 symbols!"
            Display="Dynamic"
            ValidationGroup="Costume"></asp:RegularExpressionValidator>
        <br />
        <asp:FileUpload ID="PictureUpload" runat="server" />
        <br />
        <asp:Label ID="lblCostumeDescription" Text="Description: " runat="server" AssociatedControlID="tbCostumeDescription"></asp:Label>
        <asp:TextBox ID="tbCostumeDescription" runat="server" CssClass="mceBigMce" TextMode="MultiLine"
            Height="700px" Width="100%"></asp:TextBox>
        <div class="Buttons">
            <asp:Button ID="btnEdit" Text="Edit" runat="server" OnClick="btnEdit_Click" />
            <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" />
            <asp:Button ID="btnCancel" Text="Cancel" runat="server" OnClick="btnCancel_Click" />
        </div>
    </div>
    <asp:Repeater ID="rptrCostumes" runat="server">
        <HeaderTemplate>
            <table>
                <tr>
                    <th>Title
                    </th>
                    <th>Description
                    </th>
                    <th>Image
                    </th>
                    <th></th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="hlTitle" runat="server"></asp:Label>
                </td>
                <td>
                    <p>
                        <asp:Literal ID="litDescription" runat="server"></asp:Literal>
                    </p>
                </td>
                <td>
                    <asp:ImageButton ID="imgCostume" runat="server" />
                </td>
                <td>
                    <asp:Button ID="btnEditCostume" runat="server" Text="Edit"/>
                </td>
                <td>
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>

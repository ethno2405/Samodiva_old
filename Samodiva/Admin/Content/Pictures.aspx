<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Pictures.aspx.cs" Inherits="Samodiva.Admin.Pictures" %>

<asp:Content ID="Content1" ContentPlaceHolderID="phAdminHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phAdminContent" runat="server">
    <div class="EditArea">
        <asp:Label ID="PictureTitle" runat="server" Text="Title: " AssociatedControlID="tbPictureTitle"></asp:Label>
        <asp:TextBox ID="tbPictureTitle" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="tbPictureTitle" ErrorMessage="Title is required!" Display="Dynamic" ValidationGroup="Pictures"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revTitle" runat="server" ControlToValidate="tbPictureTitle" ErrorMessage="Title must be between 1 and 128 symbols!"
            ValidationExpression=".{0,128}" Display="Dynamic" ValidationGroup="Pictures"></asp:RegularExpressionValidator>
        <br />
        <asp:Label ID="lblPicture" runat="server" Text="Picture: "></asp:Label>
        <asp:FileUpload ID="PictureUpload" runat="server" />
        <asp:RequiredFieldValidator ID="rfvPictuure" runat="server" ControlToValidate="PictureUpload" ErrorMessage="Picture is requred!" Display="Dynamic" ValidationGroup="Pictures"></asp:RequiredFieldValidator>
        <br />
        <asp:DropDownList ID="ddlCategories" runat="server">
        </asp:DropDownList>
        <br />
        <asp:Label ID="lblPictureDescription" runat="server" Text="Description: " AssociatedControlID="tbPictureDescription"></asp:Label>
        <br />
        <asp:TextBox ID="tbPictureDescription" runat="server" TextMode="MultiLine" Width="100%"
            Height="600px"></asp:TextBox>
        <div class="Buttons">
            <asp:Button ID="btnSubmitPicture" Text="Submit" runat="server" OnClick="btnSubmitPicture_Click" />
        </div>
    </div>
    <div class="Pictures">
        <asp:MultiView ID="mvPictures" runat="server">
            <asp:View ID="vAllPictures" runat="server">
                <asp:Repeater ID="rptrPictures" runat="server">
                    <ItemTemplate>
                        <div class="SinglePicture">
                            <asp:Label ID="lblPictureTitle" runat="server" />
                            <br />
                            <asp:ImageButton ID="imgPicture" runat="server" />
                            <br />
                            <asp:Label ID="lblPicturePostedOn" runat="server" />
                            <div class="Buttons">
                                <asp:Button ID="btnPictureEdit" Text="Edit" runat="server" />
                                <asp:Button ID="btnPictureDelete" Text="Delete" runat="server" OnClick="btnDelete_Click" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </asp:View>
            <asp:View ID="vSinglePicture" runat="server">
                <asp:Label ID="lblTitle" runat="server"></asp:Label>
                <br />
                <asp:Image ID="imgPicture" runat="server" />
                <br />
                <asp:Label ID="lblDescription" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lblDate" runat="server"></asp:Label>
                <div class="Buttons">
                    <asp:Button ID="btnEdit" Text="Edit" runat="server" />
                    <asp:Button ID="btnDelete" Text="Delete" runat="server" OnClick="btnDelete_Click" />
                    <asp:Button ID="btnCancel" Text="Cancel" runat="server" OnClick="btnCancel_Click" />
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>

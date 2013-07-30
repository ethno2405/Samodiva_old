<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="TheBest.aspx.cs" Inherits="Samodiva.Admin.MenageTheBest" %>

<%@ Register TagName="Tiny" TagPrefix="Mce" Src="~/CustomControls/TinyMce.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="phAdminHead" runat="server">
    <script type="text/javascript" src="/TinyMce/tiny_mce.js"></script>
    <Mce:Tiny ID="BigMCE" runat="server" ReadOnly="false" ControlClass="mceBigMce" Width="100%" Height="700px" WrapDivClass="EditArea" Autoresize="false" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phAdminContent" runat="server">
    <asp:Label ID="lblTheBest" runat="server"></asp:Label>
    <div class="EditArea">
        <asp:Label ID="LabelName" runat="server" AssociatedControlID="tbName" Text="Name:"></asp:Label>
        <asp:TextBox ID="tbName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="tbName" ErrorMessage="Name is required!" ValidationGroup="TheBest"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revName" runat="server" ControlToValidate="tbName" ErrorMessage="Name must be between 1 and 128 symbols!" ValidationExpression=".{0,128}" ValidationGroup="TheBest"></asp:RegularExpressionValidator>
        <br />
        <asp:Label ID="lblTheBestPicture" Text="Picture: " runat="server" />
        <asp:FileUpload ID="PictureUpload" runat="server" />
        <br />
        <asp:Label ID="LabelText" runat="server" Text="Text:" AssociatedControlID="tbText"></asp:Label>
        <br />
        <asp:TextBox ID="tbText" runat="server" CssClass="mceBigMce" TextMode="MultiLine"
            Height="700px" Width="100%"></asp:TextBox>
        <div class="Buttons">
            <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click"/>
        </div>
    </div>
    <asp:MultiView ID="mvTheBest" runat="server">
        <asp:View ID="vSingle" runat="server">
            <asp:Label ID="lblName" runat="server"></asp:Label>
            <br />
            <asp:Image ID="imgTheBest" runat="server" />
            <br />
            <asp:Label ID="lblDate" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lblText" runat="server"></asp:Label>
            <br />
            <asp:Button ID="btnEdit" runat="server" Text="Edit" Visible="false"/>
            <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" Visible="false"/>
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" PostBackUrl="~/Admin/Content/TheBest.aspx" />
        </asp:View>
        <asp:View ID="vAll" runat="server">
            <asp:Repeater ID="rptrTheBest" runat="server">
        <ItemTemplate>
            <div>
                <asp:Label ID="lblName" runat="server"></asp:Label>
                <br />
                <asp:ImageButton ID="imgTheBest" runat="server" />
                <br />
                <asp:Label ID="lblDate" runat="server"></asp:Label>
                <p>
                    <asp:Literal ID="litDescriptionTheBest" runat="server"></asp:Literal>
                </p>
                <div class="Buttons">
                    <asp:Button ID="btnEdit" Text="Edit" runat="server" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click"/>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
        </asp:View>
    </asp:MultiView>
    
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="EditAboutUs.aspx.cs" Inherits="Samodiva.Admin.EditAboutUs" %>

<%@ Register TagName="Tiny" TagPrefix="Mce" Src="~/CustomControls/TinyMce.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="phAdminHead" runat="server">
    <script type="text/javascript" src="/TinyMce/tiny_mce.js"></script>
    <Mce:Tiny ID="BigMCE" runat="server" ReadOnly="false" ControlClass="mceBigMce" Width="100%" Height="700px" WrapDivClass="EditArea" Autoresize="false" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phAdminContent" runat="server">
    <div class="EditArea">
        <asp:TextBox ID="tbAboutUs" runat="server" CssClass="mceBigMce" TextMode="MultiLine"
            Height="700px" Width="100%"></asp:TextBox>
    </div>
    <div class="Buttons">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"></asp:Button>
    </div>
</asp:Content>

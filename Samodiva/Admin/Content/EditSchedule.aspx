<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="EditSchedule.aspx.cs" Inherits="Samodiva.Admin.EditSchedule" %>
<%@ Register TagName="Tiny" TagPrefix="Mce" Src="~/CustomControls/TinyMce.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="phAdminHead" runat="server">
    <script type="text/javascript" src="/TinyMce/tiny_mce.js"></script>
<Mce:Tiny ID="BigMCE" runat="server" ReadOnly="false" ControlClass="mceBigMce" Width="100%" Height="700px" WrapDivClass="EditArea"  Autoresize="false"  />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phAdminContent" runat="server">
    <div class="EditArea">
          <asp:TextBox ID="tbSchedule" runat="server" CssClass="mceBigMce" TextMode="MultiLine"
            Height="700px" Width="100%"></asp:TextBox>
        <asp:Label ID="lblError" runat="server"></asp:Label>
        <div class="Buttons">
            <asp:Button ID="btnSubmitSchedule" Text="Submit" runat="server" OnClick="btnSubmitSchedule_Click" />
        </div>
    </div>
</asp:Content>

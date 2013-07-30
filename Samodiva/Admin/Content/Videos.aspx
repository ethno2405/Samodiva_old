<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Videos.aspx.cs" Inherits="Samodiva.Admin.Videos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="phAdminHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phAdminContent" runat="server">
    <div class="Videos">
        <div class="EditArea">
            <asp:Label ID="lblVideoTitle" runat="server" Text="Title: " AssociatedControlID="tbVideoTitle"></asp:Label>
            <asp:TextBox ID="tbVideoTitle" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="Title is required!" ControlToValidate="tbVideoTitle" ValidationGroup="Video"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revTitle" runat="server" ErrorMessage="Title must be between 1 and 128 symbols!" ControlToValidate="tbVideoTitle" ValidationExpression=".{0,128}" ValidationGroup="Video"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="lblVideoLink" runat="server" Text="YouTube link: " AssociatedControlID="tbVideoLink"></asp:Label>
            <asp:TextBox ID="tbVideoLink" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvVideoURL" runat="server" ErrorMessage="Video URL is required!" ControlToValidate="tbVideoLink" ValidationGroup="Video"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revURL" runat="server" ErrorMessage="Invalid URL!" ControlToValidate="tbVideoLink" ValidationGroup="Video" ValidationExpression="^http:\/\/(?:www\.)?youtube.com\/watch\?(?=[^?]*v=\w+)(?:[^\s?]+)?$"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="lblVideoDescription" runat="server" Text="Description: " AssociatedControlID="tbVideoDescription"></asp:Label>
            <br />
            <asp:TextBox ID="tbVideoDescription" runat="server" TextMode="MultiLine" Width="100%"
                Height="600px"></asp:TextBox>
            <div class="Buttons">
                <asp:Button ID="btnSubmitVideo" Text="Submit" runat="server" OnClick="btnSubmitVideo_Click" />
            </div>
        </div>
        <div class="Videos">
            <asp:MultiView ID="mvVideos" runat="server">
                <asp:View ID="vAllVideos" runat="server">
                    <asp:Repeater ID="rptrVideos" runat="server">
                        <ItemTemplate>
                            <div class="SingleVideo">
                                <asp:Label ID="lblVideoTitle" runat="server"></asp:Label>
                                <div class="Video">
                                    <asp:ImageButton ID="ibVideoThumb" runat="server" />
                                </div>
                                <asp:Label ID="lblVideoPostedOn" runat="server" />
                                <div class="Buttons">
                                    <asp:Button ID="btnEditVideo" Text="Edit" runat="server" />
                                    <asp:Button ID="btnDeleteVideo" Text="Delete" runat="server" OnClick="btnDelete_Click" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </asp:View>
                <asp:View ID="vSingleVideo" runat="server">
                    <asp:Label ID="lblTitle" runat="server"></asp:Label>
                    <br />
                    <asp:Literal ID="litEmbed" runat="server"></asp:Literal>
                    <br />
                    <asp:Label ID="lblDate" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="lblDescription" runat="server"></asp:Label>
                    <br />
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" />
                    <asp:Button Text="Delete" runat="server" ID="btnDelete" OnClick="btnDelete_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" PostBackUrl="~/Admin/Content/Videos.aspx" />
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>

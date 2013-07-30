<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="Samodiva.News" %>
<%@ Import Namespace="Samodiva.Class_Library" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Новини</title>
    <script type="text/javascript" src="Scripts/Jquery/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="Scripts/Jquery/jquery-ui-1.9.0.custom.min.js"></script>
    <script type="text/javascript" src="Scripts/Jquery/jquery.mCustomScrollbar.js"></script>
    <script type="text/javascript" src="Scripts/Jquery/jquery.mousewheel.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="Scripts/animation.js"></script>
    <script type="text/javascript">
        Redirect("News.aspx");
    </script>
</head>
<body>
    <form id="formNews" runat="server">
        <asp:ScriptManager ID="sm" runat="server" EnablePageMethods="true" EnablePartialRendering="true"></asp:ScriptManager>
        <asp:UpdatePanel runat="server" ID="upNews" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:MultiView ID="mvNews" runat="server">
                    <asp:View ID="vAllNews" runat="server">
                        <asp:Repeater ID="rptrNews" runat="server"  DataSourceID="EntityDataSourceNews">
                            <HeaderTemplate>
                                <div class="NewsWrap">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="SingleNews">
                                    <a onclick="Load('News.aspx?ID=<%# Eval("id") %>','#slider2')">
                                        <span class="Title"><%# Eval("Title") %></span>
                                    </a>
                                    <br />
                                    <span><%# Eval("Date","{0:dd/MM/yyyy}") + "г." %></span>
                                    <br />
                                    <span><%# Eval("Body").ToString().Strip().Trim().Length <=50 ? Eval("Body").ToString().Strip().Trim() : Eval("Body").ToString().Strip().Trim().Substring(0, 50) + "..." %></span>
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                                </div>
                            </FooterTemplate>
                        </asp:Repeater>
                        <asp:EntityDataSource runat="server" ID="EntityDataSourceNews" DefaultContainerName="SamodivaDBEntities" ConnectionString="name=SamodivaDBEntities" EnableFlattening="False" EntitySetName="News" EntityTypeFilter="News" Select="it.[id], it.[Title], it.[Body], it.[Date]" OrderBy="it.Date DESC"></asp:EntityDataSource>
                    <div style="display:none" id="News"></div>
                    </asp:View>
                    <asp:View ID="vSingleNews" runat="server">
                        <div class="PreviewNews">
                            <asp:Label ID="lblTitle" CssClass="PreviewTitle" runat="server"></asp:Label>
                            <div class="PreviewDescription">
                                <asp:Literal ID="litMce" runat="server" />
                                <asp:Label ID="lblDate" CssClass="Date" runat="server"></asp:Label>
                            </div>
                            <a id="lbBack" class="Link" onclick="Load('News.aspx','#slider2')">Назад</a>
                        </div>
                    </asp:View>
                </asp:MultiView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>

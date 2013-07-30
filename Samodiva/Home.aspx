<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Samodiva.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Начало</title>
    <script type="text/javascript" src="Scripts/Jquery/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="Scripts/Jquery/jquery-ui-1.9.0.custom.min.js"></script>
    <script type="text/javascript" src="Scripts/Jquery/jquery.mCustomScrollbar.js"></script>
    <script type="text/javascript" src="Scripts/Jquery/jquery.mousewheel.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="Scripts/animation.js"></script>
    <script type="text/javascript">
        Redirect("Home.aspx");
    </script>
</head>
<body>
    <form runat="server">
        <div class="FirstRow" style="width: 100%; float: left;">
            <div style="width: 49%; float: left;">
                <asp:Repeater ID="rptrLastTheBest" runat="server">
                    <HeaderTemplate>
                        <div class="NewTheBestList">
                            <h2 style="display: table; margin: 10px auto;">Най-добрите</h2>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="NewTheBestThumb" id="divNewTheBestThumb" runat="server">
                            <div class="imgBorder">
                                <div id="ibPicture" runat="server" class="imgTheBestThumb"></div>
                            </div>
                            <asp:Label ID="lblName" CssClass="NewTheBestName" runat="server"></asp:Label>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
                <h2 style="display: table; margin: 20px auto;">Награди</h2>
                <asp:Repeater ID="rptrLastAwards" runat="server">
                    <HeaderTemplate>
                        <div class="NewAwardsList">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="NewAwardsThumb" id="divNewAwardsThumb" runat="server">
                            <div class="imgBorder">
                                <div id="ibAward" runat="server" class="NewSingleAward"></div>
                            </div>
                            <asp:Label ID="lblAwardTitle" CssClass="NewAwardTitle" runat="server"></asp:Label>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="video_player">
                <div id="DivYouTubeVimeoPlayerFX" style="width: 50%"></div>
            </div>
            <script type="text/javascript" src="video-player/swfobject.js"></script>
            <script type="text/javascript">
                var flashvars = {};
                var params = {};
                params.base = "http://" + window.location.host + "/video-player/";
                params.scale = "noscale";
                params.salign = "tl";
                params.wmode = "transparent";
                params.allowFullScreen = "true";
                params.allowScriptAccess = "always";
                var host = "http://" + window.location.host + "/video-player/";
                swfobject.embedSWF(host + "YouTubeVimeoPlayerFX.swf", "DivYouTubeVimeoPlayerFX", "515px", "350px", "9.0.0", false, flashvars, params);
            </script>
        </div>
        <div class="SecondRow" style="width: 100%; float: left;">
            <h2 style="display: table; margin: 10px auto;">Новини</h2>
            <asp:Repeater ID="rptrLastNews" runat="server">
                <HeaderTemplate>
                    <div class="NewsWrap">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="SingleNews">
                        <a id="hlTitle" class="Title" runat="server"></a>
                        <br />
                        <asp:Label ID="lblBody" CssClass="NewsBody" runat="server"></asp:Label>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
        </div>
        <div style="display: none" id="Home"></div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Samodiva.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Samodiva</title>
    <link href="CSS/style.css" rel="stylesheet" type="text/css" />
    <link href="CSS/Reset.css" rel="stylesheet" type="text/css" />
    <link href="CSS/Master.css" rel="stylesheet" type="text/css" />
    <link href="CSS/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
    <link href="CSS/galleriffic-2.css" rel="stylesheet" type="text/css"/>
    <link href="CSS/basic.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="Scripts/Jquery/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="Scripts/Jquery/jquery-ui-1.9.0.custom.min.js"></script>
    <script type="text/javascript" src="Scripts/Jquery/jquery.mCustomScrollbar.js"></script>
    <script type="text/javascript" src="Scripts/Jquery/jquery.mousewheel.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="Scripts/animation.js"></script>
    <script type="text/javascript" src="Scripts/quickpager.jquery.js"></script>
    <script type="text/javascript" src="Scripts/jquery.galleriffic.js"></script>
    <script type="text/javascript">
        $(window).on("ready resize", function () {
            if ($(window).width() < 1280) {
                $("#body").css("zoom", "67%");
            } else {
                $("#body").css("zoom", "100%");
            }
        });
    </script>
    <script type="text/javascript">
        $(window).ready(function () {
            switch (window.location.search.toLowerCase()) {
                case "?home":
                    ResolvePageLoad("Home.aspx?Home", "#slider2", "2");
                    break;
                case "?news":
                    ResolvePageLoad("News.aspx", "#slider3", "3");
                    break;
                case "?awards":
                    ResolvePageLoad("Awards.aspx", "#slider4", "4");
                    break;
                case "?gallery":
                    ResolvePageLoad("Gallery.aspx", "#slider5", "5");
                    break;
                case "?thebest":
                    ResolvePageLoad("TheBest.aspx", "#slider6", "6");
                    break;
                case "?costumes":
                    ResolvePageLoad("Costumes.aspx", "#slider7", "7");
                    break;
                case "?schedule":
                    ResolvePageLoad("Schedule.aspx", "#slider8", "8");
                    break;
                case "?aboutus":
                    ResolvePageLoad("AboutUs.aspx", "#slider9", "9");
                    break;
            }
        })
    </script>
    <noscript>
        <style type="text/css">
            #video {
                display: none;
            }
        </style>
        <font face="arial" style="font-size:20px;">JavaScript трябва да е активиран, за да можете да видите тази страница. Изглежда обаче JavaScript е деактивиран или не се поддържа от браузъра Ви. За да видите тази страница, активирайте JavaScript, като промените опциите на браузъра и след това 
            <a href="http://www.samodivabg.com">опитайте отново</a>. </font>
    </noscript>
</head>
<body id="body">
    <form id="frmMaster" runat="server">
        <div id="video">
            <div class="leftcurtain">
                <img src="Img/frontcurtain.jpg" />
            </div>
            <div class="rightcurtain">
                <img src="Img/frontcurtain.jpg" />
            </div>
            <a class="rope" href="#">
                <img src="Img/rope.png" width="100%" height="100%" />
            </a>
            <div class="IntroProjector_off">
                <img id="projector_off" src="Img/proj_green_off.png" width="100%" height="100%" />
                <div class="IntroProjector_on">
                    <img id="projector_on" src="Img/proj_green_on.png" width="100%" height="100%" />
                </div>
            </div>
            <div id="wrapper">
                <div id="header" style="display: none">
                    <div id="siteLogo">
                        <img src="Img/Site_Logo.png" alt="Logo" width="100%" />
                    </div>
                    <div id="siteNavigation">
                        <a id="menu01" class="mnu_btn" href="#">
                            <img src="Img/Button-1-Hover.png" alt="Home" />
                            <div>Начало</div>
                        </a>
                        <a id="menu02" class="mnu_btn" href="#">
                            <img src="Img/Button-2-Hover.png" alt="News" />
                            <div>
                                Новини
                            </div>
                        </a>
                        <a id="menu03" class="mnu_btn" href="#">
                            <img src="Img/Button-3-Hover.png" alt="Awards" />
                            <div>
                                Награди
                            </div>
                        </a>
                        <a id="menu04" class="mnu_btn" href="#">
                            <img src="Img/Button-4-Hover.png" alt="Gallery" />
                            <div>
                                Галерия
                            </div>
                        </a>
                        <a id="menu05" class="mnu_btn" href="#">
                            <img src="Img/Button-5-Hover.png" alt="The Best" />
                            <div>
                                Най-добрите
                            </div>
                        </a>
                        <a id="menu06" class="mnu_btn" href="#">
                            <img src="Img/Button-6-Hover.png" alt="Costumes" />
                            <div>
                                Костюми
                            </div>
                        </a>
                        <a id="menu07" class="mnu_btn" href="#">
                            <img src="Img/Button-7-Hover.png" alt="Schedule" />
                            <div>
                                График
                            </div>
                        </a>
                        <a id="menu08" class="mnu_btn" href="#">
                            <img src="Img/Button-8-Hover.png" alt="About us" />
                            <div>
                                За нас
                            </div>
                        </a>
                    </div>
                </div>
                <div id="content" style="width: 1030px;">
                    <div class="ImgLoading">
                        <br />
                        <img src="Img/ajax-loader.gif" />
                        <br />
                        <strong>Зареждане</strong>
                    </div>
                    <div id="slide_container">
                        <div id="slider0" class="slider" style="overflow: hidden"></div>
                        <div id="slider1" class="slider"></div>
                        <div id="slider2" class="slider"></div>
                        <div id="slider3" class="slider"></div>
                        <div id="slider4" class="slider"></div>
                        <div id="slider5" class="slider"></div>
                        <div id="slider6" class="slider"></div>
                        <div id="slider7" class="slider"></div>
                        <div id="slider8" class="slider"></div>
                    </div>
                </div>
                <div class="Link_Buttons">
                    <a href="http://www.facebook.com/danisamodiva?fref=ts" target="_blank">
                        <asp:Image ID="btnFacebook" ImageUrl="~/Img/facebook_button.png" runat="server" />
                    </a>
                    <a href="http://www.youtube.com/channel/UCYYIHfloQWRmAmvSAwoYZvw?feature=mhee" target="_blank">
                        <asp:Image ID="btnYouTube" ImageUrl="~/Img/youtube_button.png" runat="server" />
                    </a>
                </div>
                <div id="footer">
                    <span>
                        <br />
                        © 2012 samodivabg.com - Всички права запазени
                        <br />
                        Developed by Blagovest Petrov, Konstantin Tenekedzhiev
                    </span>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

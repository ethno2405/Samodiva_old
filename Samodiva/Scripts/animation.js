$(window).on("ready", function () {
    //preloading
    $("#slider0").load("Intro.aspx");

    var xmlhttp;
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else {
        xmlhttp = ActiveXObject("Microsoft.XMLHTTP");
    }

    //positions and sizes
    var slider_width = $("#content").width();

    $("#slide_container").css("width", slider_width * 9 + 17);
    $("#slider0").css({ "width": slider_width });
    $("#slider1").css({ "width": slider_width });
    $("#slider2").css({ "width": slider_width });
    $("#slider3").css({ "width": slider_width });
    $("#slider4").css({ "width": slider_width });
    $("#slider5").css({ "width": slider_width });
    $("#slider6").css({ "width": slider_width });
    $("#slider7").css({ "width": slider_width });
    $("#slider8").css({ "width": slider_width });

    //animate
    $curtainopen = false;

    $(".rope").click(function () {
        $(this).blur();
        if ($curtainopen == false) {
            //open
            $("#slide_container").animate({ left: 0 }, "slow", "easeOutExpo");

            $(this).stop().animate({ top: '0px' }, { queue: false, duration: 350, easing: 'easeOutBounce' });
            $(".leftcurtain").stop().animate({ width: '120px' }, 2500);
            $(".rightcurtain").stop().animate({ width: '120px' }, 3000);
            $("#wrapper").fadeIn("0", "easeInExpo");
            $("#projector_on").delay(2000).fadeIn("5000", "easeInExpo");
            $("#slogan_on").delay(2020).fadeIn("3000", "easeInExpo");
            $("#logo_on").delay(2020).fadeIn("3000", "easeInExpo");
            $("#header").delay(2020).fadeIn("3000", "easeInExpo");

            $curtainopen = true;
        } else {
            //close
            $("#projector_on").delay(520).fadeOut("slow", "easeInSine");
            $("#slogan_on").delay(500).fadeOut("slow", "easeInSine");
            $("#logo_on").delay(500).fadeOut("slow", "easeInSine");
            $("#wrapper").delay(600).fadeOut("slow", "easeInSine");
            $("#header").delay(500).fadeOut("slow", "easeInSine");
            $(this).stop().animate({ top: '-40px' }, { queue: false, duration: 350, easing: 'easeOutBounce' });
            $(".leftcurtain").stop().delay(100).animate({ width: '50%' }, 3000);
            $(".rightcurtain").stop().delay(100).animate({ width: '51%' }, 2500);

            $(".IntroProjector_off").animate({ left: '6%' }, { queue: false, duration: 3500 });

            $curtainopen = false;
        }
        return false;
    });

    $("#siteNavigation").click(function () {
        $(".IntroProjector_off").animate({ left: '-6%' }, { queue: false, duration: 3500 });
    });

    $("#menu01").click(function () {
        if ($("#Home").val() != 0) {
            $(".ImgLoading").fadeIn(10);
            $("#slider1").load("Home.aspx", function () {
                $(".ImgLoading").fadeOut(500).ready(function () {
                    $("#slide_container").animate({ left: slider_width * -1 }, "slow", "easeOutExpo").ready(function () {
                        $("#slider1").mCustomScrollbar({
                            scrollButtons: {
                                enable: true
                            }
                        });
                    }).ready( window.history.pushState("", "Home", "/?Home"));
                });
            })
        } else {
            $("#slide_container").animate({ left: slider_width * -1 }, "slow", "easeOutExpo").ready(window.history.pushState("", "Home", "/?Home"));
        }
    });

    $("#menu02").click(function () {
        if ($("#News").val() != 0) {
        $(".ImgLoading").fadeIn(10);
        $("#slider2").load("News.aspx", function () {
            $(".ImgLoading").fadeOut(500).ready(function () {
                $("#slide_container").animate({ left: slider_width * -2 }, "slow", "easeOutExpo").ready(function () {
                    $("#slider2").mCustomScrollbar({
                        scrollButtons: {
                            enable: true
                        }
                    });
                }).ready( window.history.pushState("", "News", "/?News"));
            });
        })
        } else {
            $("#slide_container").animate({ left: slider_width * -2 }, "slow", "easeOutExpo").ready(window.history.pushState("", "News", "/?News"));
        }
    });

    $("#menu03").click(function () {
        if ($("#Awards").val() != 0) {
            $(".ImgLoading").fadeIn(10);
            $("#slider3").load("Awards.aspx", function () {
                $(".ImgLoading").fadeOut(500).ready(function () {
                    $("#slide_container").animate({ left: slider_width * -3 }, "slow", "easeOutExpo").ready(function () {
                        $("#slider3").mCustomScrollbar({
                            scrollButtons: {
                                enable: true
                            }
                        });
                    }).ready( window.history.pushState("", "Awards", "/?Awards"));
                });
            })
        } else {
            $("#slide_container").animate({ left: slider_width * -3 }, "slow", "easeOutExpo").ready(window.history.pushState("", "Awards", "/?Awards"));
        }
    });

    $("#menu04").click(function () {
        if ($("#Gallery").val() != 0) {
            $(".ImgLoading").fadeIn(10);
            $("#slider4").load("Gallery.aspx", function () {
                $(".ImgLoading").fadeOut(500).ready(function () {
                    $("#slide_container").animate({ left: slider_width * -4 }, "slow", "easeOutExpo").ready(function () {
                        $("#slider4").mCustomScrollbar({
                            scrollButtons: {
                                enable: true
                            }
                        });
                    }).ready( window.history.pushState("", "Gallery", "/?Gallery"));
                });

                $('#thumbs').galleriffic({
                    imageContainerSel: '#slideshow',
                    controlsContainerSel: '#controls'
                });
            })
        } else {
            $("#slide_container").animate({ left: slider_width * -4 }, "slow", "easeOutExpo").ready(window.history.pushState("", "Gallery", "/?Gallery"));
        }
    });

    $("#menu05").click(function () {
        if ($("#TheBest").val() != 0) {
            $(".ImgLoading").fadeIn(10);
            $("#slider5").load("TheBest.aspx", function () {
                $(".ImgLoading").fadeOut(500).ready(function () {
                    $("#slide_container").animate({ left: slider_width * -5 }, "slow", "easeOutExpo").ready(function () {
                        $("#slider5").delay(50000).mCustomScrollbar({
                            scrollButtons: {
                                enable: true
                            }
                        });
                    }).ready(window.history.pushState("", "TheBest", "/?TheBest"));
                });
            })
        } else {
            $("#slide_container").animate({ left: slider_width * -5 }, "slow", "easeOutExpo").ready(window.history.pushState("", "TheBest", "/?TheBest"));
        }
    });

    $("#menu06").click(function () {
        if ($("#Costumes").val() != 0) {
            $(".ImgLoading").fadeIn(10);
            $("#slider6").load("Costumes.aspx", function () {
                $(".ImgLoading").fadeOut(500).ready(function () {
                    $("#slide_container").animate({ left: slider_width * -6 }, "slow", "easeOutExpo").ready(function () {
                        $("#slider6").mCustomScrollbar({
                            scrollButtons: {
                                enable: true
                            }
                        });
                    }).ready(window.history.pushState("", "Costumes", "/?Costumes"));
                });
            })
        } else {
            $("#slide_container").animate({ left: slider_width * -6 }, "slow", "easeOutExpo").ready(window.history.pushState("", "Costumes", "/?Costumes"));
        }
    });

    $("#menu07").click(function () {
        if ($("#Schedule").val() != 0) {
            $(".ImgLoading").fadeIn(10);
            $("#slider7").load("Schedule.aspx", function () {
                $(".ImgLoading").fadeOut(500).ready(function () {
                    $("#slide_container").animate({ left: slider_width * -7 }, "slow", "easeOutExpo").ready(function () {
                        $("#slider7").mCustomScrollbar({
                            scrollButtons: {
                                enable: true
                            }
                        });
                    }).ready(window.history.pushState("", "Schedule", "/?Schedule"));
                });
            })
        } else {
            $("#slide_container").animate({ left: slider_width * -7 }, "slow", "easeOutExpo").ready(window.history.pushState("", "Schedule", "/?Schedule"));
        }
    });

    $("#menu08").click(function () {
        if ($("#AboutUs").val() != 0) {
            $(".ImgLoading").fadeIn(10);
            $("#slider8").load("AboutUs.aspx", function () {
                $(".ImgLoading").fadeOut(500).ready(function () {
                    $("#slide_container").animate({ left: slider_width * -8 }, "slow", "easeOutExpo").ready(function () {
                        $("#slider8").mCustomScrollbar({
                            scrollButtons: {
                                enable: true
                            }
                        });
                    }).ready(window.history.pushState("", "AboutUs", "/?AboutUs"));
                });
            })
        } else {
            $("#slide_container").animate({ left: slider_width * -8 }, "slow", "easeOutExpo").ready(window.history.pushState("", "AboutUs", "/?AboutUs"));
        }
    });
});

function Load(page, slider, step) {
    var width = $("#content").width();
    $(".ImgLoading").fadeIn(10);
    $(slider).load(page, function () {
        window.history.pushState("", page, "/?" + page.replace(".aspx", ""),
        $(".ImgLoading").fadeOut(500).ready(function () {
            $("#slide_container").animate({ left: width * -step }, "slow", "easeOutExpo").ready(setTimeout(function () {
                $(slider).mCustomScrollbar({
                    scrollButtons: {
                        enable: true
                    }
                });
            }, 130));
        }))
    });
}

function ResolvePageLoad(page, slider, step) {
    $curtainopen = false;
    $(".IntroProjector_off").animate({ left: '-6%' }, { queue: false, duration: 3500 });
    Open();
    var width = $("#content").width();
    $(".ImgLoading").fadeIn(10);
    $(slider).load(page, function () {
        window.history.pushState("", page, "/?" + page.replace(".aspx", ""))
        $(".ImgLoading").fadeOut(500).ready(function () {
            $("#slide_container").animate({ left: width * -step }, "slow", "easeOutExpo").ready(setTimeout(function () {
                $(slider).mCustomScrollbar({
                    scrollButtons: {
                        enable: true
                    }
                });
            }, 130));
        });
    });

    function Open() {
        $(this).blur();
        if ($curtainopen == false) {
            //open
            $("#slide_container").animate({ left: 0 }, "slow", "easeOutExpo");

            $(this).stop().animate({ top: '0px' }, { queue: false, duration: 350, easing: 'easeOutBounce' });
            $(".leftcurtain").stop().animate({ width: '120px' }, 2500);
            $(".rightcurtain").stop().animate({ width: '120px' }, 3000);
            $("#wrapper").fadeIn("0", "easeInExpo");
            $("#projector_on").delay(2000).fadeIn("5000", "easeInExpo");
            $("#slogan_on").delay(2020).fadeIn("3000", "easeInExpo");
            $("#logo_on").delay(2020).fadeIn("3000", "easeInExpo");
            $("#header").delay(2020).fadeIn("3000", "easeInExpo");

            $curtainopen = true;
        } else {
            //close
            $("#projector_on").delay(520).fadeOut("slow", "easeInSine");
            $("#slogan_on").delay(500).fadeOut("slow", "easeInSine");
            $("#logo_on").delay(500).fadeOut("slow", "easeInSine");
            $("#wrapper").delay(600).fadeOut("slow", "easeInSine");
            $("#header").delay(500).fadeOut("slow", "easeInSine");
            $(this).stop().animate({ top: '-40px' }, { queue: false, duration: 350, easing: 'easeOutBounce' });
            $(".leftcurtain").stop().delay(100).animate({ width: '50%' }, 3000);
            $(".rightcurtain").stop().delay(100).animate({ width: '51%' }, 2500);

            $(".IntroProjector_off").animate({ left: '6%' }, { queue: false, duration: 3500 });

            $curtainopen = false;
        }
        return false;
    }
}

function Redirect(page) {
    if (window.location.href.indexOf(page) > 0) {
        window.location.replace("http://localhost:50297" + "/?" + page.replace(".aspx", ""));
    }
}
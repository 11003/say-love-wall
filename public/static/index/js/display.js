$(document).ready(function() {
    $.getJSON("https://v1.hitokoto.cn/?c=e", function(res) {
        $("#yiyan").text(res.hitokoto)
    });
    var guess_post_id = "";
    var page = parseInt($("#pages").attr("page"));
    let mode = parseInt($("#pages").attr("mode"));
    getPage(page, mode);
    var max = parseInt($("#pages").attr("max"));
    $("#previous").click(function(event) {
        page = parseInt($("#pages").attr("page"));
        max = parseInt($("#pages").attr("max"));
        let modeValue = parseInt($("#pages").attr("mode"));
        $(this).removeClass("shi");
        if (page - 1 > 0) {
            getPage(page - 1, modeValue);
            $("#pages").attr("page", page - 1)
        } else {
            layer.msg("啊哦，前面没有了~", {
                icon: 2,
                time: 1000,
                shade: 0.5,
                anim: 6
            })
        }
    });
    $("#next").click(function(event) {
        page = parseInt($("#pages").attr("page"));
        let modeValue = parseInt($("#pages").attr("mode"));
        max = parseInt($("#pages").attr("max"));
        if (page + 1 > max) {} else {
            getPage(page + 1, modeValue);
            $("#pages").attr("page", page + 1);
            gotoLocation()
        }
    });
    $("#search-bars-submit").click(function(event) {
        var searchValue = $("#search-bars-input").val();
        if (searchValue == "") {
            layer.msg("内容不能为空！", {
                time: 1500,
                icon: 5,
                shade: [0.5, "black"]
            });
            return
        }
        var pageNumber = 1;
        var pageSize = 10;
        var index = layer.load(0, {
            icon: 0,
            shade: [0.5, "black"]
        });
        $.ajax({
            url: "/search",
            type: "POST",
            dataType: "json",
            data: {
                searchValue: searchValue,
                pageNumber: pageNumber,
                mode: 5
            },
            success: function(result) {
                layer.close(index);
                var rows = result["rows"];
                var count = result["count"];
                output(rows, count, "")
            },
            fail: function() {
                console.log("error")
            },
            always: function() {
                console.log("complete");
                $("#loading").css("display", "none")
            }
        })
    });
    var liked_post = [];
    $("#main").on("click", ".ui-icon-liked", function() {
        layer.msg("已点赞~", {
            "icon": 6,
            shade: 0.5,
            time: 1000
        })
    });
    $("#main").on("click", ".ui-icon-like", function(event) {
        var postID = $(this).data("post");
        if (liked_post.indexOf(postID) >= 0) {
            layer.msg("已点赞~", {
                "icon": 6,
                shade: 0.5,
                time: 1000
            });
            return
        } else {
            liked_post.push(postID)
        }
        $.ajax({
            url: "/liked",
            type: "POST",
            dataType: "json",
            data: {
                post_id: postID
            },
            success: function(result) {
                if (1 == result.code) {
                    $(event.target).html(result["data"]).addClass("ui-icon-liked").fadeIn(300)
                }
            }
        })
    });
    $("#main").on("click", ".ui-icon-guess", function(event) {
        var postID = $(this).attr("data-post");
        var proportion = $(this).text();
        var num = proportion.split("/");
        $("#guess_all").text(num[1]);
        $("#guess_right").text(num[0]);
        guess_post_id = $(this).attr("data-post");
        $("#guess-hint").text("")
    });
    $("#guess-submit").click(function(event) {
        var guessName = $("#guess-input").val();
        if (guessName != "") {
            $.ajax({
                url: "/guess",
                type: "POST",
                dataType: "json",
                data: {
                    guessName: guessName,
                    post_id: guess_post_id
                },
                success: function(result) {
                    switch (result["code"]) {
                        case 0:
                            var $all = $("#guess_all");
                            var guess_all = $all.text();
                            guess_all++;
                            $all.html(guess_all);
                            break;
                        default:
                            var $r = $("#guess_right");
                            var guess_right = $r.text();
                            guess_right++;
                            $r.html(guess_right);
                            $("#guess-submit").attr("disabled", true);
                            break
                    }
                    $("#guess-hint").text(result.msg)
                },
                fail: function() {
                    console.log("error")
                },
                always: function() {
                    $("#guess-input").val("")
                }
            })
        }
    });
    $("#main").on("click", ".ui-icon-comment", function(event) {
        var postID = $(this).attr("data-post");
        $("#comment-submit").attr("data-post", postID);
        $("#comment-lists-ul").html("");
        NProgress.start();
        $.ajax({
            url: "/comment",
            type: "POST",
            dataType: "json",
            data: {
                post_id: postID
            },
            success: function(result) {
                NProgress.done();
                commentOutput(result)
            },
        })
    });
    $("#comment-submit").click(function(event) {
        var comment = $("#contents").val();
        var postID = $(this).data("post");
        if (comment != "") {
            $.ajax({
                url: "/commentpost",
                type: "POST",
                dataType: "json",
                data: {
                    contents: comment,
                    posts_id: postID
                },
                success: function(result) {
                    $("#comment-hint").text(result.msg);
                    wangE.txt.html('');
                    setTimeout(function() {
                        $("#comment-hint").text("")
                    }, 5000);
                    $("<li>").html('<span class="comment-floor">##</span><span class="comment-ip">保密</span><span class="comment-time">刚刚</span><p style="font-size:0.8rem">' + comment + "</p>").appendTo("#comment-lists-ul");
                    $("#contents-input").val("")
                },
                fail: function() {
                    console.log("error")
                },
                always: function() {
                    console.log("complete");
                    $("#comment-Popup input").val("")
                }
            })
        } else {}
    });
    function commentOutput(result) {
        $("#comment-lists-ul").html("");
        if (result == "") {
            $("#comment-lists-ul").text("快来抢沙发吧！")
        } else {
            $.each(result, function(index, val) {
                $("<li>").html('<span class="comment-floor">#' + (index + 1) + '</span><span class="comment-ip">' + val["ip"] + '</span><span class="comment-time">' + val["mtime"] + '</span><p style="font-size:0.8rem">' + val["contents"] + "</p>").appendTo("#comment-lists-ul")
            })
        }
    }
    $("#main").on("click", ".ui-icon-share", function(event) {
        var postID = $(this).attr("data-post");
        $("#link").html("");
        $("<a>").attr("target", "_blank").attr("href", "./share/id/" + postID).text("戳我打开链接，复制给朋友").appendTo("#link")
    });
    $("#returnTop").click(function() {
        gotoTop()
    });
    $("#most-liked").click(function(event) {
        var page = 1;
        var mode = 0;
        getPage(page, mode);
        $("#pages").attr("page", page).attr("mode", mode);
        gotoLocation()
    });
    $("#new-posts").click(function(event) {
        var page = 1;
        var mode = 1;
        getPage(page, mode);
        $("#pages").attr("page", page).attr("mode", mode);
        gotoLocation()
    });
    $("#random-posts").click(function(event) {
        var page = 1;
        var mode = 2;
        getPage(page, mode);
        $("#pages").attr("page", page).attr("mode", mode);
        gotoLocation()
    });
    $("#less-liked").click(function(event) {
        var page = 1;
        var mode = 3;
        getPage(page, mode);
        $("#pages").attr("page", page).attr("mode", mode);
        gotoLocation()
    });
    $("#old-posts").click(function(event) {
        var page = 1;
        var mode = 4;
        getPage(page, mode);
        $("#pages").attr("page", page).attr("mode", mode);
        gotoLocation()
    })
});
function gotoLocation() {
    $("body,html").animate({
        scrollTop: 0
    }, 500)
}
function gotoTop() {
    $("body,html").scrollTop(0);
    layer.msg("耶，已为你返回顶部~", {
        icon: 1,
        time: 1000,
        shade: 0.5
    })
}
$(function() {
    $("#goToTop").hide();
    $(window).scroll(function() {
        if ($(this).scrollTop() > 100) {
            $("#goToTop").fadeIn(400)
        } else {
            $("#goToTop").fadeOut()
        }
    });
    $("#goToTop").click(function() {
        $("html ,body").animate({
            scrollTop: 0
        }, 100);
        return false
    })
});
function getPage(page, mode) {
    var index = document.getElementById("index");
    if (index) {
        $.ajax({
            url: "/search",
            type: "POST",
            dataType: "json",
            data: {
                pageNumber: page,
                mode: mode
            },
            success: function(result) {
                var rows = result["rows"];
                var count = result["count"];
                var total_page = result["total_page"];
                output(rows, count, total_page);
                var page = $("#pages").attr("page");
                var max = $("#pages").attr("max");
                var total = $("#pages").attr("total");
                $("#pageNum").text("第" + page + "页，共" + max + "页，已有" + total + "人表白");
                if (page == max) {
                    $("<p>").text("何时杖尔看南雪，我与梅花两白头。没有了哦~").addClass("shi").appendTo("#main")
                } else {
                    $(".shi").removeClass("shi")
                }
            },
            fail: function(result) {},
            always: function(result) {
                console.log(result);
                $("body,html").scrollTop(200)
            }
        })
    }
}
function output(result, total, total_pages) {
    $("#main").html("");
    var index = document.getElementById("index");
    if (!index) {
        $("<span>").addClass("post-body-time").html("<span>查找到了" + total + "条数据~~</span>").appendTo("#main")
    }
    var total_page = total_pages + 1;
    $.each(result, function(index, val) {
        var id = val["id"];
        var nickName = val["nickName"];
        var toWho = val["towho"];
        var contents = val["contents"];
        var love = val["love"];
        var guessCount = val["guess_yes"];
        var commentsCount = val["comment_count"];
        var time = val["mtime"];
        var guessCount_all = val["guess_count"];
        var gender = val["gender"];
        var itsGender = val["itsGender"];
        var is_like = val["is_like"];
        var image = val["loveImage"];
        if (is_like != 0) {
            var is_likes = "ui-icon-liked"
        } else {
            var is_likes = "ui-icon-like"
        }
        $("<div>").addClass("post animated fadeIn").addClass("post-" + id).appendTo("#main");
        $("<div>").addClass("post-title").addClass("post-title-" + id).appendTo(".post-" + id);
        $("<ul>").html('<li class="' + gender + '">' + nickName + '</li><li><img src="https://i.loli.net/2019/07/01/5d1a2c018d3b655920.png" alt="" /></li><li class="' + itsGender + '">' + toWho + "</li>").appendTo(".post-title-" + id);
        $("<div>").addClass("post-body").addClass("post-body-" + id).appendTo(".post-" + id);
        $("<pre>").addClass("pre-" + id).appendTo(".post-body-" + id);
        $("<div>").addClass("post-body-content").html(contents).appendTo(".pre-" + id);
        if (image == "undefined") {

        } else {
            $("<p>").addClass("post-body-image").html('<a href="' + image + '" data-fancybox="gallery"><img class="lazy" data-origina= "' + image + '" original="' + image + '" style="max-width: 100%;max-height: 50%;border-radius: 5px;"/></a>').appendTo(".post-body-" + id)
        }
        $("<p>").addClass("post-body-time").text(time).appendTo(".post-body-" + id);
        $("<div>").addClass("post-actions action ui-navbar").addClass("post-actions-" + id).attr("data-role", "navbar").attr("role", "navigation").appendTo(".post-" + id);
        $("<ul>").addClass("ui-grid-c").addClass("post-actions-ul-" + id).appendTo(".post-actions-" + id);
        $("<li>").addClass("ui-block-a").html('<a class="ui-link ui-btn ' + is_likes + ' ui-btn-icon-left " href="#" data-post="' + id + '" data-icon="like">' + love + "</a>").appendTo(".post-actions-ul-" + id);
        $("<li>").addClass("ui-block-b").html('<a class="ui-link ui-btn ui-icon-guess ui-btn-icon-left " href="#guess-Name-Popup"  data-rel="popup" data-position-to="window"	data-transition="pop" data-post="' + id + '" data-icon="guess">' + guessCount + "/" + guessCount_all + "</a>").appendTo(".post-actions-ul-" + id);
        $("<li>").addClass("ui-block-c").html('<a class="ui-link ui-btn ui-icon-comment ui-btn-icon-left " href="#comment-Popup" data-rel="popup" data-position-to="window"	data-transition="pop" data-post="' + id + '" data-icon="comment">' + commentsCount + "</a>").appendTo(".post-actions-ul-" + id);
        $("<li>").addClass("ui-block-d").html('<a class="ui-link ui-btn ui-icon-share ui-btn-icon-left " href="#share-Popup" data-rel="popup" data-position-to="window"	data-transition="pop" data-post="' + id + '" data-icon="share">分享</a>').appendTo(".post-actions-ul-" + id)
    });
    $("#pages").attr("max", total_page).attr("total", total)
}
function getCookie(c_name) {
    if (document.cookie.length > 0) {
        c_start = document.cookie.indexOf(c_name + "=");
        if (c_start != -1) {
            c_start = c_start + c_name.length + 1;
            c_end = document.cookie.indexOf(";", c_start);
            if (c_end == -1) {
                c_end = document.cookie.length
            }
            return unescape(document.cookie.substring(c_start, c_end))
        }
    }
    return ""
}
;



<%--
  Created by IntelliJ IDEA.
  User: 段康家
  Date: 2019/12/19
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%--用户信息页面--%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户信息</title>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logo.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base_02fd8b5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_wdg_9a82ab2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_nm_4d3716e.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/uplan_wdg_1e0504d.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_wdg_9509b0e.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/autoinvest_wdg_b047393.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/detail_bde29bb.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js">
    </script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js" type="text/javascript"
            charset="utf-8"></script>


    <script type="text/javascript">
        $(function () {
            $(".ul1 li:odd").css("background", "rgba(192,192,192,0.2)");

            $("#touXiang").css({"border-radius": "15px 15px 15px 15px", "display": "inline-block"});

            $(".img11").css({"border-radius": "72px 72px 72px 72px", "display": "inline-block"});
            $(".layui-btn").css({"border-radius": "60% 60% 60% 60%", "display": "inline-block"});

            $(".up").click(function () {
                $("#form1").show("3000");
            });
            $(".btn11").click(function () {
                $("#form1").hide("3000");
            });
            $(".ren").click(function () {
                $("#form11").show("3000");
            });
            $(".btn111").click(function () {
                $("#form11").hide("3000");
            });

            //修改密码
            $("#sub1").click(function () {
                var pwd1 = $("#pwd1").val();
                var pwd2 = $("#pwd2").val();
                var pwd3 = $("#pwd3").val();
                if (pwd1 != null && pwd1.trim() != "" && pwd2 != null && pwd2.trim() != "" && pwd3 != null && pwd3.trim() != "") {

                    if (pwd2 != pwd3) {
                        layui.use("layer", function () {
                            var layer = layui.layer;
                            layer.open(
                                {
                                    offset: "200px",
                                    content: "两次密码不一致~"
                                }
                            );
                        });
                    } else {
                        $.post(
                            "${pageContext.request.contextPath}/user/updatePwd",
                            "pwd=" + pwd2,
                            function (query) {
                                if (query.query) {
                                    layui.use("layer", function () {
                                        var layer = layui.layer;
                                        layer.open(
                                            {
                                                offset: "200px",
                                                content: "修改成功,请重新登录~",
                                                btn: "确定",
                                                yes: function () {
                                                    location.href = "${pageContext.request.contextPath}/"
                                                }
                                            }
                                        );
                                    });
                                } else {
                                    layui.use("layer", function () {
                                        var layer = layui.layer;
                                        layer.open(
                                            {
                                                offset: "200px",
                                                content: "修改失败~"
                                            }
                                        );
                                    });
                                }
                            },
                            "JSON"
                        );
                    }
                } else {
                    layui.use("layer", function () {
                        var layer = layui.layer;
                        layer.open(
                            {
                                offset: "200px",
                                content: "密码新密码不能为空~",
                            }
                        );
                    });
                }
            });
            //判断密码
            $("#pwd1").blur(function () {
                var values = $(this).val();
                $.post(
                    "${pageContext.request.contextPath}/user/selectByPwd",
                    "pwd=" + values,
                    function (query) {
                        if (query.query) {
                            $("#sub1").removeAttr("disabled");
                        } else {
                            $("#sub1").attr("disabled", "disabled");
                            layui.use("layer", function () {
                                var layer = layui.layer;
                                layer.open(
                                    {
                                        offset: "200px",
                                        content: "原密码错误~"
                                    }
                                );
                            });
                        }
                    },
                    "JSON"
                );

            });
            //修改身份号
            $("#sub11").click(function () {
                var name = $("#pwd11").val();
                var card = $("#pwd22").val();
                if (name != null && name.trim() != "" && card != null && card.trim() != "") {
                    $.post(
                        "${pageContext.request.contextPath}/user/updateCard",
                        "name=" + name + "&card=" + card,
                        function (query) {
                            if (query.query) {
                                layui.use("layer", function () {
                                    var layer = layui.layer;
                                    layer.open(
                                        {
                                            offset: "200px",
                                            content: "修改成功~",
                                            btn: "确定",
                                            yes: function () {
                                                location.href = "${pageContext.request.contextPath}/addUiUserInfo"
                                            }
                                        }
                                    );
                                });
                            } else {
                                layui.use("layer", function () {
                                    var layer = layui.layer;
                                    layer.open(
                                        {
                                            offset: "200px",
                                            content: "修改失败~"
                                        }
                                    );
                                });
                            }
                        },
                        "JSON"
                    );
                } else {
                    layui.use("layer", function () {
                        var layer = layui.layer;
                        layer.open(
                            {
                                offset: "200px",
                                content: "姓名身份证号不能为空~",
                            }
                        );
                    });
                }
            });

        });

        layui.use('upload', function () {
            var upload = layui.upload;
            //执行实例
            var uploadInst = upload.render({
                elem: '#test1' //绑定元素
                , url: '${pageContext.request.contextPath}/upLoad/up' //上传接口
                , done: function (res) {
                    if (res.query) {
                        layui.use("layer", function () {
                            var layer = layui.layer;
                            layer.open(
                                {
                                    offset: "200px",
                                    content: "修改成功~",
                                    btn: "确定",
                                    yes: function (index, layero) {
                                        location.href = "${pageContext.request.contextPath}/addUiUserInfo"
                                    }
                                }
                            );

                        });
                    } else {
                        layui.use('layer', function () { //独立版的layer无需执行这一句
                            var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
                            layer.msg("修改失败~");
                        });
                    }
                }
            });

        });
    </script>
    <style>
        .sss {
            position: relative;
        }
        .layui-btn {
            position: absolute;
            top: 75px;
            left: 44%;
        }

        .uuu {
            font-size: 20px;
        }

        .uuu li {
            margin: 30px;
        }

        .login, .time, .card {

            margin-right: 25%;
        }

        .card {
            margin-right: 34%;
        }

        .time {
            margin-right: 35%;
        }

        .phone {
            margin-right: 40%;
        }

        .up {
            margin-left: 30%;
        }

        #form1, #form11 {
            margin-left: 34%;
        }

        .input {
            border-radius: 5px 5px 5px 5px;
            border: 1px solid rgba(192, 192, 192, 0.8);
            display: inline-block;
            margin-bottom: 20px;
            padding-top: 5px;
            padding-bottom: 5px;
        }

        #sub1, #sub11 {
            border-radius: 5px 5px 5px 5px;
            font-size: 15px;
            width: 100px;
            border: none;
            color: white;
            margin-left: 20%;
            padding: 6px;
            background: #FF7F27;
        }

        .btn11, .btn111 {
            border-radius: 5px 5px 5px 5px;
            padding: 6px;
            font-size: 15px;
            width: 100px;
            border: none;
            color: white;
            background: #FF7F27;
        }
    </style>
</head>

<body>
<!--[if lt IE 9]>
<div style='border: 4px solid #FFF500; background: #FDFDC8; text-align: center; clear: both; height: 75px; position: fixed; z-index:999999999; right: 2px; bottom: 2px; left: 2px; padding:0 8px;'>
    <div style='position: absolute; right: 3px; top: 3px; font-weight: bold;z-index:999999999'><a href='#'
                                                                                                  onclick='javascript:this.parentNode.parentNode.style.display="none"; return false;'>关闭</a>
    </div>
    <div style='width: 740px; margin: 0 auto; text-align: left; padding: 0; overflow: hidden; color: black;'>
        <div style='width: 675px; float: left;'>
            <div style='font-size: 16px; font-weight: bold; margin-top: 12px;'>您使用的是已经过时的IE浏览器</div>
            <div style='font-size: 13px; margin-top: 6px; line-height: 16px;'>为了让您在人人贷有最佳的使用体验，请升级到 <a
                    href="http://windows.microsoft.com/en-US/internet-explorer/download-ie">最新版本IE浏览器</a>, 或者使用其他高级浏览器如
                <a href="https://www.google.com/intl/en/chrome/browser/">Chrome(谷歌浏览器)</a> 或 <a
                        href="http://www.mozilla.org/en-US/firefox/new">Firefox(火狐浏览器)</a></div>
        </div>
    </div>
</div>
<![endif]-->
<!--导航栏-->
<div class="wdg-werenrendai-top-header">
    <div class="main-section">
        <span class="tel-phone"><i class="icon-phone"></i>客服电话: 95770</span>
        <ul class="site-nav">
            <li class="nav-item padding-item">
                <a target="_blank" rel="nofollow" href="/disclosure/information/lenderEducation">出借人教育</a>
            </li>
            <li class="nav-item padding-item">
                <a target="_blank" rel="nofollow" href="/college">人人学院</a>
            </li>
            <li class="nav-item padding-item">
                <a target="_blank" rel="nofollow" href="/about">关于我们</a>
            </li>
            <li class="nav-item padding-item">
                <a target="_blank" href="/help">帮助中心</a>
            </li>
            <li class="nav-item padding-item">
                <a target="_blank" href="http://bbs.renrendai.com/">用户论坛</a>
            </li>
            <li class="nav-item padding-item"><i class="icon-mobile3"></i>
                <a target="_blank" href="/app-download.html">移动客户端</a>
            </li>
        </ul>
    </div>
</div>

<!--第二导航栏-->
<div class="wdg-werenrendai-second-header">
    <div class="main-section current-channel-index">
        <a href="/" class="brand-logo mt15">
            <!--首页对logo添加h1标签-->
            <h1 class="rrd-logo">人人贷</h1></a>
        <ul class="site-nav">
            <li class="user-item fn-clear " num="">
                <div class="denglu active-channel">
                    <img width="30px" height="30px" id="touXiang"
                         src="http://localhost:8080/${pageContext.request.contextPath}/upload/${user.userImg}"/>
                    <a target="_self" rel="nofollow" href="${pageContext.request.contextPath}/user//selectById">我的账户</a>
                </div>
            </li>
            <li class="channel-item ">
                <a rel="nofollow" href="/disclosure/information/index">信息披露</a>
            </li>
            <li class="channel-item" style="width: 144px;">
                <a href="${pageContext.request.contextPath}/addUiRepayment" target="_blank">我要还款</a>
            </li>
            <li class="channel-item  can-lend">
                <a href="${pageContext.request.contextPath}/addUiBorrow">我要借款</a>
            </li>
            <li class="channel-item ">
                <a href="${pageContext.request.contextPath}/product//selectAll">首页</a>
            </li>
        </ul>
    </div>
</div>

<div class="wdg-account-header-widget">
    <div class="main-section">
        <ul class="account-menu fn-clear">
            <!--网站拆分，werenrendai.com和we.com展示不同的header-->

            <li><a href="${pageContext.request.contextPath}/user//selectById">P2P资产</a></li>
            <li class='active'><a href="${pageContext.request.contextPath}/addUiUserInfo">账户设置</a></li>
        </ul>
    </div>
</div>

<div class="s">
    <span style="margin-left: 48%" class="span-span">账户设置</span>
    <hr/>
    <form method="post" enctype="multipart/form-data">
        <div class="sss">
            <img class="img11" style="width: 100px;height: 100px;margin-left: 42%;margin-bottom: 30px"
                 src="http://localhost:8080/${pageContext.request.contextPath}/upload/${user.userImg}"/>
            <span style="font-size: 20px;margin-left: 2%">${user.userName}</span>
            <button type="button" class="layui-btn " id="test1" name="touXiang" style="background: sandybrown">
                <i class="layui-icon layui-icon-camera"></i>
            </button>
        </div>
    </form>
    <hr/>
    <ul class="uuu">
        <li><span class="phone">手机号：</span>${user.userPhone}</li>
        <hr/>
        <li><span class="time">注册时间：</span><fmt:formatDate value="${user.userRegisterTime}"
                                                           pattern="yyyy-MM-dd HH:mm:ss"/></li>
        <hr/>
        <li><span class="card">身份证号：</span>
            <c:if test="${user.userCard==nlll}">
                暂未实名认证
                <span class="ren" style="margin-left:40%;cursor:pointer;font-size: 15px ">去认证</span>
            </c:if>
            <c:if test="${user.userCard!=nlll}">
                ${user.userCard}
            </c:if>
        </li>
        <form id="form11" action="" method="post" style="display: none">
            <span style="margin-left: 40px">姓名：</span><input autocomplete="off" class="input" id="pwd11" type="text"
                                                             name="name"/>
            <br/>
            <span>身份证号：</span><input class="input" autocomplete="off" id="pwd22" type="text" name="card"/>
            <br/>
            <input style="cursor:pointer " class="btn111" type="button" value="取消"/> <input style="cursor:pointer "
                                                                                            id="sub11" type="button"
                                                                                            value="修改"/>
        </form>
        <hr/>
        <li><span class="login">登录密码：</span>
            <span>上次登录时间：<fmt:formatDate value="${user.userLoginTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
            <span class="up" style="cursor:pointer;font-size: 15px ">修改密码</span></li>
        <form id="form1" action="" method="post" style="display: none">
            <span style="margin-left: 17px">原密码：</span><input class="input" id="pwd1" type="password" name="pwd"/>
            <br/>
            <span style="margin-left: 17px">新密码：</span><input class="input" id="pwd2" type="password" name="newPwd"/>
            <br/>
            <span>确认密码：</span><input class="input" type="password" id="pwd3" name="pwd"/>
            <br/>
            <input style="cursor:pointer " class="btn11" type="button" value="取消"/> <input style="cursor:pointer "
                                                                                           id="sub1" type="button"
                                                                                           value="修改"/>
        </form>
        <hr/>
    </ul>

</div>

<!--底部导航栏-->
<div class="werenrendai-footer">

    <div class="footer-center">
        <div class="friend-link">
            <div class="title fn-clear">
                <div class="f-l-l">
                    快捷导航
                </div>
                <!-- <div class="exchange-link">交换友链<span class="tips">请发送邮件至link@youxin.com</span></div> -->
            </div>
            <div class="f-l-r">
                <ul class="fn-clear">
                    <li class="fn-left">
                        <a class="gray" target="_blank" href="https://www.ucredit.cn">友信普惠</a>
                    </li>
                    <li class="fn-left">
                        <a class="gray" target="_blank" href="https://www.renrendai.com/college">人人学院</a>
                    </li>
                    <li class="fn-left">
                        <a class="gray" target="_blank" href="http://bbs.renrendai.com">投资论坛</a>
                    </li>
                    <li class="fn-left">
                        <a class="gray" target="_blank" href="https://www.renrendai.com/premium.html">优选服务</a>
                    </li>
                    <li class="fn-left">
                        <a class="gray" target="_blank" href="https://www.renrendai.com/uplan.html">U享服务</a>
                    </li>
                    <li class="fn-left">
                        <a class="gray" target="_blank" href="https://www.renrendai.com/autoinvest.html">薪享服务</a>
                    </li>
                    <li class="fn-left">
                        <a class="gray" target="_blank" href="https://www.renrendai.com/loan.html">债权转让</a>
                    </li>
                    <li class="fn-left">
                        <a class="gray" target="_blank" href="https://www.renrendai.com">p2p投资</a>
                    </li>
                    <li class="fn-left">
                        <a class="gray" target="_blank" href="https://www.renrendai.com/college/dailyhot">投资资讯</a>
                    </li>
                    <li class="fn-left">
                        <a class="gray" target="_blank" href="https://www.renrendai.com/app-download.html">投资app</a>
                    </li>
                    <li class="fn-left">
                        <a class="gray" target="_blank"
                           href="https://www.renrendai.com/calculator/prodType/Loanplan">投资计算器</a>
                    </li>
                </ul>
                <!--<span class="sanjiao icon-show"><i></i></span>-->
            </div>
        </div>
        <div class="introduce" style="display: none;">
            <ul class="fn-clear">
                <li class="fn-left">
                    <a class="gray" target="_blank" href="/about/about.action?flag=contact">联系我们</a>
                </li>
            </ul>
        </div>
        <div class="introduce">
            <div class="service">
                客户服务
            </div>
            <ul class="fn-clear icons">
                <li class="fn-left">
                    <a id="wexinBtn" class="gray" href="javascript:;" tabindex="-1">微信</a>
                </li>
                <li class="fn-left">
                    <a class="gray" target="_blank" rel="external nofollow"
                       href="http://e.weibo.com/renrendai?ref=http%3A%2F%2Fwww.renrendai.com%2F">新浪微博</a>
                </li>
                <li class="fn-left">
                    <a class="gray cursor-pointer zhiCustomBtn" rel="external nofollow" target="_blank">在线客服</a>
                </li>
            </ul>
        </div>
        <div class="desc">
            <span class="up-line"></span>
            <span class="down-line"></span>
            <div class="d-l">
                <div class="first">
                    <div class="first-icon">
                        ©
                    </div>
                    <div class="year">
                        2019
                    </div>
                    <div class="first-desc">
                        人人贷商务顾问(北京)有限公司 All rights reserved
                    </div>
                </div>
                <p class="gray"><span>京ICP证 100953号</span> <span
                        style="display:inline-block;text-decoration:none;height:20px;line-height:20px;">京公网安备 11010502020657</span>
                    <a target="_blank" href="http://beian.miit.gov.cn">京ICP备12025643号-1</a>
                </p>
                <div class="dangrous">
                    <a href="//www.renrendai.com/agreement/contract/currency/cmsId/58ec7c0d090cc9096532d0ca"> <img
                            src="images/danger_0a56ffa.png" class="ser">风险提示<img src="images/right_143d153.png"
                                                                                 class="right"> </a>
                    <a href="//m.renrendai.com" class="mobile-platform"> <img
                            src="images/mobile_platform_08351bb.png"
                            class="ser"> 访问手机版 <img
                            src="images/right_143d153.png" class="right"> </a>
                </div>
            </div>
            <div class="d-c">
                <div class="d-c-wx">
                    <img src="${pageContext.request.contextPath}/img/rrd-fuwuhao.png" alt="人人贷服务号">
                </div>
                <div class="d-c-app">
                    <img src="${pageContext.request.contextPath}/img/app-weixin_3a494ac.png" alt="人人贷app下载">
                </div>
            </div>
            <div class="d-r">
                <div class="phone">
                    95770
                </div>
                <div class="time">
                    人人贷客服 (9:00-21:00)
                </div>
            </div>
        </div>
    </div>

</div>

<!--侧边栏-->
<div class="fixed-download-link">
    <div class="download-link-wrap">
        <a class="calc" href="/calculator/prodType/Loanplan" target="_blank"> <img
                src="${pageContext.request.contextPath}/img/calc_58f7ccc.png"
                alt="人人贷回报计算">
            <div class="hover">
                回报计算
            </div>
        </a>
        <a class="help zhiCustomBtn" href="javascript:;"> <img
                src="${pageContext.request.contextPath}/img/help_8052a76.png" alt="人人贷在线客服">
            <div class="hover">
                在线客服
            </div>
        </a>
        <a class="download"> <img src="${pageContext.request.contextPath}/img/download_cc99e0e.png" alt="下载APP">
            <div class="hover">
                下载APP
            </div>
        </a>
    </div>
</body>

</html>
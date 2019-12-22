<%--
  Created by IntelliJ IDEA.
  User: 段康家
  Date: 2019/12/16
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>U享服务-12月-20191214期-人人贷官网</title>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logo.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base_02fd8b5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_wdg_9a82ab2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_nm_4d3716e.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/uplan_wdg_1e0504d.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_wdg_9509b0e.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/autoinvest_wdg_b047393.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/detail_bde29bb.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js">

    </script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js" type="text/javascript"></script>
    <style type="text/css">
        .fn-clear li {
            padding-bottom: 20px;
            padding-top: 20px;
        }

        .cover {
            padding-top: 20px;
        }

        #shang, #xia {
            position: absolute;
            top: 41%;
            font-size: 30px;
            color: white;
        }

        #shang {
            left: 12.4%;
        }
    </style>

    <script type="text/javascript">
        $(function () {
            $(function () {
                $("#touXiang").css({"border-radius": "15px 15px 15px 15px", "display": "inline-block"});
            });
        });
    </script>

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
            <li class="user-item fn-clear" num="">
                <div class="denglu">
                    <img width="30px" height="30px" id="touXiang"
                         src="http://localhost:8080/${pageContext.request.contextPath}/upload/${user.userImg}"/>
                    <a target="_self" rel="nofollow" href="${pageContext.request.contextPath}/user//selectById">我的账户</a>
                </div>
            </li>
            <li class="channel-item ">
                <a rel="nofollow" href="/disclosure/information/index">信息披露</a>
            </li>
            <li class="channel-item" style="width: 144px;">
                <a href="/credit" target="_blank">我要借款/还款</a>
            </li>
            <li class="channel-item  can-lend">
                <a href="/uplan.html">我要出借</a>
            </li>
            <li class="channel-item active-channel">
                <a href="${pageContext.request.contextPath}/product//selectAll">首页</a>
            </li>
        </ul>
    </div>
</div>

<div id="uplanIndex">
    <div class="wdg-index-banner">
        <div class="banner-box">
            <a class="banner-img-box" href="/pc/newUser.html" target="_self" title="新人专区">
                <img class="banner-img" src="${pageContext.request.contextPath}/img/PCLB (1).jpg" alt="新人专区">
            </a>
        </div>
        <!--<div class="uc-amount-box">-->
        <!--<p class="uc-amount">-->
        <!--11-->
        <!--</p>-->
        <!--</div>-->
    </div>
    <div id="loanRiskTips"></div>
    <div class="mt10 container_12_1080">
        <div class="compliance-uplan">
            <div class="uplan-list">
                <ul class="fn-clear">

                    <c:if test="${products.pageNum>1}">
                        <a href="${pageContext.request.contextPath}/product//selectByType?pageNum=${products.pageNum-1}">
                            <i id="shang" class="layui-icon layui-icon-prev"></i>
                        </a>
                    </c:if>
                    <c:forEach items="${products.list}" var="pro">
                        <li>
                            <a class="cover" href="${pageContext.request.contextPath}/scattered//selectByScId?scId=${pro.scId}">
                                <p class="time">
                                    <span class="month"><em>${pro.periods}个月还款周期</em></span>
                                </p>
                                <p class="rate mtop">
                                    <span class="num"><i class="fu">${pro.rate}</i><em>%</em></span>
                                    <span class="nian">普通利率</span>
                                </p>
                                <p class="name">
                                    <em>查看详情</em>
                                </p>
                            </a>
                        </li>
                    </c:forEach>
                    <c:if test="${products.pageNum<products.pages}">
                        <a href="${pageContext.request.contextPath}/product//selectByType?pageNum=${products.pageNum+1}">
                            <i id="xia" class="layui-icon layui-icon-next"></i>
                        </a>
                    </c:if>

                </ul>

            </div>
        </div>
    </div>
</div>

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
                        <a class="gray" target="_blank" href="https://www.renrendai.com/calculator/prodType/Loanplan">投资计算器</a>
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
                    <a href="//m.renrendai.com" class="mobile-platform"> <img src="images/mobile_platform_08351bb.png"
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
        <a class="calc" href="#" target="_blank"> <img src="${pageContext.request.contextPath}/img/calc_58f7ccc.png"
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
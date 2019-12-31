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

<%--借款页面--%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>申请借款</title>
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
            layui.use(['table', 'form'], function () {
                var table = layui.table;
                var form = layui.form;
                form.render();
            });

            $("#touXiang").css({"border-radius": "15px 15px 15px 15px", "display": "inline-block"});

            $("#fff").submit(function () {
                var card = $(".card1").val();
                if (card == null || card.trim() == '') {
                    layui.use("layer", function () {
                        var layer = layui.layer;
                        layer.open(
                            {
                                offset: "200px",
                                content: "您还未实名认证,请移步去认证~",
                                btn: ["确定", "取消"],
                                yes: function () {
                                    location.href = "${pageContext.request.contextPath}/addUiUserInfo"
                                },
                                btn2: function () {
                                    layer.closeAll();
                                }
                            }
                        )
                    });
                    return false;
                }
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
                <a href="${pageContext.request.contextPath}/addUiRepayment" target="_blank">我要还款</a>
            </li>
            <li class="channel-item  can-lend active-channel">
                <a href="${pageContext.request.contextPath}/addUiBorrow">我要借款</a>
            </li>
            <li class="channel-item ">
                <a href="${pageContext.request.contextPath}/product//selectAll">首页</a>
            </li>
        </ul>
    </div>
</div>


<div class="s">
    <h1 style="margin-left: 46%;margin-bottom: 30px">借款申请</h1>

    <form id="fff" class="layui-form" action="${pageContext.request.contextPath}/scattered//insert" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">借款金额:</label>
            <div class="layui-input-block">
                <input type="text" name="rentMoney" required lay-verify="required" placeholder="请输入借款金额"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">借款周期:</label>
            <div class="layui-input-block">
                <select name="periods" lay-verify="required">
                    <option value="1">1个月</option>
                    <option value="3">3个月</option>
                    <option value="6">6个月</option>
                    <option value="12">12个月</option>
                    <option value="24">24个月</option>
                    <option value="36">36个月</option>
                </select>
            </div>
        </div>

        <input type="hidden" value="${user.userCard}" class="card1"/>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">借款说明:</label>
            <div class="layui-input-block">
                <textarea name="annotation" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
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
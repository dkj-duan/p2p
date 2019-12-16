<%--
  Created by IntelliJ IDEA.
  User: 段康家
  Date: 2019/12/14
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>登录/注册 - 人人贷官网</title>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/css/favicon-rrd.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base_02fd8b5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_wdg_9a82ab2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_nm_4d3716e.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/passport_wdg_05e7e19.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home_425674e.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>

    <script>
        $(function () {
            $('.rand-code').click(function () {
                $("#login-rand-image").attr("src","${pageContext.request.contextPath }/checkCodeServlet?time=" + new Date().getTime());
            });
            $("#tab1").click(function () {
               location.href = "${pageContext.request.contextPath }/addUlLogin"
            })
        });
    </script>

</head>

<body>

<div class="wdg-second-header-lg">
    <div class="main-section">
        <a href="#" class="brand-logo mt15 rrd-log-img"> <img
                src="${pageContext.request.contextPath}/img/rrd_logo@2x_deea0ef.png" alt="logo人人贷官方网站"> </a>
    </div>
</div>
<div class="main-content">
    <div class="login-index" data-risk-dialog="false"
         style="background:url(${pageContext.request.contextPath}/img/WechatIMG144.jpg);">
        <div class="car-center">
            <div class="data-show ">
                <form id="from" class="form-login show" method="post" action="${pageContext.request.contextPath}/user//register">
                    <div class="password-login">
                        <h2>账号注册</h2>
                        <ul>
                            <li>
                                <input class="mobile" type="text" placeholder="手机号" maxlength="48" name="userPhone"
                                       id="login_username" autocomplete="off">
                                <div class="error-info mobile-error"></div>
                            </li>
                            <li class="rand_code_show">
                                <input  class="code" autocomplete="off" name="checkCode" id="captcha_code" type="text"
                                        placeholder="图形验证码">
                                <div class="error-info code-error"></div>
                                <a href="#" class="rand-code">
                                    <img id="login-rand-image" align="absmiddle" src="${pageContext.request.contextPath }/checkCodeServlet" name="randImage"
                                         alt="验证码">
                                </a>
                                <div class="error-info mobile-error">${massage.yanZheng}</div>
                            </li>
                            <li >
                                <input class="login-passwd" autocomplete="off" id="J_pass_input" placeholder="密码"
                                       type="password" name="userPwd" data-is="isEmail">
                            </li>
                            <li class="last-li">
                                <input class="login-passwd" autocomplete="off" id="J_pass_input" placeholder="确认密码"
                                       type="password" name="verifyPwd" data-is="isEmail">
                                <div class="error-info password-error last-error">${massage.pwd}</div>
                            </li>
                        </ul>
                        <div class="button-block">
                            <button>立即登录</button>
                        </div>
                        <div class="forget-password">
                            <a href="/user/findpwd/index">忘记密码?</a>
                            <span id="tab1" tab="1">登录</span>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="login-footer">
    <ul class="lg-footer-ul">
        <li><span>© 2019 人人贷 All rights reserved</span><i></i></li>
        <li><span>人人贷商务顾问(北京)有限公司</span><i></i></li>
        <li><span>京公网安备11010502020657</span><i></i></li>
        <li>
            <a target="_blank" href="http://beian.miit.gov.cn">京ICP备12025643号-1</a><i></i></li>
        <li><span>网贷有风险，出借需谨慎<em> 按扣费后年利率计算的利息不代表对实际获得利息的承诺，风险自担</em></span></li>
    </ul>
    <!--<div class="login-company">北京微财科技有限公司</div>-->
</div>
</body>

</html>

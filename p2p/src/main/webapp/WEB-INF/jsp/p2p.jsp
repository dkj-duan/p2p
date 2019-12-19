<%--
  Created by IntelliJ IDEA.
  User: 段康家
  Date: 2019/12/13
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="en">

<head>
    <meta charset="utf-8">

    <title>【人人贷官网】专业值得信赖的p2p网络借贷信息中介平台_互联网金融平台</title>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logo.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base_02fd8b5.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_wdg_9a82ab2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_nm_4d3716e.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home_wdg_fa551d0.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index_4629d44.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js" type="text/javascript"></script>
    <script type="text/javascript">
        layui.use(['carousel','laypage'], function () {
            var carousel = layui.carousel;
            //建造实例
            carousel.render({
                elem: '#test1',
                width: '100%' //设置容器宽度
                ,
                arrow: 'hover' //始终显示箭头
                ,
                anim: 'fade' //切换动画方式
            });
        });


        $(function () {
            $(".index-uplan-box").css({
                "border-bottom": "none"
            });
            $("#touXiang").css({"border-radius":"15px 15px 15px 15px","display": "inline-block"});
        });

    </script>
</head>

<body>

</div>
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
                    <a target="_self" rel="nofollow" href="${pageContext.request.contextPath}/user//selectById">
                        我的账户
                    </a>
                </div>
            </li>
            <li class="channel-item ">
                <a rel="nofollow" href="/disclosure/,information/index">信息披露</a>
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

<!--轮播图-->
<div class="main-content">
    <div class="layui-carousel" id="test1">
        <div carousel-item>
            <div><img src="${pageContext.request.contextPath}/img/MGM-PCLB-G.jpg" width="100%" height="100%"/></div>
            <div><img src="${pageContext.request.contextPath}/img/PCLB (1).jpg" width="100%" height="100%"/></div>
            <div><img src="${pageContext.request.contextPath}/img/PCLB.jpg" width="100%" height="100%"/></div>
            <div><img src="${pageContext.request.contextPath}/img/SSE-PCLB.jpg" width="100%" height="100%"/></div>
            <div><img src="${pageContext.request.contextPath}/img/YXZG-PCLB.jpg" width="100%" height="100%"/></div>
        </div>
    </div>
</div>

<!--数据列表-->
<div class="newbee">
    <div class="new-center">
        <ul>
            <li>
                <a href="#" target="_blank"> <img src="${pageContext.request.contextPath}/img/newbee_1_92baa2b.png">
                    <div class="label-box">
                        <em>银行存管</em>
                        <p class="label-desc blank_data">交易资金通过民生银行流转<br>平台无法触碰资金</p>
                    </div>
                    <i></i> </a>
            </li>
            <li>
                <a href="#" target="_blank"> <img src="${pageContext.request.contextPath}/img/newbee_2_4c56e5c.png">
                    <div class="label-box">
                        <em>多重优势</em>
                        <p class="label-desc risk_data">借款人资质经三重审核<br>逾期率保持行业低水平</p>
                    </div>
                    <i></i> </a>
            </li>
            <li>
                <a href="#" > <img src="${pageContext.request.contextPath}/img/newbee_3_f69a139.png">
                    <div class="label-box">
                        <em>数据披露</em>
                        <p class="label-desc">平台累计注册${userList.size()}人<br>累计出借人赚取1,154,321万元</p>
                    </div>
                </a>
            </li>
        </ul>
    </div>
</div>

<div id="loanRiskTips"></div>
<!--产品信息头部-->
<div class="compliance-uplan">
    <div class="novice-top">
        <div class="no-top-l">
            <span>U享服务</span>
            <span class="product-period-intro">12个月服务期限</span>
        </div>
        <div class="no-top-r hover">
            <a class="tu" href="#"><img src="${pageContext.request.contextPath}/img/more_2_0e42693.png"></a>
            <a class="zi" href="${pageContext.request.contextPath}/product//selectByType?type=1">查看更多</a>
        </div>
    </div>
    <c:forEach items="${products1.list}" var="pro">
        <!--产品信息-->
        <div class="index-uplan-box clearfix">
            <div class="p-rate">
                <div>
                        ${pro.rate}
                    <span class="percent">%</span>
                </div>
                <div class="b-text">
                    普通利率
                </div>
            </div>
            <div class="p-month">
                <div class="t-text">
                        ${pro.period}个月
                </div>
                <div class="b-text">
                    固定服务期限
                </div>
            </div>
            <div class="p-month">
                <div class="t-text">
                        ${pro.sumMoney}
                </div>
                <div class="b-text">
                    最低授权本金
                </div>
            </div>
            <div class="p-title">
                <div class="p-title-text">
                    分散投标，专业风控
                </div>
            </div>
            <div class="p-join pt7">
                <a href="${pageContext.request.contextPath}/product//selectById?id=${pro.id}">
                    <c:if test="${pro.state==1}">授权借出</c:if>
                    <c:if test="${pro.state==2}">已满标</c:if>
                </a>
            </div>
        </div>

    </c:forEach>

</div>

<div id="loanRiskTips"></div>

<!--产品信息头部-->
<div class="compliance-uplan">
    <div class="novice-top">
        <div class="no-top-l">
            <span>薪享服务</span>
            <span class="product-period-intro">12个月服务期限</span>
        </div>
        <div class="no-top-r hover">
            <a class="tu" href="#"><img src="${pageContext.request.contextPath}/img/more_2_0e42693.png"></a>
            <a class="zi" href="${pageContext.request.contextPath}/product//selectByType?type=2">查看更多</a>
        </div>
    </div>

    <c:forEach items="${products2.list}" var="pro">
        <!--产品信息-->
        <div class="index-uplan-box clearfix">
            <div class="p-rate">
                <div>
                        ${pro.rate}
                    <span class="percent">%</span>
                </div>
                <div class="b-text">
                    普通利率
                </div>
            </div>
            <div class="p-month">
                <div class="t-text">
                        ${pro.period}个月
                </div>
                <div class="b-text">
                    固定服务期限
                </div>
            </div>
            <div class="p-month">
                <div class="t-text">
                        ${pro.sumMoney}
                </div>
                <div class="b-text">
                    最低授权本金
                </div>
            </div>
            <div class="p-title">
                <div class="p-title-text">
                    分散投标，专业风控
                </div>
            </div>
            <div class="p-join pt7">
                <a href="${pageContext.request.contextPath}/product//selectById?id=${pro.id}"
                   <c:if test="${pro.state==1}">onclick="return true" </c:if>
                   <c:if test="${pro.state==2}">onclick="return false" </c:if>
                >
                    <c:if test="${pro.state==1}">授权借出</c:if>
                    <c:if test="${pro.state==2}">已满标</c:if>
                </a>
            </div>
        </div>

    </c:forEach>

</div>

<!--散标头部-->
<div class="home-container">
    <div class="loan-index-show regular-container debt-container">
        <div class="caption clearfix">
            <div class="l-title">
                <span class="name-text">散标/债权</span>
            </div>
            <a class="r-more" rel="nofollow" href="#">
                <span class="more-link">查看更多</span>
                <img class="more-bg" src="${pageContext.request.contextPath}/img/more_2_0e42693.png">
            </a>
            <div class="index-risk-content">
                <div class="introduce-info pr-14">
                    <span>人人贷经对借款人进行信息收集和审核后所发布的借款标的。请您充分了解借款标的信息，谨慎出借。</span>
                </div>
            </div>
        </div>

        <!--表格-->
        <div class="table">
            <table class="t-caption">
                <thead>
                <tr>
                    <th class="rate regular-rate">年利率</th>
                    <th class="name">借款标题</th>
                    <th class="time">期限</th>
                    <th class="money">金额</th>
                    <th class="progress">投标进度</th>
                    <th class="action">操作</th>
                </tr>
                </thead>
                <tbody class="data-list">
                <tr class="even">
                    <td class="rate">9.60<span>%</span></td>
                    <td class="name">
                        <div class="name-line">
                            <span></span>
                            <i>NO.5586198</i>
                        </div>
                    </td>
                    <td class="time">36个月</td>
                    <td class="money"><span>106,400.00</span>元</td>
                    <td class="progress" data-percent="100">
                        <div class="percentage-text">
                            0%
                        </div>
                        <div class="outer">
                            <span class="inner"></span>
                        </div>
                    </td>
                    <td class="action">
                        <a class="disabled" href="https://www.renrendai.com/loan-5586198.html" target="_blank"
                           onclick="return false">已满标</a>
                    </td>
                </tr>
                <tr>
                    <td class="rate">9.60<span>%</span></td>
                    <td class="name">
                        <div class="name-line">
                            <span></span>
                            <i>NO.5586438</i>
                        </div>
                    </td>
                    <td class="time">36个月</td>
                    <td class="money"><span>78,800.00</span>元</td>
                    <td class="progress" data-percent="100">
                        <div class="percentage-text">
                            0%
                        </div>
                        <div class="outer">
                            <span class="inner"></span>
                        </div>
                    </td>
                    <td class="action">
                        <a class="disabled" href="https://www.renrendai.com/loan-5586438.html" target="_blank"
                           onclick="return false">已满标</a>
                    </td>
                </tr>
                <tr class="even">
                    <td class="rate">10.20<span>%</span></td>
                    <td class="name">
                        <div class="name-line">
                            <span></span>
                            <i>NO.5587132</i>
                        </div>
                    </td>
                    <td class="time">36个月</td>
                    <td class="money"><span>107,500.00</span>元</td>
                    <td class="progress" data-percent="100">
                        <div class="percentage-text">
                            0%
                        </div>
                        <div class="outer">
                            <span class="inner"></span>
                        </div>
                    </td>
                    <td class="action">
                        <a class="disabled" href="https://www.renrendai.com/loan-5587132.html" target="_blank"
                           onclick="return false">已满标</a>
                    </td>
                </tr>
                </tbody>
            </table>
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
        <a class="help zhiCustomBtn" href="javascript:;"> <img src="${pageContext.request.contextPath}/img/help_8052a76.png" alt="人人贷在线客服">
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
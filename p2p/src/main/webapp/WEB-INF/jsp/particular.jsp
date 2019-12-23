<%@ page import="cn.bdqn.utils.DateUtil" %><%--
  Created by IntelliJ IDEA.
  User: 段康家
  Date: 2019/12/17
  Time: 15:50
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/particular.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js">
    </script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js" type="text/javascript"
            charset="utf-8"></script>
    <script type="text/javascript">
        $(function () {

            $(".ul1 li:odd").css("background", "rgba(192,192,192,0.2)");

            $(".jqLi").click(function () {
                $(this).css("border-bottom", "2px solid royalblue");
                $(".jqLi1").css("border-bottom", "");
                $(".fuWu").show();
                layui.use(["table", "util"], function () {
                    var table = layui.table;
                    table.render({
                        elem: '#layui_table_id', //指定表格元素
                    });
                });
            });

            $(".jqLi1").click(function () {
                $(this).css("border-bottom", "2px solid royalblue");
                $(".jqLi").css("border-bottom", "");
                $(".fuWu").hide();
                $.post(
                    "${pageContext.request.contextPath}/bid/ajax",
                    "productId=${product.id}",
                    function (date) {

                        if (date != null && date.length > 0) {
                            layui.use("table", function () {
                                var table = layui.table;
                                var s = date;
                                table.render({
                                    elem: '#layui_table_id', //指定表格元素
                                    data: s,
                                    cellMinWidth: 50 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                                    ,
                                    skin: 'line ' //表格风格 line （行边框风格）row （列边框风格）nob （无边框风格）
                                    ,
                                    even: true //隔行换色
                                    ,
                                    page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                                        layout: ['prev', 'page', 'next', 'skip'] //自定义分页布局
                                        ,
                                        groups: 5 //只显示 1 个连续页码
                                        ,
                                        first: "首页" //不显示首页
                                        ,
                                        last: "尾页" //不显示尾页
                                    },
                                    limit: "5",
                                    method: 'post' //提交方式
                                    ,
                                    cols: [
                                        [{
                                            field: 'userName',
                                            width: 300,
                                            title: '用户名',
                                            templet: function (data) {

                                                return data.user.userName;
                                            }
                                        }, {
                                            field: 'userPhone',
                                            width: 400,
                                            title: '手机号',
                                            templet: function (data) {
                                                var newStr;
                                                if (data.user.userPhone.length === 2) {
                                                    newStr = data.user.userPhone.substr(0, 1) + '*';
                                                } else if (data.user.userPhone.length > 2) {
                                                    var char = '';
                                                    for (var i = 0, len = data.user.userPhone.length - 7; i < len; i++) {
                                                        char += '*';
                                                    }
                                                    newStr = data.user.userPhone.substr(0, 3) + char + data.user.userPhone.substr(3 + char.length);
                                                } else {
                                                    newStr = data.user.userPhone;
                                                }

                                                return newStr;
                                            }
                                        }, {
                                            field: 'bidTime',
                                            width: 510,
                                            title: "投标时间",
                                            templet: "<a href='particular.jsp'>{{layui.util.toDateString(d.bidTime, 'yyyy-MM-dd HH:mm:ss')}}</a>"

                                        }]
                                    ]
                                });
                            });
                        } else {
                            layui.use("table", function () {
                                var table = layui.table;
                                var s = [{"message": "当前没有人有投标"}];
                                table.render({
                                    elem: '#layui_table_id', //指定表格元素
                                    data: s,
                                    cellMinWidth: 50 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                                    ,
                                    skin: 'line ' //表格风格 line （行边框风格）row （列边框风格）nob （无边框风格）
                                    ,
                                    even: true //隔行换色
                                    ,
                                    page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                                        layout: ['prev', 'page', 'next', 'skip'] //自定义分页布局
                                        ,
                                        groups: 5 //只显示 1 个连续页码
                                        ,
                                        first: "首页" //不显示首页
                                        ,
                                        last: "尾页" //不显示尾页
                                    },
                                    limit: "5",
                                    method: 'post' //提交方式
                                    ,
                                    cols: [
                                        [{
                                            field: 'message',
                                            width: 300,
                                            title: '提示'
                                        }, {
                                            field: 'message',
                                            width: 400,
                                            title: '提示'
                                        }, {
                                            field: 'message',
                                            width: 510,
                                            title: '提示'
                                        }]
                                    ]
                                });
                            });
                        }

                    },
                    "JSON"
                );
            });

            $("#touXiang").css({"border-radius": "15px 15px 15px 15px", "display": "inline-block"});

            $("#form").submit(function () {
                var values = $(".input_i").val();
                if (values.trim().length<1){
                    $(".mo1").html("请输入投注金额~");
                    return false;
                }
            });
            $(".input_i").on("input propertychange", function () {
                var values = $(this).val();
                if (values <=${balance.money}) {
                    if (values <=${product.balance}) {
                        if ((!values <${product.minMoney})) {
                            $(".sub").attr("type", "submit");
                            var yue = ${product.rate}/12*values*${product.period};
                            $(".mo1").html("可获取" + yue + "元");
                        } else {
                            $(".mo1").html("起投必须大于最小起投值并小于最大起投，必须是100的整数");
                            $(".sub").attr("type", "button");
                        }
                        if (values % 100 == 0) {
                            $(".mo1").html(" ");
                            $(".sub").attr("type", "submit");
                            var yue = ${product.rate}/12*values*${product.period};
                            $(".mo1").html("可获取" + yue + "元");
                            if (values >${product.maxMoney}) {
                                $(".mo1").html("起投必须大于最小起投值并小于最大起投，必须是100的整数");
                                $(".sub").attr("type", "button");
                            } else {
                                $(".sub").attr("type", "submit");
                                $(".mo1").html(" ");
                                var yue = ${product.rate}/100/12;
                                var monoy = yue * values *${product.period};
                                $(".mo1").html("可获取" + monoy.toFixed(2) + "元");
                            }
                        } else {
                            $(".mo1").html("起投必须大于最小起投值并小于最大起投，必须是100的整数");
                            $(".sub").attr("type", "button");
                        }
                    } else {
                        $(".mo1").html("投资金额大于剩余投注金额");
                        $(".sub").attr("type", "button");
                    }
                } else {
                    $(".mo1").html("账户余额不足,请去充值~");
                    $(".sub").attr("type", "button");
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
                <a href="${pageContext.request.contextPath}/addUiRepayment" target="_blank">我要借款/还款</a>
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

<div class="s">
    <span class="span-span">${product.productName}</span>
    <hr/>
    <!--数据详细信息-->
    <div class="xiangXi">
        <ul class="liLv">
            <li class="li li1">${product.rate}<span id="span-yuan">%</span></li>
            <li>普通利率</li>
        </ul>
        <ul class="qiXian">
            <li class="li">${product.period}<span id="span-yuan">个月</span></li>
            <li>服务期限</li>
        </ul>
        <ul class="_money">
            <li class="li">${product.sumMoney}<span id="span-yuan">元</span></li>
            <li>投资金额</li>
        </ul>
    </div>

    <div class="touZi">
        <c:if test="${product.state==2}">
            <img src="${pageContext.request.contextPath}/img/READY%20(1).png"/>
        </c:if>
        <c:if test="${product.state==1}">
            <form id="form" action="${pageContext.request.contextPath}/bid//invest" method="post">
                <ul>
                    <li>账户余额 <span class="mo">${balance.money}</span> 元</li>
                        <%--                产品id--%>
                    <input type="hidden" name="productId" value="${product.id}"/>
                    <li>
                        <input class="input_i" type="text" name="bidMoney" autocomplete="off"
                               placeholder="最低起投${product.minMoney}元,最大起投${product.maxMoney}元"/>
                        <br/>
                        <span class="mo1"></span>
                    </li>
                    <li>剩余可借出金额 <span class="mo">${product.balance}</span> 元</li>
                    <li><input class="sub" type="submit" value="投注"/></li>
                </ul>
            </form>
        </c:if>
    </div>
</div>

<div id="xinXi">
    <ul class="tou">
        <li class="jqLi">
            <a id="a" href="#" onclick="return false">服务介绍</a>
        </li>
        <li class="jqLi1">
            <a href="#" onclick="return false">出借记录</a>
        </li>
    </ul>
    <table class="layui-table" id="layui_table_id"></table>
    <div class="fuWu">
        <ul class="ul1">
            <li><span>期数：</span>${product.productName}</li>
            <li><span class="jieShao">服务介绍:</span>
                ${product.describe}
            </li>
            <li><span>服务期限：</span>${product.period}个月</li>
            <li><span>服务期限结束日:</span>${finish}</li>
            <li><span>最大起投:</span>${product.maxMoney}元</li>
            <li><span>最小起投:</span>${product.minMoney}元</li>
            <li><span>产品发布时间:</span><fmt:formatDate value="${product.publishTime}"
                                                    pattern="yyyy-MM-dd"></fmt:formatDate></li>
        </ul>
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
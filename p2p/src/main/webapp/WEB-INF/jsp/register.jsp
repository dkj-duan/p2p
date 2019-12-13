<%--
  Created by IntelliJ IDEA.
  User: 段康家
  Date: 2019/12/12
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>

    <script>
        layui.use(["form","element"],function () {
            var form = layui.form;
            var element = layui.element;
            form.render();

        })
    </script>
</head>
<body>

<div class="layui-row">
    <ul class="layui-nav" lay-filter="">
        <li class="layui-nav-item layui-col-md-offset1">
            <a href="">最新活动</a>
        </li>
        <li class="layui-nav-item ">
            <a href="">产品</a>
        </li>
        <li class="layui-nav-item">
            <a href="">大数据</a>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">解决方案</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a href="#">移动模块</a>
                </dd>
                <dd>
                    <a href="#">后台模版</a>
                </dd>
                <dd>
                    <a href="#">电商平台</a>
                </dd>
            </dl>
        </li>
        <li class="layui-nav-item">
            <a href="">社区</a>
        </li>
        <li class="layui-nav-item layui-col-md-offset5">
            <a href=""><img src="resources/layui/css/modules/layer/default/icon-ext.png" class="layui-nav-img">我</a>
            <dl class="layui-nav-child">
                <dd>
                    <a href="#">修改信息</a>
                </dd>
                <dd>
                    <a href="#">安全管理</a>
                </dd>
                <dd>
                    <a href="#">退了</a>
                </dd>
            </dl>
        </li>
        <li class="layui-nav-item" style=" margin-left: 10px;"><i class="layui-icon layui-icon-login-wechat"
                                                                  style="font-size: 23px;"></i></li>
        <li class="layui-nav-item" style=" margin-left: 15px;"><i class="layui-icon layui-icon-login-qq"
                                                                  style="font-size: 23px;"></i></li>
    </ul>
</div>

<div class="layui-container" style="background: gainsboro; padding-top: 30px; padding-right: 200px;">
    <form action="${pageContext.request.contextPath}/user//login" method="post" style="padding: 30px; width: 400px " class="ll" >
        <div class="layui-form-item">
            <label class="layui-form-label">手机号：</label>
            <div class="layui-input-inline">
                <input  type="text" name="userPhone" required lay-verify="required" placeholder="请输入手机号" autocomplete="off"
                       class="layui-input">
            </div>
            <div class="layui-form-mid  layui-word-aux">辅助文字</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">验证码：</label>
            <div class="layui-input-inline">
                <input type="text" name="checkCode" required lay-verify="required" placeholder="请输入验证码"
                       autocomplete="off" class="layui-input">
            </div>
            <img style="display: inline" id="imgCheckCodeImg" src="${pageContext.request.contextPath }/checkCodeServlet" />
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码：</label>
            <div class="layui-input-inline">
                <input type="password" name="userPwd" required lay-verify="required" placeholder="请输入密码"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">辅助文字</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码：</label>
            <div class="layui-input-inline">
                <input type="password" name="verifyPwd" required lay-verify="required" placeholder="请输入密码"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">辅助文字</div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit >注册</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>

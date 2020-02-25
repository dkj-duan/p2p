<%--
  Created by IntelliJ IDEA.
  User: 段康家
  Date: 2020/1/7
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>p2p后台</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css"
          charset="UTF-8"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js" type="text/javascript"
            charset="utf-8"></script>

    <script>
        $(function () {

            //JavaScript代码区域
            layui.use(['form', 'layedit', 'element', 'laydate', "table"], function () {
                var form = layui.form
                    , element = layui.element
                    , layer = layui.layer
                    , layedit = layui.layedit
                    , laydate = layui.laydate
                    , table = layui.table; //表格

                //加载时生效
                $.post(
                    "${pageContext.request.contextPath}/product/selectAjaxByType",
                    "",
                    function (data) {
                        var s = data;
                        //执行一个 table 实例
                        table.render({
                            elem: '#demo'
                            , cellMinWidth: 50 //全局定义常规单元格的最小宽度，layui 2.2.1 新增

                            , skin: 'line ' //表格风格 line （行边框风格）row （列边框风格）nob （无边框风格）

                            , even: true //隔行换色

                            , data: s
                            , title: '用户表'
                            , page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                                layout: ['prev', 'page', 'next', 'skip'] //自定义分页布局
                                ,
                                groups: 3 //只显示 1 个连续页码
                                ,
                                first: "首页" //不显示首页
                                ,
                                last: "尾页" //不显示尾页
                            }
                            , limit: "10"
                            // ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                            , cols: [[ //表头
                                {hide: "id"}
                                , {field: 'productName', title: '标名字', width: 120}
                                , {field: 'rate', title: '利率', width: 90}
                                , {field: 'period', title: '服务周期', width: 100}
                                , {
                                    field: 'publishTime', title: '投标时间', width: 160,
                                    templet: function (values) {
                                        return layui.util.toDateString(values.publishTime, 'yyyy-MM-dd HH:mm:ss');
                                    }
                                }
                                , {field: 'identifying', title: '产品编号', width: 150}
                                , {field: 'sumMoney', title: '募捐金额', width: 200}
                                , {field: 'balance', title: '剩余金额', width: 100}
                                , {field: 'minMoney', title: '最小起投', width: 135}
                                , {field: 'maxMoney', title: '最大起投', width: 135}
                                , {
                                    field: 'finishTime', title: '满标时间', width: 160,
                                    templet: function (values) {
                                        if (values.finishTime == null) {
                                            return "未满标";
                                        } else {
                                            return layui.util.toDateString(values.finishTime, 'yyyy-MM-dd HH:mm:ss')
                                        }
                                    }
                                }
                                , {field: 'describe', title: '产品描述', width: 135}

                                , , {fixed: 'right', width: 90, align: 'center', toolbar: '#barDemo'}
                            ]]
                        });
                    },
                    "JSON"
                );

                //单击所有产品时生效
                $(".dda").click(function () {
                    $("#tttt").show("3000");
                    $("#fff").hide("3000");
                    $("#uuuu").hide("3000");
                    $.post(
                        "${pageContext.request.contextPath}/product/selectAjaxByType",
                        "",
                        function (data) {
                            var s = data;
                            //执行一个 table 实例
                            table.render({
                                elem: '#demo'
                                , cellMinWidth: 50 //全局定义常规单元格的最小宽度，layui 2.2.1 新增

                                , skin: 'line ' //表格风格 line （行边框风格）row （列边框风格）nob （无边框风格）

                                , even: true //隔行换色

                                , data: s
                                , title: '用户表'
                                , page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                                    layout: ['prev', 'page', 'next', 'skip'] //自定义分页布局
                                    ,
                                    groups: 3 //只显示 1 个连续页码
                                    ,
                                    first: "首页" //不显示首页
                                    ,
                                    last: "尾页" //不显示尾页
                                }
                                , limit: "10"
                                // ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                                , cols: [[ //表头
                                    {hide: "id"}
                                    , {field: 'productName', title: '标名字', width: 120}
                                    , {field: 'rate', title: '利率', width: 90}
                                    , {field: 'period', title: '服务周期', width: 100}
                                    , {
                                        field: 'publishTime', title: '投标时间', width: 160,
                                        templet: function (values) {
                                            return layui.util.toDateString(values.publishTime, 'yyyy-MM-dd HH:mm:ss');
                                        }
                                    }
                                    , {field: 'identifying', title: '产品编号', width: 150}
                                    , {field: 'sumMoney', title: '募捐金额', width: 200}
                                    , {field: 'balance', title: '剩余金额', width: 100}
                                    , {field: 'minMoney', title: '最小起投', width: 135}
                                    , {field: 'maxMoney', title: '最大起投', width: 135}
                                    , {
                                        field: 'finishTime', title: '满标时间', width: 160,
                                        templet: function (values) {
                                            if (values.finishTime == null) {
                                                return "未满标";
                                            } else {
                                                return layui.util.toDateString(values.finishTime, 'yyyy-MM-dd HH:mm:ss')
                                            }
                                        }
                                    }
                                    , {field: 'describe', title: '产品描述', width: 135}

                                    , , {fixed: 'right', width: 90, align: 'center', toolbar: '#barDemo'}
                                ]]
                            });
                        },
                        "JSON"
                    );
                });

                //单击U享时生效
                $(".ddU").click(function () {
                    $("#tttt").show("3000");
                    $("#fff").hide("3000");
                    $("#uuuu").hide("3000");
                    $.post(
                        "${pageContext.request.contextPath}/product/selectAjaxByType",
                        "type=1",
                        function (data) {
                            var s = data;
                            //执行一个 table 实例
                            table.render({
                                elem: '#demo'
                                , cellMinWidth: 50 //全局定义常规单元格的最小宽度，layui 2.2.1 新增

                                , skin: 'line ' //表格风格 line （行边框风格）row （列边框风格）nob （无边框风格）

                                , even: true //隔行换色

                                , data: s
                                , title: '用户表'
                                , page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                                    layout: ['prev', 'page', 'next', 'skip'] //自定义分页布局
                                    ,
                                    groups: 3 //只显示 1 个连续页码
                                    ,
                                    first: "首页" //不显示首页
                                    ,
                                    last: "尾页" //不显示尾页
                                }
                                , limit: "10"
                                // ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                                , cols: [[ //表头
                                    {hide: "id"}
                                    , {field: 'productName', title: '标名字', width: 120}
                                    , {field: 'rate', title: '利率', width: 90}
                                    , {field: 'period', title: '服务周期', width: 100}
                                    , {
                                        field: 'publishTime', title: '投标时间', width: 160,
                                        templet: function (values) {
                                            return layui.util.toDateString(values.publishTime, 'yyyy-MM-dd HH:mm:ss');
                                        }
                                    }
                                    , {field: 'identifying', title: '产品编号', width: 150}
                                    , {field: 'sumMoney', title: '募捐金额', width: 200}
                                    , {field: 'balance', title: '剩余金额', width: 100}
                                    , {field: 'minMoney', title: '最小起投', width: 135}
                                    , {field: 'maxMoney', title: '最大起投', width: 135}
                                    , {
                                        field: 'finishTime', title: '满标时间', width: 160,
                                        templet: function (values) {
                                            if (values.finishTime == null) {
                                                return "未满标";
                                            } else {
                                                return layui.util.toDateString(values.finishTime, 'yyyy-MM-dd HH:mm:ss')
                                            }
                                        }
                                    }
                                    , {field: 'describe', title: '产品描述', width: 135}

                                    , , {fixed: 'right', width: 90, align: 'center', toolbar: '#barDemo'}
                                ]]
                            });
                        },
                        "JSON"
                    );
                });

                //单击薪享时生效
                $(".ddX").click(function () {
                    $("#tttt").show("3000");
                    $("#fff").hide("3000");
                    $("#uuuu").hide("3000");
                    $.post(
                        "${pageContext.request.contextPath}/product/selectAjaxByType",
                        "type=2",
                        function (data) {
                            var s = data;
                            //执行一个 table 实例
                            table.render({
                                elem: '#demo'
                                , cellMinWidth: 50 //全局定义常规单元格的最小宽度，layui 2.2.1 新增

                                , skin: 'line ' //表格风格 line （行边框风格）row （列边框风格）nob （无边框风格）

                                , even: true //隔行换色

                                , data: s
                                , page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                                    layout: ['prev', 'page', 'next', 'skip'] //自定义分页布局
                                    ,
                                    groups: 3 //只显示 1 个连续页码
                                    ,
                                    first: "首页" //不显示首页
                                    ,
                                    last: "尾页" //不显示尾页
                                }
                                , limit: "10"
                                // ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                                , cols: [[ //表头
                                    {hide: "id"}
                                    , {field: 'productName', title: '标名字', width: 120}
                                    , {field: 'rate', title: '利率', width: 90}
                                    , {field: 'period', title: '服务周期', width: 100}
                                    , {
                                        field: 'publishTime', title: '投标时间', width: 160,
                                        templet: function (values) {
                                            return layui.util.toDateString(values.publishTime, 'yyyy-MM-dd HH:mm:ss');
                                        }
                                    }
                                    , {field: 'identifying', title: '产品编号', width: 150}
                                    , {field: 'sumMoney', title: '募捐金额', width: 200}
                                    , {field: 'balance', title: '剩余金额', width: 100}
                                    , {field: 'minMoney', title: '最小起投', width: 135}
                                    , {field: 'maxMoney', title: '最大起投', width: 135}
                                    , {
                                        field: 'finishTime', title: '满标时间', width: 160,
                                        templet: function (values) {
                                            if (values.finishTime == null) {
                                                return "未满标";
                                            } else {
                                                return layui.util.toDateString(values.finishTime, 'yyyy-MM-dd HH:mm:ss')
                                            }
                                        }
                                    }
                                    , {field: 'describe', title: '产品描述', width: 135}

                                    , , {fixed: 'right', width: 90, align: 'center', toolbar: '#barDemo'}
                                ]]
                            });
                        },
                        "JSON"
                    );
                });


                //监听行工具事件
                table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                    var data = obj.data //获得当前行数据
                        , layEvent = obj.event; //获得 lay-event 对应的值
                    if (layEvent === 'detail') {
                        alert(data.id);
                    } else if (layEvent === 'del') {
                        layer.confirm('真的删除吗？', function (index) {
                            obj.del(); //删除对应行（tr）的DOM结构
                            layer.close(index);
                            //向服务端发送删除指令
                        });
                    }
                });
                //日期
                laydate.render({
                    elem: '#date1',
                    lang: "en"
                });
                //日期
                laydate.render({
                    elem: '#date',
                    lang: "en"
                });
                form.render();
            });


            $(".dd1").click(function () {
                $("#fff").show("3000");
                $("#uuuu").hide("3000");
                $("#tttt").hide("3000");
            });
            $(".dd2").click(function () {
                $("#uuuu").show("3000");
                $("#fff").hide("3000");
                $("#tttt").hide("3000");
            });

        });


    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">p2p后台管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="dda" href="javascript:;">所有产品</a>
                    <dl class="layui-nav-child">
                        <dd class="ddU"><a href="javascript:;">U享</a></dd>
                        <dd class="ddX"><a href="javascript:;">薪享</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">发布商品</a>
                    <dl class="layui-nav-child">
                        <dd class="dd1"><a href="javascript:;">U享</a></dd>
                        <dd class="dd2"><a href="javascript:;">薪享</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>


    <%--    主体--%>
    <div class="layui-body">

        <%--        动态表格--%>
        <div id="tttt">
            <table class="layui-hide" id="demo" lay-filter="test"></table>
            <script type="text/html" id="barDemo">
                <a class="layui-btn layui-btn-xs layui-btn-xs" lay-event="detail">查看</a>
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
            </script>
        </div>


        <%--            u享--%>
        <div id="fff" style="display: none">
            <!-- 内容主体区域 -->
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
                <legend>U享添加</legend>
            </fieldset>
            <form class="layui-form layui-form-pane" action="" style="width: 800px;margin-left: 20%">
                <div class="layui-form-item">
                    <label class="layui-form-label">产品名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">投标金额</label>
                    <div class="layui-input-block">
                        <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">产品利率</label>
                    <div class="layui-input-block">
                        <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">发布日期</label>
                        <div class="layui-input-block">
                            <input type="text" name="date" id="date1" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">产品周期</label>
                    <div class="layui-input-block">
                        <input type="text" name="password" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <input type="hidden" name="type" value="1"/>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">最小起投</label>
                        <div class="layui-input-inline" style="width: 100px;">
                            <input type="text" name="price_min" placeholder="￥" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid">最大起投</div>
                        <div class="layui-input-inline" style="width: 100px;">
                            <input type="text" name="price_max" placeholder="￥" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">产品描述</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </form>
        </div>


<%--            用户页面--%>

            <div id="user">
                <table class="layui-hide" id="userTable" lay-filter="test"></table>
                <script type="text/html" id="user_1">
                    <a class="layui-btn layui-btn-xs layui-btn-xs" lay-event="detail">查看</a>
                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                </script>
            </div>

        <%--            薪享--%>
        <div id="uuuu" style="display: none">
            <!-- 内容主体区域 -->
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
                <legend>薪享添加</legend>
            </fieldset>
            <form class="layui-form layui-form-pane" action="" style="width: 800px;margin-left: 20%">
                <div class="layui-form-item">
                    <label class="layui-form-label">产品名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="productName" lay-verify="required" placeholder="请输入" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">投标金额</label>
                    <div class="layui-input-block">
                        <input type="text" name="sumMoney" lay-verify="required" lay-verType="tips" placeholder="请输入" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">产品利率</label>
                    <div class="layui-input-block">
                        <input type="text" name="rate" lay-verify="required" placeholder="请输入" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">发布日期</label>
                        <div class="layui-input-block">
                            <input type="text" name="publishTime" id="date" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">产品周期</label>
                    <div class="layui-input-block">
                        <input type="text" name="period" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <input type="hidden" name="type" value="2"/>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">最小起投</label>
                        <div class="layui-input-inline" style="width: 100px;">
                            <input type="text" name="minMoney" placeholder="￥" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid">最大起投</div>
                        <div class="layui-input-inline" style="width: 100px;">
                            <input type="text" name="maxMoney" placeholder="￥" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">产品描述</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入内容" name="describe" class="layui-textarea"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </form>
        </div>

    </div>

</div>

</body>
</html>

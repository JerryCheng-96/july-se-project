<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>XXX，欢迎来到实训管理系统！</title>
    <link rel="stylesheet" href="/res/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="">
    <jsp:include page="frame.jsp">
        <jsp:param name="cat" value="manage_person"/>
        <jsp:param name="func" value="man_engineer"/>
    </jsp:include>
    <div class="layui-body">
        <div class="layui-row">
            <br/>
            <div>
                <div style="float: left"><span style="padding-left: 15px;"><a href="" class="layui-btn">添加工程师</a></span>
                </div>
                <div style="float: right; margin-right: 15px;">
                    <div>
                        <div class="layui-input-block" style="float: left;">
                            <input type="text" name="title" required lay-verify="required" placeholder="查询..."
                                   autocomplete="off" class="layui-input">
                        </div>
                        <div style="float: right"><span style="padding-left: 15px;"><a href="" class="layui-btn"><i
                                class="layui-icon layui-icon-search"></i></a></span></div>
                    </div>
                </div>
                <div class="layui-row" style="padding: 15px;">
                    <!--在此处添加页面代码-->
                    <table id="table_engineer" lay-filter="test"></table>
                    <!--在此处添加页面代码-->
                </div>
            </div>

        </div>
    </div>
    <script src="/res/layui/layui.js"></script>
    <script src="/js/Table.js"></script>
    <script>
        layui.use('element', function () {
            var element = layui.element;
            //一些事件监听
            element.on('tab(demo)', function (data) {
                console.log(data);
            });
        });

        table_engineer();

    </script>

</body>
</html>

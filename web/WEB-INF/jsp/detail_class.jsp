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
<div class="layui-layout layui-layout-admin">
    <jsp:include page="frame.jsp">
        <jsp:param name="func" value="class_team"/>
        <jsp:param name="cat" value="class_team"/>
    </jsp:include>
    <div class="layui-body">

        <div class="layui-container">
            <br/>
            <div class="layui-row" style="padding-left: 7px">
                <h1>[班级名称]</h1>
                <h3 href="">负责工程师：[姓名]</h3>
                <hr>
                <div class="layui-btn-group">
                    <button class="layui-btn layui-btn-normal">添加学生</button>
                    <button class="layui-btn layui-btn-normal">添加小组</button>
                    <button class="layui-btn">编辑</button>
                    <button class="layui-btn layui-btn-danger">删除</button>
                </div>
            </div>
            <div class="layui-row" style="margin-left: 7px;">
                <div class="layui-tab layui-tab-card" style="width: 90%;">
                    <ul class="layui-tab-title">
                        <li class="layui-this">小组名单</li>
                        <li>学员名单</li>
                    </ul>
                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <table id="table_group" lay-filter="test"></table>
                        </div>
                        <div class="layui-tab-item">
                            <div class="layui-row" style="padding: 0px;">
                                <!--在此处添加页面代码-->
                                <table id="table_class" lay-filter="test"></table>
                                <!--在此处添加页面代码-->
                            </div>
                        </div>
                    </div>
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

        table_class();
        table_group();
    </script>
</body>

</html>


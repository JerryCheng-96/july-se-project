<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>XXX，欢迎来到实训管理系统！</title>
    <link rel="stylesheet" href="/res/layui/css/layui.css">
</head>

<body class="layui-layout-body" style="background-color: #F2F2F2">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="headersidenav.jsp">
        <jsp:param name="label" value="2"/>
    </jsp:include>
    <div class="layui-body">
        <div class="layui-container">
            <br/>
        <div class="layui-row" style="padding-left: 7px">
            <h1>[班级名称]</h1>
            <br/>
            <h3 href="">负责工程师：[姓名]</h3>
            <br/>
        </div>
        <div class="layui-row">
        <div class="layui-tab layui-tab-card" style="width: 90%;">
            <ul class="layui-tab-title">
                <li class="layui-this">学员名单</li>
                <li>小组名单</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">内容1</div>
                <div class="layui-tab-item">内容2</div>
            </div>
        </div>
        </div>
        </div>
    </div>
    <script src="/res/layui/layui.js"></script>
    <script>
        layui.use('element', function () {
            var element = layui.element;
            //一些事件监听
            element.on('tab(demo)', function (data) {
                console.log(data);
            });
        });

    </script>
</body>

</html>


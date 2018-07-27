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
    <jsp:include page="frame.jsp"/>
    <div class="layui-body">
        <div class="layui-row">
            <br/>
            <span style="padding-left: 15px;"><a href="" class="layui-btn">添加学生</a></span>
        </div>
        <div class="layui-row" style="padding: 15px;">
            <!--在此处添加页面代码-->
            <p><a href="/dashboard/class">Class Dashboard</a></p>
            <p><a href="/dashboard/team">Team Dashboard</a></p>
            <p><a href="/dashboard/engineer">Engineer Dashboard</a></p>
            <p><a href="/dashboard/student">Student Dashboard</a></p>
            <p><a href="/dashboard/person">Pop-up person info</a></p>
            <!--在此处添加页面代码-->
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

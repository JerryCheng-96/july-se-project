
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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
<jsp:include page="headersidenav.jsp" />
    <div class="layui-body">
        <div style="padding: 15px;">内容主体区域</div>
    </div>

</div>
<script src="/res/layui/layui.js"></script>
<script>
    layui.use('element', function() {
        var element = layui.element;
        //一些事件监听
        element.on('tab(demo)', function(data){
            console.log(data);
        });
    });
</script>
</body>
</html>


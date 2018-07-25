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
        <div class="layui-row" style="padding: 15px;">
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

        layui.use('layer', function () {
            var layer = layui.layer;
            layer.open({
                type: 1,
                title: '人员信息',
                content: "<div>" +
                '<img src="/res/icon/engineer.JPG" style="width:80px;height:80px;border-radius:80px;margin:0 auto;padding: 15px">' +
                '<span style="font-size: 20px">张三</span>' +
                '<br/><br/><span style="font-size: 18px;">' +
                '<p style="padding-left:25px"><b>部门</b></p>' +
                '<p style="padding-left:25px"><b>职务</b></p>' +
                '<br/>' +
                '<br/>' +
                '</span>' +
                "</div>",
                area: '350px'
            });
        });
    </script>
</body>


</html>


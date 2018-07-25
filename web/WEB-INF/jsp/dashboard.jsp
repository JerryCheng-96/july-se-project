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
    <jsp:include page="headersidenav.jsp"/>
    <div class="layui-body">
        <div class="layui-row" style="padding: 15px;">
            <div id="theCards"></div>
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

        var cardHtml = '';
        for (var i = 0; i < 10; i++) {
            if (i == 0) {
                cardHtml += '<div class="layui-row" style="padding: 10px;">'
            }
            if (i > 0 && i % 2 == 0) {
                cardHtml += '</div><div class="layui-row" style="padding: 10px;">'
            }
            cardHtml += '<div class="layui-col-md5" style="padding-left: 10px;"> <div class="layui-card"> <div class="layui-card-header">卡片面板</div> <div class="layui-card-body"> 卡片式面板面板通常用于非白色背景色的主体内<br> 从而映衬出边框投影 </div> </div> </div>';
        }
        cardHtml += '</div>'
        document.getElementById('theCards').innerHTML = cardHtml;

    </script>
</body>
</html>


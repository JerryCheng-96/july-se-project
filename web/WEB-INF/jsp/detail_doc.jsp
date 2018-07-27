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
        <jsp:param name="func" value="docs"/>
        <jsp:param name="cat" value="docs"/>
    </jsp:include>
    <div class="layui-body">
        <div class="layui-row" style="padding-left:30px;padding-top:25px;padding-right:30px;">
            <div>
                <table border="0">
                    <tr>
                        <td height="60%">
                            <span style="font-size:30px; margin:0 auto;">文档 AAAA</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="font-size: 17px">小组：[名称]</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="font-size: 17px;">作者：[名字]</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <hr>
                            <div class="layui-btn-group">
                                <button class="layui-btn">打分</button>
                                <button class="layui-btn">编辑</button>
                                <button class="layui-btn layui-btn-danger">删除</button>
                            </div>
                        </td>
                    </tr>
                </table>
                <hr>
            </div>
        </div>
        <div class="layui-row" style="padding-left:20px;padding-right:20px;">
            PLACEHOLDER
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

    var cardHtml = '';
    for (var i = 0; i < 2; i++) {
        if (i == 0) {
            cardHtml += '<div class="layui-row" style="padding: 10px;">'
        }
        if (i > 0) {
            cardHtml += '</div><div class="layui-row" style="padding: 10px;">'
        }
        cardHtml += '<div class="layui-card"> ' +
            '<div class="layui-card-header"><a href="/dashboard/doc"><b>卡片面板</b></a></div> ' +
            '<div class="layui-card-body"> 卡片式面板面板通常用于非白色背景色的主体内<br> 从而映衬出边框投影 </div> ' +
            '</div>';
    }
    cardHtml += '</div>'
    document.getElementById('theCards').innerHTML = cardHtml;

</script>

</body>
</html>

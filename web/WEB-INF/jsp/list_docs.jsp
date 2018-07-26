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
        <jsp:param name="cat" value="docs"/>
        <jsp:param name="func" value="docs"/>
    </jsp:include>

    <div class="layui-body">
        <div class="layui-row">
            <br/>
            <span style="padding-left: 35px;"><a href="" class="layui-btn">上传文档</a></span>
        </div>
        <div class="layui-row" style="padding: 15px;">
            <!--在此处添加页面代码-->
            <div id="theCards"></div>
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

    var cardHtml = '';
    for (var i = 0; i < 9; i++) {
        if (i == 0) {
            cardHtml += '<div class="layui-row" style="padding: 10px;">'
        }
        if (i > 0 && i % 3 == 0) {
            cardHtml += '</div><div class="layui-row" style="padding: 10px;">'
        }
        cardHtml += '<div class="layui-col-md4" style="padding-left: 10px;"> ' +
            '<div class="layui-card" style="background-color: #F7F7F7"> ' +
            "<div class='layui-card-header'><a href='/dashboard/doc'><b>文档 " +
            i.toString() +
            "</b></a></div> " +
            '<div class="layui-card-body"> ' +
            '卡片式面板面板通常用于非白色背景色的主体内<br> 从而映衬出边框投影 ' +
            '</div>' +
            '</div>' +
            '</div>';
    }
    cardHtml += '</div>'
    document.getElementById('theCards').innerHTML = cardHtml;

    layui.use('table', function () {
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#demo'
            //,url: '/demo/table/user/' //数据接口
            , width: '90%'
            , page: true //开启分页
            , cols: [[ //表头
                {field: 'id', title: 'ID', width: 200, sort: true, fixed: 'left'}
                , {
                    field: 'username',
                    title: '班名',
                    width: 200,
                    templet: '<div><a href="class/{{d.username}}.html" class="layui-table-link">{{d.username}}</a></div>'
                }
                , {field: 'engineer', title: '工程师', width: 200, sort: true}
            ]]
            , data: [{'id': '1', 'username': 'A210', 'engineer': 'Gong'},
                {'id': '2', 'username': 'A211', 'engineer': 'Liu'}]

        });

    });
</script>

</body>
</html>

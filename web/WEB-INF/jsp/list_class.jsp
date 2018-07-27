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
        <jsp:param name="cat" value="class_team"/>
        <jsp:param name="func" value="class_team"/>
    </jsp:include>

    <div class="layui-body">
        <div class="layui-row">
            <br/>
            <span style="padding-left: 15px;"><a href="" class="layui-btn">添加班级</a></span>
        </div>
        <div class="layui-row" style="padding: 15px;">
            <!--在此处添加页面代码-->
            <table id="demo" lay-filter="test"></table>
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
                    templet: '<div><a href="/dashboard/class" class="layui-table-link">{{d.username}}</a></div>'
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
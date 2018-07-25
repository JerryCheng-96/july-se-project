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
                <div class="layui-tab-item layui-show">
        <div class="layui-row" style="padding: 0px;">
            <!--在此处添加页面代码-->
            <table id="demo" lay-filter="test"></table>
            <!--在此处添加页面代码-->
        </div>
                </div>
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

        layui.use('table', function () {
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#demo'
            //,url: '/demo/table/user/' //数据接口
            , width: '90%'
            , page: true //开启分页
            , cols: [[ //表头
                { field: 'id', title: 'ID', width: 200, sort: true, fixed: 'left' }
                , { field: 'name', title: '姓名', width: 200, sort: true}
                , { field: 'gender', title: '性别', width: 200, sort: true }
                , { field: 'colleage', title: '学院', width: 200, sort: true}
                , { field: 'majority', title: '专业', width: 200, sort: true}
                , { field: 'grade', title: '年级', width: 200, sort: true}
                , { field: 'class', title: '班级', width: 200, sort: true, templet: '<div><a href="class/{{d.class}}.html" class="layui-table-link">{{d.class}}</a></div>' }
            ]]
            , data: [{'id':10, 'name': 'Zhang', 'gender': 'male', 'colleage': 'Software','majority': 'SE','grade': '2016' ,'class':'A210'},
                {'id':11, 'name': 'Deng', 'gender': 'male', 'colleage': 'Software','majority': 'SE','grade': '2016' ,'class':'A210'},
                {'id':5, 'name': 'Wang', 'gender': 'male', 'colleage': 'Software','majority': 'SE','grade': '2016' ,'class':'A211'},
                {'id':6, 'name': 'Li', 'gender': 'female', 'colleage': 'Software','majority': 'SE','grade': '2016' ,'class':'A211'}]

        });
    });

    </script>
</body>

</html>

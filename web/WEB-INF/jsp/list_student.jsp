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
        <jsp:param name="cat" value="manage_person"/>
        <jsp:param name="func" value="man_student"/>
    </jsp:include>

    <div class="layui-body">
        <div class="layui-row">
            <br/>
            <span style="padding-left: 15px;"><a href="" class="layui-btn">添加学生</a></span>
            <span style="padding-left: 15px;"><a href="" class="layui-btn layui-btn-primary">批量导入</a></span>
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
            ,
            width: '90%'
            ,
            page: true //开启分页
            ,
            cols: [[ //表头
                {field: 'id', title: 'ID', width: 200, sort: true, fixed: 'left'}
                , {field: 'name', title: '姓名', width: 200, sort: true}
                , {field: 'gender', title: '性别', width: 200, sort: true}
                , {field: 'colleage', title: '学院', width: 200, sort: true}
                , {field: 'majority', title: '专业', width: 200, sort: true}
                , {field: 'grade', title: '年级', width: 200, sort: true}
                , {
                    field: 'class',
                    title: '班级',
                    width: 200,
                    sort: true,
                    templet: '<div><a href="class/{{d.class}}.html" class="layui-table-link">{{d.class}}</a></div>'
                }
            ]]
            ,
            data: [{
                'id': 10,
                'name': 'Zhang',
                'gender': 'male',
                'colleage': 'Software',
                'majority': 'SE',
                'grade': '2016',
                'class': 'A210'
            },
                {
                    'id': 11,
                    'name': 'Deng',
                    'gender': 'male',
                    'colleage': 'Software',
                    'majority': 'SE',
                    'grade': '2016',
                    'class': 'A210'
                },
                {
                    'id': 5,
                    'name': 'Wang',
                    'gender': 'male',
                    'colleage': 'Software',
                    'majority': 'SE',
                    'grade': '2016',
                    'class': 'A211'
                },
                {
                    'id': 6,
                    'name': 'Li',
                    'gender': 'female',
                    'colleage': 'Software',
                    'majority': 'SE',
                    'grade': '2016',
                    'class': 'A211'
                }]

        });


    });
</script>

</body>
</html>

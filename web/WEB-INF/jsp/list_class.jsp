<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>班级管理 - TOSIT 实训管理系统</title>
    <link rel="stylesheet" href="/res/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="">

    <jsp:include page="frame.jsp">
        <jsp:param name="cat" value="class_team"/>
        <jsp:param name="func" value="class_team"/>
    </jsp:include>

    <div class="layui-body">
        <div class="layui-row">
            <br/>
            <span style="padding-left: 15px;"><a href="/manage/class/new" class="layui-btn">添加班级</a></span>
        </div>
        <div class="layui-row" style="padding: 15px;">
            <!--在此处添加页面代码-->
            <table id="table_class" lay-filter="table_class"></table>
            <!--在此处添加页面代码-->
        </div>
    </div>

</div>
<script src="/res/layui/layui.js"></script>
    <script src="/js/Interaction.js"></script>
    <script src="/js/PopUp.js"></script>
    <script src="/js/Table.js"></script>
<script>
    layui.use(['table', 'element'], function () {
        var element = layui.element;
        var table = layui.table;

        element.on('tab(demo)', function (data) {
            console.log(data);
        });

        table_class(table, function () {
            ;
        }, '/manage/class/moreData');

    });

</script>

</body>
</html>

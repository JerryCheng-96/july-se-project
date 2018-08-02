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
<div class="">
    <jsp:include page="frame.jsp">
        <jsp:param name="cat" value="man_teach"/>
        <jsp:param name="func" value="teach_plan"/>
    </jsp:include>
    <div class="layui-body">
        <div class="layui-row">
            <br/>
            <div>
                <div style="float: left"><span style="padding-left: 15px;"><a
                        href="javascript:popup_layer_engineer_edit(undefined, function() { lay.table.reload('table_engineer'); })"
                        class="layui-btn">添加教学计划</a></span>
                </div>
                <div style="float: right; margin-right: 15px;">

                </div>
                <div class="layui-row" style="padding: 15px;">
                    <!--在此处添加页面代码-->
                    <table id="table_program" lay-filter="table_program"></table>
                    <!--在此处添加页面代码-->
                </div>
            </div>

        </div>
    </div>

    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>

    <script src="/res/layui/layui.js"></script>
    <script src="/js/Interaction.js"></script>
    <script src="/js/PopUp.js"></script>
    <script src="/js/Table.js"></script>
    <script>
        var lay = layui.use(['element', 'table'], function () {
            var element = layui.element;
            //一些事件监听
            element.on('tab(demo)', function (data) {
                console.log(data);
            });

            var theTable = layui.table;
            var update_table = function () {
                theTable.reload('table_engineer');
            }
            table_program(theTable, update_table, '/manage/program/moreData');
        });
    </script>
</body>
</html>

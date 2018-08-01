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
        <jsp:param name="func" value="class_team"/>
        <jsp:param name="cat" value="class_team"/>
    </jsp:include>
    <div class="layui-body">

        <div class="layui-container">
            <br/>
            <div class="layui-row" style="padding-left: 7px">
                <h1 id="className">[班级名称]</h1>
                <h3>负责工程师：<a id="classEngineerName"></a></h3>
                <h3>适用教学计划：<a id="classProgramName"></a></h3>
                <h3 id="classDescription" style="color: gray;padding-top: 10px;">班级描述</h3>
                <hr>
                <div class="layui-btn-group">
                    <button class="layui-btn layui-btn-normal">添加学生</button>
                    <button class="layui-btn layui-btn-normal">添加小组</button>
                    <button class="layui-btn">编辑</button>
                    <button class="layui-btn layui-btn-danger">删除</button>
                </div>
            </div>
            <div class="layui-row" style="margin-left: 7px;">
                <div class="layui-tab layui-tab-card" style="width: 90%;">
                    <ul class="layui-tab-title">
                        <li class="layui-this">小组名单</li>
                        <li>学员名单</li>
                    </ul>
                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <table id="table_group" lay-filter="test"></table>
                        </div>
                        <div class="layui-tab-item">
                            <div class="layui-row" style="padding: 0px;">
                                <!--在此处添加页面代码-->
                                <table id="tableStudent" lay-filter="tableStudent"></table>
                                <!--在此处添加页面代码-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/res/layui/layui.js"></script>
    <script src="/js/Interaction.js"></script>
    <script src="/js/PopUp.js"></script>
    <script src="/js/Table.js"></script>
    <script>
        var theClassId = getQueryVariable('id');

        layui.use(['table', 'element'], function () {
            var element = layui.element;
            var table = layui.table;
            //一些事件监听
            element.on('tab(demo)', function (data) {
                console.log(data);
            });

            table_student(table, function () {
                ;
            }, "/manage/class/getStudent?classID=" + theClassId);
        });

        function refresh() {
            HttpGetResponse('/manage/class/getOne?ID=' + theClassId, function (response) {
                var theJson = JSON.parse(response);
                console.log(theJson);
                document.getElementById('className').innerHTML = theJson.className;
                document.getElementById('classDescription').innerHTML = theJson.classDescription;
                HttpGetResponse('/manage/engineer/getOne?ID=' + theJson.classManager,
                    function (response) {
                        document.getElementById('classEngineerName').innerHTML = JSON.parse(response).engineerName;
                        document.getElementById('classEngineerName').setAttribute('href', "javascript:show_popup_layer_engineer(" + theJson.classManager + ");");
                    }, undefined);
                // document.getElementById('editBtn').setAttribute('href', '/manage/project/edit?id=' + theJson.projectId);
            }, function () {
                ;
            });
        }

        refresh();

    </script>
</body>

</html>


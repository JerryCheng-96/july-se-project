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
        <jsp:param name="cat" value="class_team"/>
        <jsp:param name="func" value="class_team"/>
    </jsp:include>

    <div class="layui-body">
        <div class="layui-row">
            <div style="margin-top: 2%;margin-right: 3%;">
                <div>
                    <h1 style="padding-left: 32px; float: left;"><u id="title">添加学生</u></h1>
                    <a style="float: right;" href="javascript:done();" class="layui-btn">完成</a>
                </div>
            </div>
        </div>
        <div class="layui-row" style="padding-left: 32px; padding-right: 32px; padding-top: 10px">
            <div style="">
                <table id="tableStudent" lay-filter="tableStudent"></table>
            </div>
        </div>
    </div>

</div>
<script type="text/html" id="addStudent">
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="addToClass">添加</a>
</script>
<script src="/res/layui/layui.js"></script>
<script src="/js/Interaction.js"></script>
<script src="/js/PopUp.js"></script>
<script src="/js/Table.js"></script>
<script>
    var theClassId = getQueryVariable('classId');

    layui.use(['element', 'table'], function () {
        var element = layui.element;
        var table = layui.table;
        //一些事件监听
        element.on('tab(demo)', function (data) {
            console.log(data);
        });

        HttpGetResponse('/manage/class/getOne?ID=' + theClassId, function (response) {
            var theJson = JSON.parse(response);
            document.getElementById('title').innerHTML = '向 ' + theJson.className + ' 添加学生';
        }, function () {
            ;
        });

        table_student(table, function (studentId) {
            HttpGetResponse('/manage/student/getOne?ID=' + studentId,
                function (response) {
                    var theJson = JSON.parse(response);
                    theJson.studentClass = theClassId;
                    HttpPost('/manage/student/update', theJson, function () {
                        table.reload('tableStudent');
                    }, function (msg) {
                        layer.alert(msg);
                    });
                }, undefined);
        }, '/manage/class/getStudent', 'no', '#addStudent');


    });

    function done() {
        window.location.href = '/dashboard/class?id=' + theClassId;
    }
</script>

</body>
</html>


<div class="layui-form-item">
    <div class="layui-input-block" style="margin-left: 3%;">
        <button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
</div>

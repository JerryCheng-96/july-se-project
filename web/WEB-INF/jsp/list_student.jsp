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
        <jsp:param name="cat" value="manage_person"/>
        <jsp:param name="func" value="man_student"/>
    </jsp:include>

    <div class="layui-body">
        <div class="layui-row">
            <br/>
            <span style="padding-left: 15px;"><a href="javascript:popup_student_edit(undefined, function() { lay.table.reload('tableStudent'); })" class="layui-btn">添加学生</a></span>
            <span style="padding-left: 15px;"><a class="layui-btn layui-btn-primary" id="importStudent"><i class="layui-icon">&#xe67c;</i>批量导入</a></span>
        </div>
        <div class="layui-row" style="padding: 15px;">
            <!--在此处添加页面代码-->
            <table id="tableStudent" lay-filter="tableStudent"></table>
            <!--在此处添加页面代码-->
        </div>
    </div>

</div>
<script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
<script src="/res/layui/layui.js"></script>
<script src="/js/Interaction.js"></script>
<script src="/js/Table.js"></script>
<script src="/js/PopUp.js"></script>
<script>
    var lay = layui.use(['element', 'table', 'upload'], function () {
        var element = layui.element;
        //一些事件监听
        element.on('tab(demo)', function (data) {
            console.log(data);
        });

        var table = layui.table;
        table_student(table, function () {
            table.reload('tableStudent')
        }, '/manage/student/moreData');

        var upload = layui.upload;
        var uploadInst = upload.render({
            elem: '#importStudent' //绑定元素
            ,url: '/manage/student/doImport' //上传接口
            ,accept:'file'
            //,data:{ teamID:1 }  //require a document json
            ,done: function(res){
                //上传完毕回调
                console.log(res);
            }
            ,error: function(){
                //请求异常回调
            }
        });
    });
</script>
</body>
</html>

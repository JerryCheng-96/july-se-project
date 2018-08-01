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
                <h1 style="padding-left: 32px"><u>创建班级</u></h1>
                <br/>

                <h2 style="padding-left: 32px">第 1 步：输入班级名称及描述</h2>
                <br/>
                <form class="layui-form" action="">
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="margin-left: 3%;">
                            <input type="text" id="projectName" name="projectName" required lay-verify="required"
                                   placeholder="项目标题"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item layui-form-text">
                        <div class="layui-input-block" style="margin-left: 3%;">
                        <textarea id="projectDescription" name="projectDescription" placeholder="项目描述"
                                  class="layui-textarea"></textarea>
                        </div>
                    </div>
                </form>

                <br/>
                <br/>
                <h2 style="padding-left: 32px">第 2 步：选择负责工程师</h2>
                <div style="padding-left: 32px">
                    <table id="table_engineer" lay-filter="table_engineer"></table>
                </div>

                <br/>
                <br/>
                <div id="stepThree" style="display: none;">
                    <h2 style="padding-left: 32px">第 3 步：选择适用教学计划</h2>
                    <div style="padding-left: 32px">
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-row" style="padding: 15px;">
        </div>
    </div>

</div>
<script type="text/html" id="selectEngineer">
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="select">选择</a>
</script>
<script src="/res/layui/layui.js"></script>
<script src="/js/Interaction.js"></script>
<script src="/js/PopUp.js"></script>
<script src="/js/Table.js"></script>
<script>
    layui.use(['element', 'table'], function () {
        var element = layui.element;
        var table = layui.table;
        //一些事件监听
        element.on('tab(demo)', function (data) {
            console.log(data);
        });

        var showEngineerProgram = function (engineerId) {
            document.getElementById('stepThree').setAttribute('style', '');
        }

        table_engineer(table, showEngineerProgram, '#selectEngineer');
    });
</script>

</body>
</html>


<div class="layui-form-item">
    <div class="layui-input-block" style="margin-left: 3%;">
        <button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
</div>

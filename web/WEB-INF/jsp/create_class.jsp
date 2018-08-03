<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>创建班级 - TOSIT 实训管理系统</title>
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
            <form class="layui-form" action="">
                <div style="margin-top: 2%;margin-right: 3%;">
                    <h1 style="padding-left: 32px"><u>创建班级</u></h1>
                    <br/>

                    <h2 style="padding-left: 32px">第 1 步：输入班级编号、名称及描述</h2>
                    <br/>
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="margin-left: 3%;">
                            <input type="text" id="classId" name="classId" required lay-verify="required"
                                   placeholder="班级编号"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="margin-left: 3%;">
                            <input type="text" id="className" name="className" required lay-verify="required"
                                   placeholder="班级名称"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item layui-form-text">
                        <div class="layui-input-block" style="margin-left: 3%;">
                        <textarea id="classDescription" name="classDescription" placeholder="班级描述"
                                  class="layui-textarea"></textarea>
                        </div>
                    </div>

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
                            <table id="table_program" lay-filter="table_program"></table>
                        </div>
                    </div>

                    <br/>
                    <div class="layui-form-item">
                        <div class="layui-form-item" id="submitButton" style="display: none;">
                            <div class="layui-input-block" style="margin-left: 32px;">
                                <button class="layui-btn" lay-submit lay-filter="formDemo">创建班级</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
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
    var selectedEngineerId = '';
    var selectedProgramId = '';

    layui.use(['element', 'table', 'form'], function () {
        var element = layui.element;
        var table = layui.table;
        //一些事件监听
        element.on('tab(demo)', function (data) {
            console.log(data);
        });

        var showSubmitBtn = function (programId) {
            document.getElementById('submitButton').setAttribute('style', '');
            selectedProgramId = programId;
        }

        var showEngineerProgram = function (engineerId) {
            selectedProgramId = '';
            document.getElementById('stepThree').setAttribute('style', '');
            table_program(table, showSubmitBtn, '/manage/engineer/getProgram?engineerID=' + engineerId, 'no', '#selectEngineer');
            selectedEngineerId = engineerId;
        }

        table_engineer(table, showEngineerProgram, '#selectEngineer');

        var form = layui.form;
        form.on('submit(formDemo)', function (data) {
            var theJson = data.field;
            theJson.classManager = selectedEngineerId;
            theJson.classProgram = selectedProgramId;
            console.log((theJson));
            HttpPost("/manage/class/new", theJson, function () {
                window.location.href = '/manage/class';
            }, function () {
                ;
            });
            return false;
        });
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

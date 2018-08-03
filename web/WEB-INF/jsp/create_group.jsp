<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>创建小组 - TOSIT 实训管理系统</title>
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
                    <h1 style="padding-left: 32px"><u>在班级 <span id="className"></span> 中创建小组</u></h1>
                    <br/>

                    <h2 style="padding-left: 32px">第 1 步：输入小组编号及名称</h2>
                    <br/>
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="margin-left: 3%;">
                            <input type="text" id="groupId" name="groupId" required lay-verify="required"
                                   placeholder="小组编号"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="margin-left: 3%;">
                            <input type="text" id="groupName" name="groupName" required lay-verify="required"
                                   placeholder="小组名称"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <br/>
                    <br/>
                    <h2 style="padding-left: 32px">第 2 步：选择项目</h2>
                    <div style="padding-left: 32px">
                        <table id="table_project" lay-filter="table_project"></table>
                    </div>

                    <br/>
                    <div class="layui-form-item">
                        <div class="layui-form-item" id="submitButton" style="display: none;">
                            <div class="layui-input-block" style="margin-left: 32px;">
                                <button class="layui-btn" lay-submit lay-filter="formDemo">创建小组</button>
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
    var theClassId = getQueryVariable('classId');
    var selectedProjectId = '';

    layui.use(['element', 'table', 'form'], function () {
        var element = layui.element;
        var table = layui.table;
        var form = layui.form;
        //一些事件监听
        element.on('tab(demo)', function (data) {
            console.log(data);
        });

        var showSubmitBtn = function (programId) {
            document.getElementById('submitButton').setAttribute('style', '');
            selectedProgramId = programId;
        }

        HttpGetResponse('/manage/class/getOne?ID=' + theClassId, function (response) {
            var theClassJson = JSON.parse(response);
            document.getElementById('className').innerText = theClassJson.className;
            table_project(table, function (projectId) {
                selectedProjectId = projectId;
                showSubmitBtn();
            }, '/manage/engineer/getProject?engineerID=' + theClassJson.classManager, '#selectEngineer');

            form.on('submit(formDemo)', function (data) {
                var theJson = data.field;
                theJson.groupOnproject = selectedProjectId;
                theJson.groupFromclass = theClassId;
                console.log((theJson));
                HttpPost("/manage/group/new", theJson, function () {
                    window.location.href = '/dashboard/class?id=' + theClassId;
                }, function () {
                    ;
                });
                return false;
            });
        })


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

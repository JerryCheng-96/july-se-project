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
        <jsp:param name="func" value="projects"/>
        <jsp:param name="cat" value="projects"/>
    </jsp:include>
    <div class="layui-body">
        <div style="margin-top: 2%;margin-right: 3%;">
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <div class="layui-input-block" style="margin-left: 3%;">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block" style="margin-left: 3%;">
                        <input type="text" id="projectName" name="projectName" required lay-verify="required" placeholder="项目标题"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <div class="layui-input-block" style="margin-left: 3%;">
                        <textarea id="projectDescription" name="projectDescription" placeholder="项目描述" class="layui-textarea"></textarea>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>
<script src="/res/layui/layui.js"></script>
<script src="/js/Interaction.js"></script>
<script>
    layui.use(['element', 'form'], function () {
        var element = layui.element;
        //一些事件监听
        element.on('tab(demo)', function (data) {
            console.log(data);
        });

        var theProjId = getQueryVariable('id');
        var theJson = {};

        if (theProjId != false) {
            HttpGetResponse('/manage/project/getOne?ID=' + theProjId, function (response) {
                theJson = JSON.parse(response);
                console.log(theJson);
                document.getElementById('projectName').setAttribute('value', theJson.projectName);
                document.getElementById('projectDescription').innerText =  theJson.projectDescription;
            }, function () {
                ;
            });
        }

        var form = layui.form;
        form.on('submit(formDemo)', function (data) {
            theJson.projectApproved = 0;
            theJson.projectName = data.field.projectName;
            theJson.projectDescription = data.field.projectDescription;

            if (theProjId != false) {
                console.log(JSON.stringify(theJson));
                HttpPost("/manage/project/update", JSON.stringify(theJson), function () {
                    history.go(-1);
                });
            }
            else {
                theJson.projectCreator = 100001;
                theJson.projectId = -1;

                console.log(JSON.stringify(theJson));
                HttpPost("/manage/project/new", JSON.stringify(theJson), function () {
                    ;
                });
            }

            return false;
        });


    });

</script>

</body>
</html>

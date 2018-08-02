<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>XXX - 个人中心</title>
    <link rel="stylesheet" href="/res/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="">
    <jsp:include page="frame.jsp">
        <jsp:param name="func" value="dashboard"/>
        <jsp:param name="cat" value="dashboard"/>
    </jsp:include>
    <div class="layui-body">
        <div class="layui-row" style="padding-left:30px;padding-top:25px;padding-right:30px;">
            <div>
                <table border="0">
                    <tr>
                        <th rowspan="2">
                            <img src="/res/icon/8.jpg"
                                 style="width:120px;height:120px;border-radius:120px;margin:0 auto;padding:5px;">
                        </th>
                        <td height="60%">
                            <span id="engineerName" style="font-size:30px; margin:0 auto; padding-left: 30px;"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="padding-left:30px; font-size: 17px"><span id="engineerCompany"></span>, <span
                                    id="engineerDepartment"></span>, <span id="engineerJob"></span> </span>
                        </td>
                    </tr>
                </table>
                <hr>
            </div>
        </div>
        <div id="theCards" class="layui-row" style="padding-left:20px;padding-right:20px;">
            <div class="layui-col-md4" style="padding:10px;">
                <div class="layui-card" style="background-color: #F7F7F7;">
                    <div class="layui-card-header"><b>项目</b></div>
                    <div class="layui-card-body">
                        <span id="projList"></span>
                        <br/>
                        <a href="javascript:showTable('listProject');" style="color: blue">查看更多...</a>
                    </div>
                </div>
            </div>
            <div class="layui-col-md4" style="padding:10px;">
                <div class="layui-card" style="background-color: #F7F7F7">
                    <div class="layui-card-header"><b>教学计划</b></div>
                    <div class="layui-card-body">
                        <span id="programList"></span>
                        <br/>
                        <a href="javascript:showTable('listProgram');" style="color: blue">查看更多...</a>
                    </div>
                </div>
                <div class="layui-card" style="background-color: #F7F7F7">
                    <div class="layui-card-header"><b>教学任务</b></div>
                    <div class="layui-card-body">
                        <p style="color: #CCCCCC">当前无教学任务</p>
                    </div>
                </div>
            </div>
            <div class="layui-col-md4" style="padding:10px;">
                <div class="layui-card" style="background-color: #F7F7F7">
                    <div class="layui-card-header"><b>负责班级</b></div>
                    <div class="layui-card-body">
                        <span id="classList"></span>
                        <br/>
                        <a href="javascript:showTable('listClass');" style="color: blue">查看更多...</a>
                    </div>
                </div>
            </div>
        </div>

        <div id="listProject" class="layui-row" style="display: none;">
            <table id="table_project" lay-filter="table_group"></table>
            <a style="margin-top: 10px" href="javascript:hideTable('listProject');" class="layui-btn">完成</a>
            <br/>
            <br/>
        </div>

        <div id="listProgram" class="layui-row" style="display: none;">
            <table id="table_program" lay-filter="table_group"></table>
            <a style="margin-top: 10px" href="javascript:hideTable('listProgram');" class="layui-btn">完成</a>
            <br/>
            <br/>
        </div>

        <div id="listClass" class="layui-row" style="display: none;">
            <table id="table_class" lay-filter="table_group"></table>
            <a style="margin-top: 10px" href="javascript:hideTable('listClass');" class="layui-btn">完成</a>
            <br/>
            <br/>
        </div>

    </div>
</div>
<script src="/res/layui/layui.js"></script>
<script src="/js/Interaction.js"></script>
<script src="/js/PopUp.js"></script>
<script src="/js/Table.js"></script>
<script>
    var theEngineerId = getQueryVariable('id');

    layui.use(['table', 'element'], function () {
        var element = layui.element;
        var table = layui.table;
        //一些事件监听
        element.on('tab(demo)', function (data) {
            console.log(data);
        });

        HttpGetResponse('/manage/engineer/getOne?ID=' + theEngineerId, function (response) {
            var theEngineerJson = JSON.parse(response);
            document.getElementById('engineerName').innerText = theEngineerJson.engineerName;
            document.getElementById('engineerCompany').innerText = theEngineerJson.engineerCompany;
            document.getElementById('engineerDepartment').innerText = theEngineerJson.engineerDepartment;
            document.getElementById('engineerJob').innerText = theEngineerJson.engineerJob;
        }, function () {
            ;
        })

        var theProjectsJson = {};
        var theProjListHtml = '';
        HttpGetResponse('/manage/engineer/getProject?page=1&limit=3&engineerID=' + theEngineerId, function (response) {
            theProjectsJson = JSON.parse(response);
            console.log('theProjJson');
            console.log(theProjectsJson);
            for (var i = 0; i < theProjectsJson.data.length; i++) {
                theProjListHtml += '<p><a href="/dashboard/project?id=' + theProjectsJson.data[i].projectId + '">' + theProjectsJson.data[i].projectName + '</a></p>'
                console.log(theProjListHtml);
            }
            console.log(theProjListHtml);
            document.getElementById('projList').innerHTML = theProjListHtml;
            table_project(table, function () {
                ;
            }, '/manage/engineer/getProject?engineerID=' + theEngineerId, '');
        });

        var theProgramsJson = {};
        var theProgramListHtml = '';
        HttpGetResponse('/manage/engineer/getProgram?page=1&limit=3&engineerID=' + theEngineerId, function (response) {
            theProgramsJson = JSON.parse(response);
            console.log('theProgramsJson');
            console.log(theProgramsJson);
            for (var i = 0; i < theProgramsJson.data.length; i++) {
                theProgramListHtml += '<p><a href="/dashboard/program?id=' + theProgramsJson.data[i].programId + '">' + theProgramsJson.data[i].programName + '</a></p>'
                console.log(theProgramListHtml);
            }
            console.log(theProgramListHtml);
            document.getElementById('programList').innerHTML = theProgramListHtml;
            table_program(table, function () {
                ;
            }, '/manage/engineer/getProgram?engineerID=' + theEngineerId, 'no', '');
        });

        var theClassesJson = {};
        var theClassListHtml = '';
        HttpGetResponse('/manage/engineer/getClass?page=1&limit=3&engineerID=' + theEngineerId, function (response) {
            theClassesJson = JSON.parse(response);
            console.log('theClassesJson');
            console.log(theClassesJson);
            for (var i = 0; i < theClassesJson.data.length; i++) {
                theClassListHtml += '<p><a href="/dashboard/class?id=' + theClassesJson.data[i].classId + '">' + theClassesJson.data[i].className + '</a></p>'
                console.log(theClassListHtml);
            }
            console.log(theClassListHtml);
            document.getElementById('classList').innerHTML = theClassListHtml;
            table_class(table, function () {
                ;
            }, '/manage/engineer/getClass?engineerID=' + theEngineerId);
        });

    });

    function showTable(id) {
        document.getElementById(id).setAttribute('style', 'padding-left:30px;padding-right:30px;');
        document.getElementById('theCards').setAttribute('style', 'display:none;');
    }

    function hideTable(id) {
        document.getElementById('theCards').setAttribute('style', 'padding-left:20px;padding-right:20px;');
        document.getElementById(id).setAttribute('style', 'display:none;');
    }


</script>

</body>
</html>

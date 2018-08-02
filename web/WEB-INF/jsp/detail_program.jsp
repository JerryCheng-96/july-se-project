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
        <div class="layui-row" style="padding-left:30px;padding-top:25px;padding-right:30px;">
            <div>
                <table border="0">
                    <tr>
                        <td height="60%">
                            <span id="projectName" style="font-size:30px; margin:0 auto;">项目 ABCD</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span id="engineerName" style="font-size: 17px;">负责工程师：[名字]</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <hr>
                            <div class="layui-btn-group">
                                <a href="javascript:show_program_edit(theProgramId, function() { refresh(); })"
                                   class="layui-btn">编辑</a>
                                <a href="javascript:deleteProgram();" class="layui-btn layui-btn-danger">删除</a>
                            </div>
                        </td>
                    </tr>
                </table>
                <hr>
            </div>
        </div>

        <div id="theCards" class="layui-row" style="padding-left:20px;padding-right:20px;">
            <div class="layui-col-md8" style="padding:10px;">
                <div class="layui-card" style="background-color: #F7F7F7">
                    <div class="layui-card-header"><b>计划描述</b></div>
                    <div id="projectDescription" class="layui-card-body">
                    </div>
                </div>
            </div>
            <div class="layui-col-md4" style="padding: 10px;">
                <div class="layui-card" style="background-color: #F7F7F7">
                    <div class="layui-card-header"><b>班级</b></div>
                    <div class="layui-card-body">
                        <span id="classList"></span>
                        <br/>
                        <a href="javascript:showTable('listClass');" style="color: blue">查看更多...</a>
                    </div>
                </div>
            </div>
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
    var theProgramId = getQueryVariable('id');

    layui.use(['table', 'element'], function () {
        var element = layui.element;
        var table = layui.table;
        //一些事件监听
        element.on('tab(demo)', function (data) {
            console.log(data);
        });

        var theClassesJson = {};
        var theClassListHtml = '';
        HttpGetResponse('/manage/program/getClass?page=1&limit=3&programID=' + theProgramId, function (response) {
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
            }, '/manage/program/getClass?programID=' + theProgramId);
        });
    });

    function deleteProgram() {
        layui.use('layer', function () {
            var layer = layui.layer;
            console.log('/manage/program/delete?ID=' + theProgramId);
            layer.confirm('真的要删除该教学计划吗？', function (index) {
                HttpGet('/manage/program/delete?ID=' + theProgramId, function () {
                    history.go(-1);
                }, function (msg) {
                    layer.alert(msg);
                });
            });
        });
    }

    function showTable(id) {
        document.getElementById(id).setAttribute('style', 'padding-left:30px;padding-right:30px;');
        document.getElementById('theCards').setAttribute('style', 'display:none;');
    }

    function hideTable(id) {
        document.getElementById('theCards').setAttribute('style', 'padding-left:20px;padding-right:20px;');
        document.getElementById(id).setAttribute('style', 'display:none;');
    }

    function refresh() {
        HttpGetResponse('/manage/program/getOne?ID=' + theProgramId, function (response) {
            var theJson = JSON.parse(response);
            console.log(theJson);
            document.getElementById('projectName').innerHTML = theJson.programName;
            document.getElementById('projectDescription').innerHTML = theJson.programDescription;
            HttpGetResponse('/manage/engineer/getOne?ID=' + theJson.programAuthor,
                function (response) {
                    console.log(response);
                    document.getElementById('engineerName').innerHTML = '负责工程师：' + '<a href="javascript:show_popup_layer_engineer(' + theJson.programAuthor + ')">' + JSON.parse(response).engineerName + '</a>';
                }, undefined);
        }, function () {
            ;
        });
    }

    refresh();

</script>

</body>
</html>

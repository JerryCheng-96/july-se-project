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
                                <a href="javascript:approveProj();" id="projectApproved"
                                   class="layui-btn layui-btn-normal">审批通过项目</a>
                                <a id="editBtn" class="layui-btn">编辑</a>
                                <a href="javascript:deleteProj();" class="layui-btn layui-btn-danger">删除</a>
                            </div>
                        </td>
                    </tr>
                </table>
                <hr>
            </div>
        </div>
        <div class="layui-row" style="padding-left:20px;padding-right:20px;">
            <div class="layui-col-md8" style="padding:10px;">
                <div class="layui-card" style="background-color: #F7F7F7">
                    <div class="layui-card-header"><b>项目描述</b></div>
                    <div id="projectDescription" class="layui-card-body">
                    </div>
                </div>
            </div>
            <div class="layui-col-md4" style="padding: 10px;">
                <div class="layui-card" style="background-color: #F7F7F7">
                    <div class="layui-card-header"><b>小组</b></div>
                    <div class="layui-card-body">
                        <p>小组 1</p>
                        <p>小组 2</p>
                        <p>小组 3</p>
                        <p>小组 4</p>
                        <br/>
                        <span style="color:blue;">查看更多...</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="/res/layui/layui.js"></script>
<script src="/js/Interaction.js"></script>
<script src="/js/PopUp.js"></script>

<script>
    layui.use('element', function () {
        var element = layui.element;
        //一些事件监听
        element.on('tab(demo)', function (data) {
            console.log(data);
        });
    });


    var theProjId = getQueryVariable('id');

    function approveProj() {
        layui.use('layer', function () {
            var layer = layui.layer;
            layer.confirm('确认通过项目？', function (index) {
                HttpGet('/manage/project/approve?ID=' + theProjId, function () {
                    document.getElementById('projectApproved').setAttribute('class', document.getElementById('projectApproved').getAttribute('class') + ' layui-btn-disabled');
                    document.getElementById('projectApproved').innerHTML = '审批已通过';
                    layer.close(index);
                });
            })
        });
    }

    function deleteProj() {
        layui.use('layer', function () {
            var layer = layui.layer;
            console.log('/manage/project/delete?ID=' + theProjId);
            layer.confirm('真的要删除该项目吗？', function (index) {
                HttpGet('/manage/project/delete?ID=' + theProjId, function () {
                    history.go(-1);
                }, function (msg) {
                    layer.alert(msg);
                });
            });
        });
    }


    function refresh() {
        HttpGetResponse('/manage/project/getOne?ID=' + theProjId, function (response) {
            var theJson = JSON.parse(response);
            console.log(theJson);
            document.getElementById('projectName').innerHTML = theJson.projectName;
            document.getElementById('projectDescription').innerHTML = theJson.projectDescription;
            document.getElementById('editBtn').setAttribute('href', '/manage/project/edit?id=' + theJson.projectId);
            HttpGetResponse('/manage/engineer/getOne?ID=' + theJson.projectCreator,
                function (response) {
                    console.log(response);
                    document.getElementById('engineerName').innerHTML = '负责工程师：' + '<a href="javascript:show_popup_layer_engineer(' + theJson.projectCreator + ')">' + JSON.parse(response).engineerName + '</a>';
                }, undefined);
            if (theJson.projectApproved == 1) {
                document.getElementById('projectApproved').setAttribute('class', document.getElementById('projectApproved').getAttribute('class') + ' layui-btn-disabled');
                document.getElementById('projectApproved').innerHTML = '审批已通过';
            }
        }, function () {
            ;
        });
    }

    refresh();

</script>

</body>
</html>

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
                <h1><a id="className">[班级名称]</a> - <a id="groupName">[小组名称]</a></h1>
                <h3 href="">负责工程师：<a id="engineerName">[姓名]</a> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;进行项目：<a
                        id="projectName">[姓名]</a></h3>
                <hr>
                <div class="layui-btn-group">
                    <a href="javascript:add_student();" id="btn_add" class="layui-btn layui-btn-normal">添加学生</a>
                    <a href="javascript:show_group_edit(theGroupId, refresh)" class="layui-btn">编辑</a>
                    <a href="javascript:delGroup();" class="layui-btn layui-btn-danger">删除</a>
                </div>
            </div>
            <div class="layui-row" style="margin-left: 7px">
                <div class="layui-tab layui-tab-card" style="width: 90%;">
                    <ul class="layui-tab-title">
                        <li class="layui-this">学员名单</li>
                        <li>工作日志</li>
                        <li>文档管理</li>
                    </ul>
                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <table id="tableStudent" lay-filter="tableStudent"></table>
                        </div>
                        <div class="layui-tab-item">

                            <ul class="layui-timeline" style="padding-top: 10px">
                                <li class="layui-timeline-item">
                                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                                    <div class="layui-timeline-content layui-text">
                                        <h3 class="layui-timeline-title">8月18日</h3>
                                        <p>
                                            layui 2.0 的一切准备工作似乎都已到位。发布之弦，一触即发。
                                            <br>不枉近百个日日夜夜与之为伴。因小而大，因弱而强。
                                            <br>无论它能走多远，抑或如何支撑？至少我曾倾注全心，无怨无悔 <i class="layui-icon"></i>
                                        </p>
                                    </div>
                                </li>
                                <li class="layui-timeline-item">
                                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                                    <div class="layui-timeline-content layui-text">
                                        <h3 class="layui-timeline-title">8月16日</h3>
                                        <p>杜甫的思想核心是儒家的仁政思想，他有“<em>致君尧舜上，再使风俗淳</em>”的宏伟抱负。个人最爱的名篇有：</p>
                                        <ul>
                                            <li>《登高》</li>
                                            <li>《茅屋为秋风所破歌》</li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="layui-timeline-item">
                                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                                    <div class="layui-timeline-content layui-text">
                                        <h3 class="layui-timeline-title">8月15日</h3>
                                        <p>
                                            中国人民抗日战争胜利72周年
                                            <br>常常在想，尽管对这个国家有这样那样的抱怨，但我们的确生在了最好的时代
                                            <br>铭记、感恩
                                            <br>所有为中华民族浴血奋战的英雄将士
                                            <br>永垂不朽
                                        </p>
                                    </div>
                                </li>
                                <li class="layui-timeline-item">
                                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                                    <div class="layui-timeline-content layui-text">
                                        <div class="layui-timeline-title">过去</div>
                                    </div>
                                </li>
                            </ul>

                        </div>
                        <div class="layui-tab-item">
                            <div id="theCards"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/html" id="removeStudent">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="removeFromClass">从小组移除</a>
    </script>

    <script src="/res/layui/layui.js"></script>
    <script src="/js/Interaction.js"></script>
    <script src="/js/Table.js"></script>
    <script src="/js/PopUp.js"></script>
    <script>
        var theGroupId = getQueryVariable('id');
        var theClassId = '';

        layui.use(['table', 'element'], function () {
            var element = layui.element;
            //一些事件监听
            element.on('tab(demo)', function (data) {
                console.log(data);
            });

            var table = layui.table;

            HttpGetResponse('/manage/group/getOne?ID=' + theGroupId, function (response) {
                var theGroupJson = JSON.parse(response);
                document.getElementById('groupName').innerText = theGroupJson.groupName;
                HttpGetResponse('/manage/class/getOne?ID=' + theGroupJson.groupFromclass, function (classResp) {
                    var theClassJson = JSON.parse(classResp);
                    document.getElementById('className').innerText = theClassJson.className;
                    document.getElementById('className').setAttribute('href', '/dashboard/class?id=' + theClassJson.classId);
                    theClassId = theClassJson.classId;
                    table_student(table, function (studentId) {
                        HttpGetResponse('/manage/student/getOne?ID=' + studentId,
                            function (response) {
                                var theJson = JSON.parse(response);
                                var newJson = {
                                    studentDepartment: theJson.studentDepartment,
                                    studentGrade: theJson.studentGrade,
                                    studentId: theJson.studentId,
                                    studentMajor: theJson.studentMajor,
                                    studentName: theJson.studentName,
                                    studentSex: theJson.studentSex,
                                    studentClass: theJson.studentClass,
                                };

                                HttpPost('/manage/student/update', newJson, function () {
                                    table.reload('tableStudent');
                                }, function (msg) {
                                    layer.alert(msg);
                                });
                            }, undefined);
                        ;
                    }, "/manage/group/getStudent?groupID=" + theGroupId + "&classID=" + theClassId, 'no', '#removeStudent');
                    HttpGetResponse('/manage/engineer/getOne?ID=' + theClassJson.classManager, function (engineerResp) {
                        var theEngineerJson = JSON.parse(engineerResp);
                        document.getElementById('engineerName').innerText = theEngineerJson.engineerName;
                        document.getElementById('engineerName').setAttribute('href', 'javascript:show_popup_layer_engineer(' + theEngineerJson.engineerId + ');');
                    }, function () {
                        ;
                    })
                }, function () {
                    ;
                })
                HttpGetResponse('/manage/project/getOne?ID=' + theGroupJson.groupOnproject, function (projectResp) {
                    var theProjectJson = JSON.parse(projectResp);
                    document.getElementById('projectName').innerText = theProjectJson.projectName;
                    document.getElementById('projectName').setAttribute('href', '/dashboard/project?id=' + theProjectJson.projectId);
                })
            }, function () {

            })
        });

        function add_student() {
            window.location.href = '/manage/class/add_student?classId=' + theClassId + '&groupId=' + theGroupId;
        }

        function delGroup() {
            layui.use('layer', function () {
                layer.confirm("确定删除这个小组吗？", function () {
                    HttpGet('/manage/group/delete?ID=' + theGroupId, function () {
                        window.location.href = '/dashboard/class?id=' + theClassId;
                    });
                });
            });
        }

        function refresh() {
            HttpGetResponse('/manage/group/getOne?ID=' + theGroupId, function (response) {
                var theGroupJson = JSON.parse(response);
                document.getElementById('groupName').innerText = theGroupJson.groupName;
            }, function () {
                ;
            })
        }

        var cardHtml = '';
        for (var i = 0; i < 10; i++) {
            if (i == 0) {
                cardHtml += '<div class="layui-row" style="padding: 10px;">'
            }
            if (i > 0 && i % 3 == 0) {
                cardHtml += '</div><div class="layui-row" style="padding: 10px;">'
            }
            cardHtml += '<div class="layui-col-md4" style="padding-left: 10px;"> <div class="layui-card" style="background-color: #F7F7F7"> <div class="layui-card-header"><b>卡片面板</b></div> <div class="layui-card-body"> 卡片式面板面板通常用于非白色背景色的主体内<br> 从而映衬出边框投影 </div> </div> </div>';
        }
        cardHtml += '</div>'
        document.getElementById('theCards').innerHTML = cardHtml;


    </script>
</body>

</html>


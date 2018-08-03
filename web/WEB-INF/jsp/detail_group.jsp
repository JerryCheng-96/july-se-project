<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>查看小组 - TOSIT 实训管理系统</title>
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
                <div class="layui-btn-group">
                    <a href="javascript:popup_log_edit(undefined, function () { location.reload() }, theGroupId, theStudentId);"
                       id="btn_add_log" class="layui-btn layui-btn-primary">添加日志</a>
                    <a href="javascript:popup_file_upload(theGroupId, theStudentId);"
                       class="layui-btn layui-btn-primary">添加文档</a>
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
                            <span id="theLogs"></span>
                            <div style="margin-right: 25px; margin-top: 5px" id="demo0"></div>

                        </div>
                        <div class="layui-tab-item">
                            <div id="theCards"></div>
                            <div style="margin-left: 10px;margin-right: 25px; margin-top: 5px" id="demo1"></div>
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
        var theStudentId = undefined;
        var theClassId = '';

        HttpGetResponse('/getCurrentUser', function (resp) {
            theStudentId = JSON.parse(resp).username;
        });

        function delete_log(logId, whenDone) {
            layui.use('layer', function () {
                var layer = layui.layer;
                layer.confirm('确定删除这条日志吗？', function () {
                    HttpGet('/manage/log/delete?ID=' + logId, whenDone);
                })

            })
        }

        function update_log(log_json) {
            console.log('log_json');
            console.log(log_json);

            var logHtml = '<p style="color: #CCCCCC;margin: 20px; text-align: center">当前无日志记录</p>';
            for (var i = 0; i < log_json.length; i++) {
                var currLog = log_json[i];

                if (i == 0) {
                    logHtml = '<ul class="layui-timeline" style="padding-top: 10px">'
                }
                logHtml += '<li class="layui-timeline-item">' +
                    '            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>' +
                    '            <div class="layui-timeline-content layui-text">' +
                    '                <h3 class="layui-timeline-title"><a href="javascript:delete_log(' + currLog.logId + ", function () {location.reload();});\">" + currLog.logTime + '</a></h3>' +
                    '                <p>' +
                    currLog.logContent +
                    '                </p>' +
                    '            </div>' +
                    '        </li>'
            }
            logHtml += '</ul>';
            document.getElementById('theLogs').innerHTML = logHtml;
        }

        layui.use(['table', 'element', 'laypage'], function () {
            var element = layui.element;
            //一些事件监听
            element.on('tab(demo)', function (data) {
                console.log(data);
            });

            var laypage = layui.laypage;
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
            });

            HttpGetResponse('/manage/group/log?page=1&limit=5&groupID=' + theGroupId, function (response) {
                var theJson = JSON.parse(response);
                var logCount = theJson.count;
                update_log(theJson.data);

                console.log('projectCnt');
                console.log(logCount);

                laypage.render({
                    elem: 'demo0'
                    , count: logCount //数据总数
                    , limit: 5
                    , jump: function (obj, first) {
                        console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                        console.log(obj.limit); //得到每页显示的条数
                        if (!first) {
                            var url = '/manage/group/log?groupID=' + theGroupId + '&page=' + obj.curr + '&limit=' + obj.limit;
                            HttpGetResponse(url, function (response) {
                                update_log(JSON.parse(response).data);
                            }, function () {
                                ;
                            })
                        }
                    }
                });
            });

            function update_small_cards(card_json, elementName) {
                console.log(card_json);

                var cardHtml = '';
                for (var i = 0; i < card_json.length; i++) {
                    var currDocument = card_json[i];

                    if (i == 0) {
                        cardHtml += '<div class="layui-row" style="padding-left: 0px; padding-right: 10px">'
                    }
                    if (i > 0 && i % 2 == 0) {
                        cardHtml += '</div><div class="layui-row" style="padding-left: 0px; padding-right: 10px">'
                    }
                    cardHtml += '<div class="layui-col-md6" style="padding-left: 10px;padding-bottom: 10px"> ' +
                        '<div class="layui-card" style="background-color: #F0F0F0"> ' +
                        "<div class='layui-card-header'><a href=\"javascript:show_document('" + currDocument.docName + "','" + currDocument.docUrl + "',function () { parent.reload(); });\"><b>" + currDocument.docName +
                        "</b></a></div> " +
                        '<div class="layui-card-body"> ' +
                        '<label style="overflow: hidden; text-overflow: ellipsis; display: inline-block; height: 50px; word-break: break-word">' +
                        card_json[i].docDescription.substr(0, 65) + (currDocument.docDescription.length > 65 ? '...' : '') +
                        '</label>' +
                        '</div>' +
                        '</div>' +
                        '</div>';
                }
                cardHtml += '</div>'
                document.getElementById(elementName).innerHTML = cardHtml;
            }

            HttpGetResponse('/manage/group/getDocument?page=1&limit=4&groupID=' + theGroupId, function (response) {
                var theJson = JSON.parse(response);
                var projectCnt = theJson.count;
                update_small_cards(theJson.data, 'theCards');

                console.log('projectCnt');
                console.log(projectCnt);

                laypage.render({
                    elem: 'demo1'
                    , count: projectCnt //数据总数
                    , limit: 4
                    , jump: function (obj, first) {
                        console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                        console.log(obj.limit); //得到每页显示的条数
                        if (!first) {
                            var url = '/manage/group/getDocument?groupID=' + theGroupId + '&page=' + obj.curr + '&limit=' + obj.limit;
                            HttpGetResponse(url, function (response) {
                                update_small_cards(JSON.parse(response).data);
                            }, function () {
                                ;
                            })
                        }
                    }
                });
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


    </script>
</body>

</html>


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
                            <img src="/res/icon/A.jpg"
                                 style="width:120px;height:120px;border-radius:120px;margin:0 auto;padding:5px;">
                        </th>
                        <td height="60%">
                            <span id="studentName" style="font-size:30px; margin:0 auto; padding-left: 30px;"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="padding-left:30px; font-size: 17px">班级：<a id="className"></a>  >  小组：<a
                                    id="groupName"></a></span>
                        </td>
                    </tr>
                </table>
                <hr>
            </div>
        </div>
        <div class="layui-row" style="padding-left:20px;padding-right:20px;">
            <div class="layui-col-md6" style="padding:10px;">
                <div class="layui-card" style="background-color: #F7F7F7">
                    <div class="layui-card-header"><b>工作日志</b></div>
                    <div class="layui-card-body">
                        <span id="theLogs"></span>
                        <div style="margin-right: 25px; margin-top: 5px" id="demo0"></div>
                    </div>
                </div>
            </div>
            <div class="layui-col-md6" style="padding: 10px;">
                <div class="layui-card" style="background-color: #F7F7F7">
                    <div class="layui-card-header"><b>最近文档</b></div>
                    <div class="layui-card-body">
                        <div id="theCards"></div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>
<script src="/res/layui/layui.js"></script>
<script src="/js/Interaction.js"></script>
<script src="/js/Table.js"></script>
<script src="/js/PopUp.js"></script>
<script>
    var theStudentId = getQueryVariable('id');

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

        var logHtml = '<p style="color: #CCCCCC; text-align: center">当前无日志记录</p><br/>';
        for (var i = 0; i < log_json.length; i++) {
            var currLog = log_json[i];

            if (i == 0) {
                logHtml = '<ul class="layui-timeline" style="padding-top: 10px">'
            }
            logHtml += '<li class="layui-timeline-item">' +
                '            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>' +
                '            <div class="layui-timeline-content layui-text">' +
                '                <h3 class="layui-timeline-title"><a href="javascript:delete_log('+ currLog.logId + ", function () {location.reload();});\">" + currLog.logTime + '</a></h3>' +
                '                <p>' +
                currLog.logContent +
                '                </p>' +
                '            </div>' +
                '        </li>'
        }
        logHtml += '</ul>'
        document.getElementById('theLogs').innerHTML = logHtml;
    }

    layui.use(['laypage', 'element'], function () {
        var element = layui.element;
        var laypage = layui.laypage;
        //一些事件监听
        element.on('tab(demo)', function (data) {
            console.log(data);
        });

        HttpGetResponse('/manage/student/getOne?ID=' + theStudentId, function (response) {
            var theStudentJson = JSON.parse(response);
            document.getElementById('studentName').innerText = theStudentJson.studentName;
            HttpGetResponse('/manage/class/getOne?ID=' + theStudentJson.studentClass, function (response) {
                var theClassJson = JSON.parse(response);
                document.getElementById('className').innerText = theClassJson.className;
            });
            HttpGetResponse('/manage/group/getOne?ID=' + theStudentJson.studentGroup, function (response) {
                var theGroupJson = JSON.parse(response);
                document.getElementById('groupName').innerText = theGroupJson.groupName;

            });
        });

        HttpGetResponse('/manage/student/log?page=1&limit=5&studentID=' + theStudentId, function (response) {
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
                        var url = '/manage/student/log?studentID=' + theStudentId + '&page=' + obj.curr + '&limit=' + obj.limit;
                        HttpGetResponse(url, function (response) {
                            update_log(JSON.parse(response).data);
                        }, function () {
                            ;
                        })
                    }
                }
            });
        })
    });

    var cardHtml = '';
    for (var i = 0; i < 2; i++) {
        if (i == 0) {
            cardHtml += '<div class="layui-row" style="padding: 10px;">'
        }
        if (i > 0) {
            cardHtml += '</div><div class="layui-row" style="padding: 10px;">'
        }
        cardHtml += '<div class="layui-card"> <div class="layui-card-header"><b>卡片面板</b></div> <div class="layui-card-body"> 卡片式面板面板通常用于非白色背景色的主体内<br> 从而映衬出边框投影 </div> </div>';
    }
    cardHtml += '</div>'
    document.getElementById('theCards').innerHTML = cardHtml;

</script>

</body>
</html>

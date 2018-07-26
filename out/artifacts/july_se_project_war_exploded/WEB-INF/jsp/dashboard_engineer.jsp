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
<div class="layui-layout layui-layout-admin">
    <jsp:include page="headersidenav.jsp"/>
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
                            <span style="font-size:30px; margin:0 auto; padding-left: 30px;">张三</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="padding-left:30px; font-size: 17px">[公司], [部门], [职务]</span>
                        </td>
                    </tr>
                </table>
                <hr>
            </div>
        </div>
        <div class="layui-row" style="padding-left:20px;padding-right:20px;">
            <div class="layui-col-md4" style="padding:10px;">
                <div class="layui-card" style="background-color: #F7F7F7;">
                    <div class="layui-card-header"><b>项目</b></div>
                    <div class="layui-card-body">
                        <p>项目 1</p>
                        <p>项目 2</p>
                        <p>项目 3</p>
                        <br/>
                        <a href="" style="color: blue">查看更多...</a>
                    </div>
                </div>
            </div>
            <div class="layui-col-md4" style="padding:10px;">
                <div class="layui-card" style="background-color: #F7F7F7">
                    <div class="layui-card-header"><b>教学计划</b></div>
                    <div class="layui-card-body">
                        <p>教学计划 A</p>
                        <br/>
                        <a href="" style="color: blue">查看更多...</a>
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
                        <p>班级 1</p>
                        <p>班级 2</p>
                        <br/>
                        <a href="" style="color: blue">查看更多...</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/res/layui/layui.js"></script>
<script>
    layui.use('element', function () {
        var element = layui.element;
        //一些事件监听
        element.on('tab(demo)', function (data) {
            console.log(data);
        });
    });

    var cardHtml = '';
    for (var i = 0; i < 3; i++) {
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

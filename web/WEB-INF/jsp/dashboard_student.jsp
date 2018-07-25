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
                            <img src="/res/icon/A.jpg" style="width:120px;height:120px;border-radius:120px;margin:0 auto;padding:5px;">
                        </th>
                        <td height="60%">
                            <span style="font-size:30px; margin:0 auto; padding-left: 30px;">张三</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="padding-left:30px; font-size: 17px">XXX班  >  xxxx小组</span>
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
                                        <div class="layui-timeline-title">过去</div>
                                    </div>
                                </li>
                            </ul>

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
<script>
    layui.use('element', function () {
        var element = layui.element;
        //一些事件监听
        element.on('tab(demo)', function (data) {
            console.log(data);
        });
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

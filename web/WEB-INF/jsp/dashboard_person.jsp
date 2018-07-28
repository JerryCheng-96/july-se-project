<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>XXX，欢迎来到实训管理系统！</title>
    <link rel="stylesheet" href="/res/layui/css/layui.css">
</head>

<body class="layui-layout-body" style="background-color: #F2F2F2">
<div class="">
    <jsp:include page="frame.jsp">
        <jsp:param name="label" value="2"/>
    </jsp:include>
    <div class="layui-body">
        <div class="layui-row" style="padding: 15px;">
            <div class="layui-btn-container">
                <span style="padding-left: 15px;"><a href="javascript:popup_layer_engineer()"
                                                     class="layui-btn">工程师信息显示</a></span>
                <span style="padding-left: 15px;"><a href="javascript:popup_layer_engineer_edit()"
                                                     class="layui-btn">工程师信息修改</a></span>
                <span style="padding-left: 15px;"><a href="javascript:popup_layer_engineer()"
                                                     class="layui-btn">学生信息显示</a></span>
                <span style="padding-left: 15px;"><a href="javascript:popup_layer_engineer()"
                                                     class="layui-btn">学生信息修改</a></span>
                <span style="padding-left: 15px;"><a href="javascript:popup_layer_engineer()"
                                                     class="layui-btn">班级信息修改</a></span>
                <span style="padding-left: 15px;"><a href="javascript:popup_layer_engineer()"
                                                     class="layui-btn">小组信息修改</a></span>
                <span style="padding-left: 15px;"><a href="javascript:popup_layer_engineer()"
                                                     class="layui-btn">教学任务信息查看</a></span>
                <span style="padding-left: 15px;"><a href="javascript:popup_layer_engineer()"
                                                     class="layui-btn">教学任务信息修改</a></span>
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
    </script>
    <script src="/js/PopUp.js"></script>
</body>


</html>


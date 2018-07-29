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
                            <span style="font-size:30px; margin:0 auto;">项目 ABCD</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="font-size: 17px;">负责工程师：[名字]</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="font-size: 17px">适用教学计划：[教学计划]</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <hr>
                            <div class="layui-btn-group">
                                <button class="layui-btn layui-btn-disabled">审批已通过</button>
                                <button class="layui-btn">编辑</button>
                                <button class="layui-btn layui-btn-danger">删除</button>
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
                    <div class="layui-card-body">
                        layui 2.0 的一切准备工作似乎都已到位。发布之弦，一触即发。
                        不枉近百个日日夜夜与之为伴。因小而大，因弱而强。
                        无论它能走多远，抑或如何支撑？至少我曾倾注全心，无怨无悔
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
<script>
    layui.use('element', function () {
        var element = layui.element;
        //一些事件监听
        element.on('tab(demo)', function (data) {
            console.log(data);
        });
    });

</script>

</body>
</html>

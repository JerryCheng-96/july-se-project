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
<div class="layui-layout layui-layout-admin">
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

        function popup_layer_engineer() {
            layui.use('layer', function () {
                var layer = layui.layer;
                layer.open({
                    type: 1,
                    title: '人员信息',
                    content: "" +
                    '<div>' +
                    '<table border="0" style="margin:3%">' +
                    '<tr>' +
                    '<td>' +
                    '<img src="/res/icon/5.png" style="width:80px;height:80px;border-radius:80px;margin:10px;">' +
                    '</td>' +
                    '<td><span style="font-size:30px; margin-left:10px;">张三</span></td>' +
                    '</tr>' +
                    '<tr">' +
                    '<td></td>' +
                    '<td><span style="margin-left:10px; font-size: 17px"><b>性别</b></span></td>' +
                    '<td><span style="margin-left:10px; font-size: 17px">男</span></td>' +
                    '</tr>' +
                    '<tr>' +
                    '<td></td>' +
                    '<td><span style="margin-left:10px; font-size: 17px"><b>工号</b></span></td>' +
                    '<td><span style="margin-left:10px; font-size: 17px">123456789</span></td>' +
                    '</tr>' +
                    '<tr>' +
                    '<td></td>' +
                    '<td><span style="margin-left:10px; font-size: 17px"><b>公司</b></span></td>' +
                    '<td><span style="margin-left:10px; font-size: 17px">XXXXX公司</span></td>' +
                    '</tr>' +
                    '<tr>' +
                    '<td></td>' +
                    '<td><span style="margin-left:10px; font-size: 17px"><b>部门</b></span></td>' +
                    '<td><span style="margin-left:10px; font-size: 17px">AAAAAAA部</span></td>' +
                    '</tr>' +
                    '<tr>' +
                    '<td></td>' +
                    '<td><span style="margin-left:10px; font-size: 17px"><b>职务</b></span></td>' +
                    '<td><span style="margin-left:10px; font-size: 17px">开发工程师</span></td>' +
                    '</tr>' +
                    '<tr/>' +
                    '</table>' +
                    '<br/>' +
                    '' +
                    '' +
                    '' +
                    "</div>",
                    area: '400px'
                });
            });
        }

        function popup_layer_engineer_edit() {
            layui.use(['layer', 'form'], function () {
                var layer = layui.layer;
                var form = layui.form;

                //监听提交
                form.on('submit(formDemo)', function (data) {
                    layer.msg(JSON.stringify(data.field));
                    return false;
                });

                layer.open({
                    type: 1,
                    title: '人员信息',
                    content: "<div style='width: 90%; margin-right: 30px';>" +
                    "<form class=\"layui-form\" action=\"\"'>" +
                    "  <div class=\"layui-form-item\" style='padding-top:20px'>" +
                    "    <label class=\"layui-form-label\"'>工号</label>" +
                    "    <div class=\"layui-input-block\" >" +
                    "      <input type=\"text\" name=\"title\" required  lay-verify=\"required\" placeholder=\"请输入标题\" autocomplete=\"off\" class=\"layui-input\">" +
                    "    </div>" +
                    "  </div>" +

                    "  <div class=\"layui-form-item\" >" +
                    "    <label class=\"layui-form-label\" style='margin-left: 0px'>姓名</label>" +
                    "    <div class=\"layui-input-block\">" +
                    "      <input type=\"text\" name=\"title\" required  lay-verify=\"required\" placeholder=\"请输入标题\" autocomplete=\"off\" class=\"layui-input\">" +
                    "    </div>" +
                    "  </div>" +

                    "  <div class=\"layui-form-item\">" +
                    "    <label class=\"layui-form-label\">性别</label>" +
                    "    <div class=\"layui-input-block\">" +
                    "      <input type=\"radio\" name=\"sex\" value=\"男\" title=\"男\">" +
                    "      <input type=\"radio\" name=\"sex\" value=\"女\" title=\"女\" checked>" +
                    "    </div>" +
                    "  </div>" +

                    "  <div class=\"layui-form-item\">" +
                    "    <label class=\"layui-form-label\">公司</label>" +
                    "    <div class=\"layui-input-block\">" +
                    "      <input type=\"text\" name=\"title\" required  lay-verify=\"required\" placeholder=\"请输入标题\" autocomplete=\"off\" class=\"layui-input\">" +
                    "    </div>" +
                    "  </div>" +

                    "  <div class=\"layui-form-item\">" +
                    "    <label class=\"layui-form-label\">部门</label>" +
                    "    <div class=\"layui-input-block\">" +
                    "      <input type=\"text\" name=\"title\" required  lay-verify=\"required\" placeholder=\"请输入标题\" autocomplete=\"off\" class=\"layui-input\">" +
                    "    </div>" +
                    "  </div>" +

                    "  <div class=\"layui-form-item\">" +
                    "    <label class=\"layui-form-label\">职务</label>" +
                    "    <div class=\"layui-input-block\">" +
                    "      <input type=\"text\" name=\"title\" required  lay-verify=\"required\" placeholder=\"请输入标题\" autocomplete=\"off\" class=\"layui-input\">" +
                    "    </div>" +
                    "  </div>" +

                    "  <div class=\"layui-form-item\">" +
                    "    <div class=\"layui-input-block\">" +
                    "      <button class=\"layui-btn\" lay-submit lay-filter=\"formDemo\">确定</button>" +
                    "      <button type=\"reset\" class=\"layui-btn layui-btn-primary\">取消</button>" +
                    "    </div>" +
                    "  </div>" +
                    "</form>" +
                    "</div>",
                });

                form.render();
            });
        }

    </script>
</body>


</html>


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
        <div style="margin-top: 2%;margin-right: 3%;">
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <div class="layui-input-block" style="margin-left: 3%;">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block" style="margin-left: 3%;">
                        <input type="text" name="title" required lay-verify="required" placeholder="项目标题"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <div class="layui-input-block" style="margin-left: 3%;">
                        <textarea name="desc" placeholder="项目描述" class="layui-textarea"></textarea>
                    </div>
                </div>

            </form>
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

    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
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

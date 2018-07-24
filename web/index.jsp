<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>AAAAAAAAAAAAAAA</title>
    <link rel="stylesheet" href="/res/layui/css/layui.css">
</head>
<body>

<div class="layui-container">
    <ul class="layui-nav layui-nav-tree layui-nav-side">
        <li class="layui-nav-item layui-nav-itemed">
            <a href="javascript:;">Good Good</a>
            <dl class="layui-nav-child">
                <dd><a href="javascript:;">选项1</a></dd>
                <dd><a href="javascript:;">选项2</a></dd>
                <dd><a href="">跳转</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">解决方案</a>
            <dl class="layui-nav-child">
                <dd><a href="">移动模块</a></dd>
                <dd><a href="">后台模版</a></dd>
                <dd><a href="">电商平台</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="">产品</a></li>
        <li class="layui-nav-item"><a href="">大数据</a></li>
    </ul>
    <img src="/res/Cache.jpg" width="200">
</div>

<script src="/res/layui/layui.js"></script>
<script>
    layui.use('element', function() {
        var element = layui.element;
        //一些事件监听
        element.on('tab(demo)', function(data){
            console.log(data);
        });
    });
</script>
</body>
</html>

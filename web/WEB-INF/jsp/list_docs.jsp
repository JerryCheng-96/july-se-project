<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <link rel="stylesheet" href="/res/layui/css/layui.css"  media="all">
</head>
<body>

<div id="demo0"></div>

<script src="/res/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['laypage', 'layer'], function(){
        var laypage = layui.laypage
            ,layer = layui.layer;

        //总页数低于页码总数
        laypage.render({
            elem: 'demo0'
            ,count: 50 //数据总数
            ,limit: 5
        });

    });
</script>

</body>
</html>

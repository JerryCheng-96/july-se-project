<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>upload模块快速使用</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/res/layui/css/layui.css" media="all">
</head>
<body>

<button type="button" class="layui-btn" id="test1">
    <i class="layui-icon">&#xe67c;</i>上传名单
</button>

<script src="/res/layui/layui.js"></script>
<script>
    layui.use('upload', function(){
        var upload = layui.upload;

        //执行实例
        var uploadInst = upload.render({
            elem: '#test1' //绑定元素
            ,url: '/manage/student/doImport' //上传接口
            ,accept:'file'
            //,data:{ teamID:1 }  //require a document json
            ,done: function(res){
                //上传完毕回调
                console.log(res);
            }
            ,error: function(){
                //请求异常回调
            }
        });
    });
</script>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: Jerry
  Date: 2018/7/25
  Time: 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/res/layui/css/layui.css">
    <link rel="stylesheet" href="/css/login.css">
</head>
<body>
    <div class="layui-container">
        <div class="layui-row">
            <div class="layui-col-md6">
                <h1 style="padding-top: 45%; ">TOSIT 实训管理系统</h1>
            </div>
            <div class="layui-col-md5">
                <form class="layui-form" style="padding-top: 45%; ">
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="">
                            <input type="text" name="title" required  lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input">
                        </div>
                        <br/>
                     <div class="layui-form-item">
                        <div class="layui-input-block">
                            <input type="text" name="title" required  lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>

<script src="/res/layui/layui.js"></script>
<script>
    layui.use('form', function(){
        var form = layui.form;
</script>

</html>

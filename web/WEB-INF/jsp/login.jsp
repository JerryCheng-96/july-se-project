<%--
  Created by IntelliJ IDEA.
  User: Jerry
  Date: 2018/7/25
  Time: 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/res/layui/css/layui.css">
    <link rel="stylesheet" href="/css/login.css">
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md5 layui-col-md-offset7">
            <div style="background-color: rgba(255,255,255,0.7);margin-top:25%;padding:5%;border-radius: 5%">
                <h1 style="margin-left: 5%;text-shadow: 2px 2px 2px #F0F0F0">TOSIT 实训管理系统</h1>
                <form class="layui-form" style="padding-top: 10%; ">
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="margin-left: 5%;margin-right: 5%">
                            <input type="text" name="title" placeholder="用户名"
                            <%--<input type="text" name="title" required lay-verify="required" placeholder="用户名"--%>
                                   autocomplete="off" class="layui-input">
                        </div>
                        <br/>
                        <div class="layui-form-item">
                            <div class="layui-input-block" style="margin-left: 5%;margin-right: 5%">
                                <input type="text" name="title" placeholder="密码"
                                <%--<input type="text" name="title" required lay-verify="required" placeholder="密码"--%>
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="margin-left: 5%;margin-right: 5%">
                            <input type="radio" name="AccType" value="student" title="学生" checked>
                            <input type="radio" name="AccType" value="engineer" title="工程师">
                            <input type="radio" name="AccType" value="manager" title="管理员">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="margin-left: 5%;margin-right: 5%">
                            <%--<button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>--%>
                            <a class="layui-btn" href="/dashboard">登录</a>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>

<script src="/res/layui/layui.js"></script>
<script>
    layui.use('form', function () {
        var form = layui.form;
    });
</script>

</html>

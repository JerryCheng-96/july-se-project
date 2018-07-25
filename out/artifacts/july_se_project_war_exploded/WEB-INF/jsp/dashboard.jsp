
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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
    <div class="layui-header">
        <div class="layui-logo">TOSIT 实训管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    User X
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                    <dd><a href="" style="color: red;">退出登录</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side" style="background:#666699">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">实训管理
                        <span class="layui-nav-more"></span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd class="layui-this">
                            <a href="javascript:;">班级管理</a>
                        </dd>
                        <dd>
                            <a href="javascript:;">学生管理</a>
                        </dd>
                        <dd>
                            <a href="javascript:;">工程师管理</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">项目管理
                        <span class="layui-nav-more"></span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;">项目列表</a>
                        </dd>
                        <dd>
                            <a href="javascript:;">项目评审</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">班级管理
                        <span class="layui-nav-more"></span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;">教学计划</a>
                        </dd>
                        <dd>
                            <a href="javascript:;">分组管理</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">文档管理
                        <span class="layui-nav-more"></span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;">文档列表</a>
                        </dd>
                    </dl>
                </li>
                <span class="layui-nav-bar" style="top: 317.5px; height: 0px; opacity: 0;"></span>
            </ul>
        </div>
    </div>


    <div class="layui-body">
        <div style="padding: 15px;">内容主体区域</div>
    </div>

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


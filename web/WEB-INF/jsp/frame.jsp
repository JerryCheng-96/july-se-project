<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%--<div class="layui-header">
    <div class="layui-logo">TOSIT 实训管理系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="/res/icon/9.jpg" class="layui-nav-img">
                User X
            </a>
            <dl class="layui-nav-child">
                <dd><a href="">基本资料</a></dd>
                <dd><a href="">安全设置</a></dd>
                <dd><a href="" style="color: red;">退出登录</a></dd>
            </dl>
        </li>
    </ul>
</div>--%>

<div class="layui-side" style="background-color: #0C0C0C">
    <div style="text-align: center">
        <img src="/res/icon/A.jpg" style="width:80px;height:80px;border-radius:80px;margin-top:10%;"/>
        <a href="/logout"><h2 style="margin-top: 5%; margin-bottom: 10%; color: #F0F0F0">张三</h2></a>
    </div>
    <div class="">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree">
            <li id="dashboard" class="layui-nav-item">
                <a class="" href="/dashboard">个人中心</a>
            </li>
            <li id="projects" class="layui-nav-item">
                <a class="" href="/manage/project">项目库</a>
            </li>
            <li id="docs" class="layui-nav-item">
                <a class="" href="/manage/docs">文档库</a>
            </li>
            <li id="manage_person" class="layui-nav-item">
                <a href="javascript:;">
                    <span class="layui-nav-more"></span>
                    人员管理
                </a>
                <dl class="layui-nav-child">
                    <dd id="man_student">
                        <a href="/manage/student">学生管理</a>
                    </dd>
                    <dd id="man_engineer">
                        <a href="/manage/engineer">工程师管理</a>
                    </dd>
                </dl>
            </li>
            <li id="class_team" class="layui-nav-item">
                <a class="" href="/manage/class">班组管理</a>
            </li>
            <li class="layui-nav-item">
                <a class="" href="javascript:;">
                    教学管理
                    <span class="layui-nav-more"></span>
                </a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="javascript:;">教学计划</a>
                    </dd>
                    <dd>
                        <a href="javascript:;">教学任务</a>
                    </dd>
                </dl>
            </li>

            <span class="layui-nav-bar" style="top: 317.5px; height: 0px; opacity: 0;"></span>
        </ul>
    </div>
</div>

<script>
    var catId = '<%=(String)request.getParameter("cat")%>';
    var funcId = '<%=(String)request.getParameter("func")%>';
    var catObj = document.getElementById(catId);
    var funcObj = document.getElementById(funcId);
    catObj.setAttribute('class', catObj.getAttribute('class') + ' layui-nav-itemed')
    funcObj.setAttribute('class', funcObj.getAttribute('class') + ' layui-this')
</script>

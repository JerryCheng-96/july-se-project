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
        <jsp:param name="func" value="class_team"/>
        <jsp:param name="cat" value="class_team"/>
    </jsp:include>
    <div class="layui-body">
        <div class="layui-container">
            <br/>
            <div class="layui-row" style="padding-left: 7px">
                <h1>[班级名称] - [小组名称]</h1>
                <h3 href="">负责工程师：[姓名]&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;小组组长：[姓名]</h3>
                <hr>
                <div class="layui-btn-group">
                    <button class="layui-btn layui-btn-normal">添加学生</button>
                    <button class="layui-btn">编辑</button>
                    <button class="layui-btn layui-btn-danger">删除</button>
                </div>
            </div>
            <div class="layui-row" style="margin-left: 7px">
                <div class="layui-tab layui-tab-card" style="width: 90%;">
                    <ul class="layui-tab-title">
                        <li class="layui-this">学员名单</li>
                        <li>工作日志</li>
                        <li>文档管理</li>
                    </ul>
                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <table id="demo" lay-filter="test"></table>
                        </div>
                        <div class="layui-tab-item">

                            <ul class="layui-timeline" style="padding-top: 10px">
                                <li class="layui-timeline-item">
                                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                                    <div class="layui-timeline-content layui-text">
                                        <h3 class="layui-timeline-title">8月18日</h3>
                                        <p>
                                            layui 2.0 的一切准备工作似乎都已到位。发布之弦，一触即发。
                                            <br>不枉近百个日日夜夜与之为伴。因小而大，因弱而强。
                                            <br>无论它能走多远，抑或如何支撑？至少我曾倾注全心，无怨无悔 <i class="layui-icon"></i>
                                        </p>
                                    </div>
                                </li>
                                <li class="layui-timeline-item">
                                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                                    <div class="layui-timeline-content layui-text">
                                        <h3 class="layui-timeline-title">8月16日</h3>
                                        <p>杜甫的思想核心是儒家的仁政思想，他有“<em>致君尧舜上，再使风俗淳</em>”的宏伟抱负。个人最爱的名篇有：</p>
                                        <ul>
                                            <li>《登高》</li>
                                            <li>《茅屋为秋风所破歌》</li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="layui-timeline-item">
                                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                                    <div class="layui-timeline-content layui-text">
                                        <h3 class="layui-timeline-title">8月15日</h3>
                                        <p>
                                            中国人民抗日战争胜利72周年
                                            <br>常常在想，尽管对这个国家有这样那样的抱怨，但我们的确生在了最好的时代
                                            <br>铭记、感恩
                                            <br>所有为中华民族浴血奋战的英雄将士
                                            <br>永垂不朽
                                        </p>
                                    </div>
                                </li>
                                <li class="layui-timeline-item">
                                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                                    <div class="layui-timeline-content layui-text">
                                        <div class="layui-timeline-title">过去</div>
                                    </div>
                                </li>
                            </ul>

                        </div>
                        <div class="layui-tab-item">
                            <div id="theCards"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/res/layui/layui.js"></script>
    <script>
        var cardHtml = '';
        for (var i = 0; i < 10; i++) {
            if (i == 0) {
                cardHtml += '<div class="layui-row" style="padding: 10px;">'
            }
            if (i > 0 && i % 3 == 0) {
                cardHtml += '</div><div class="layui-row" style="padding: 10px;">'
            }
            cardHtml += '<div class="layui-col-md4" style="padding-left: 10px;"> <div class="layui-card" style="background-color: #F7F7F7"> <div class="layui-card-header"><b>卡片面板</b></div> <div class="layui-card-body"> 卡片式面板面板通常用于非白色背景色的主体内<br> 从而映衬出边框投影 </div> </div> </div>';
        }
        cardHtml += '</div>'
        document.getElementById('theCards').innerHTML = cardHtml;

        layui.use('element', function () {
            var element = layui.element;
            //一些事件监听
            element.on('tab(demo)', function (data) {
                console.log(data);
            });
        });


        layui.use('table', function () {
            var table = layui.table;

            //第一个实例
            table.render({
                elem: '#demo'
                //,url: '/demo/table/user/' //数据接口
                ,
                width: '90%'
                ,
                page: true //开启分页
                ,
                cols: [[ //表头
                    {field: 'id', title: 'ID', width: 200, sort: true, fixed: 'left'}
                    , {field: 'name', title: '姓名', width: 200, sort: true}
                    , {field: 'gender', title: '性别', width: 200, sort: true}
                    , {field: 'colleage', title: '学院', width: 200, sort: true}
                    , {field: 'majority', title: '专业', width: 200, sort: true}
                    , {field: 'grade', title: '年级', width: 200, sort: true}
                    , {
                        field: 'class',
                        title: '班级',
                        width: 200,
                        sort: true,
                        templet: '<div><a href="class/{{d.class}}.html" class="layui-table-link">{{d.class}}</a></div>'
                    }
                ]]
                ,
                data: [{
                    'id': 10,
                    'name': 'Zhang',
                    'gender': 'male',
                    'colleage': 'Software',
                    'majority': 'SE',
                    'grade': '2016',
                    'class': 'A210'
                },
                    {
                        'id': 11,
                        'name': 'Deng',
                        'gender': 'male',
                        'colleage': 'Software',
                        'majority': 'SE',
                        'grade': '2016',
                        'class': 'A210'
                    },
                    {
                        'id': 5,
                        'name': 'Wang',
                        'gender': 'male',
                        'colleage': 'Software',
                        'majority': 'SE',
                        'grade': '2016',
                        'class': 'A211'
                    },
                    {
                        'id': 6,
                        'name': 'Li',
                        'gender': 'female',
                        'colleage': 'Software',
                        'majority': 'SE',
                        'grade': '2016',
                        'class': 'A211'
                    }]

            });
        });


    </script>
</body>

</html>


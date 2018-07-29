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
        <jsp:param name="cat" value="manage_person"/>
        <jsp:param name="func" value="man_engineer"/>
    </jsp:include>
    <div class="layui-body">
        <div class="layui-row">
            <br/>
            <div>
                <div style="float: left"><span style="padding-left: 15px;"><a
                        href="javascript:popup_layer_engineer_edit(undefined, function() { lay.table.reload('table_engineer'); })" class="layui-btn">添加工程师</a></span>
                </div>
                <div style="float: right; margin-right: 15px;">
                    <div>
                        <div style="float: right;margin-top: 1%">
                            <span style="padding-left: 15px;">
                            <a href="javascript:popup_sorting()" class="layui-btn layui-btn-sm layui-btn-primary">
                            <i class="layui-icon layui-icon-align-left"></i>
                            </a>
                        </span>
                        </div>
                        <div class="layui-input-block" style="float: left;">
                            <input type="text" name="title" required lay-verify="required" placeholder="查询..."
                                   autocomplete="off" class="layui-input">
                        </div>
                        <div style="float: right; margin-top: 1%"><span style="padding-left: 15px;"><a href=""
                                                                                                       class="layui-btn layui-btn-sm"><i
                                class="layui-icon layui-icon-search"></i></a></span></div>

                    </div>
                </div>
                <div class="layui-row" style="padding: 15px;">
                    <!--在此处添加页面代码-->
                    <table id="table_engineer" lay-filter="table_engineer"></table>
                    <!--在此处添加页面代码-->
                </div>
            </div>

        </div>
    </div>

    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>

    <script src="/res/layui/layui.js"></script>
    <script src="/js/Interaction.js"></script>
    <script src="/js/PopUp.js"></script>
    <script src="/js/Table.js"></script>
    <script>
        var lay = layui.use(['element', 'table'], function () {
            var element = layui.element;
            //一些事件监听
            element.on('tab(demo)', function (data) {
                console.log(data);
            });

            var theTable = layui.table;
            var update_table = function () {
                theTable.reload('table_engineer');
            }
            table_engineer(theTable, update_table);
        });

        console.log(lay);

        // Testing Data
        testEngineer = {
            "engineerId": 100000,
            "engineerName": "OPST",
            "engineerSex": "女",
            "engineerCompany": "Google",
            "engineerDepartment": "Maintenance",
            "engineerJob": "Programmer"
        };

        function update() {
            console.log('now in update!');
            theTable.reload('table_engineer');
        }

        function popup_sorting() {
            layui.use('layer', function () {
                var layer = layui.layer;
                layer.open({
                    type: 1,
                    title: '',
                    content: "",
                });
            });
        }
    </script>
</body>
</html>

<div>

</div>

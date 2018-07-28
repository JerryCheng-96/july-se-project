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
                        href="javascript:popup_layer_engineer_edit(undefined, theTable);" class="layui-btn">添加工程师</a></span>
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
    <script src="/js/PopUp.js"></script>
    <script>
        var theTable;

        layui.use('element', function () {
            var element = layui.element;
            //一些事件监听
            element.on('tab(demo)', function (data) {
                console.log(data);
            });
        });

        // Testing Data
        testEngineer = {
            "engineerId": 100000,
            "engineerName": "OPST",
            "engineerSex": "女",
            "engineerCompany": "Google",
            "engineerDepartment": "Maintenance",
            "engineerJob": "Programmer"
        };

        layui.use('table', function () {
            theTable = layui.table;

            //第一个实例
            theTable.render({
                elem: '#table_engineer',
                url: '/manage/engineer/data', //数据接口
                width: '90%',
                page: true, //开启分页
                cols: [[ //表头
                    {field: 'selected', title: '', width: 40, fixed: 'left', type: 'checkbox'}
                    , {field: 'engineerId', title: '工号', width: 60, sort: true, fixed: 'left'}
                    , {
                        field: 'engineerName',
                        title: '姓名',
                        width: 120,
                        sort: true,
                        fixed: 'left'
                        ,
                        templet: '<div><a href="javascript:popup_layer_engineer(testEngineer)" class="layui-table-link">{{d.engineerName}}</a></div>'
                    }
                    , {field: 'engineerSex', title: '性别', width: 160, sort: true}
                    , {field: 'engineerCompany', title: '公司', width: 200}
                    , {field: 'engineerDepartment', title: '部门', width: 180}
                    , {field: 'engineerJob', title: '职务', width: 160, sort: true}
                    , {fixed: 'right', width: 120, align: 'center', toolbar: '#barDemo'}
                ]]
            });

            theTable.on('tool(table_engineer)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                var tr = obj.tr; //获得当前行 tr 的DOM对象

                if (layEvent === 'del') { //删除
                    layer.confirm('真的删除行么', function (index) {
                        obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                        layer.close(index);
                        //向服务端发送删除指令
                    });
                } else if (layEvent === 'edit') { //编辑
                    //do something
                    console.log(obj.data)
                    popup_layer_engineer_edit(obj.data)
                }
            });
        });

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


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
<jsp:include page="headersidenav.jsp" />
    <div class="layui-body">
        <div style="padding: 15px;">
    <!--在此处添加页面代码-->
            <table id="demo" lay-filter="test"></table>


    <!--在此处添加页面代码-->
        </div>
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
        layui.code
        var table = layui.table;

    //转换静态表格
        table.init('demo', {
            height: 315 //设置高度
            ,limit: 10 //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
            //支持所有基础参数
        });
    });
    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#demo'
            ,height: 315
            //,url: '/demo/table/user/' //数据接口
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'id', title: '工号', width:180, sort: true, fixed: 'left',templet: '<div><a href="/detail/{{d.id}}" class="layui-table-link">{{d.id}}</a></div>'}
                ,{field: 'username', title: '姓名', width:180}
                ,{field: 'sex', title: '性别', width:160, sort: true}
                ,{field: 'enterprise', title: '公司', width:200}
                ,{field: 'department', title: '部门', width: 180}
                ,{field: 'post', title: '职务', width:160, sort: true}
            ]]
            ,data: [{'id':'123456','username':'王境泽','sex':'male','enterprise':'鬼畜公司','department':'b站鬼畜区','post':'鬼畜素材师'},
                {'id':'123457','username':'大力哥','sex':'male','enterprise':'鬼畜公司','department':'b站鬼畜区','post':'鬼畜素材师'}]
        });

    });
</script>

</body>
</html>


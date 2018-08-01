function table_class() {
    layui.use('table', function () {
        var table_class = layui.table;

        table_class.render({
            elem: '#table_class'
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
        });
    });
}

function table_group() {
    layui.use('table', function () {
        var table_group = layui.table;
        //第一个实例
        table_group.render({
            elem: '#table_group'
            //,url: '/demo/table/user/' //数据接口
            , width: '90%'
            , page: true //开启分页
            , cols: [[ //表头
                {field: 'id', title: 'ID', width: 200, sort: true, fixed: 'left'}
                , {
                    field: 'username',
                    title: '组名',
                    width: 200,
                    templet: '<div><a href="/dashboard/team" class="layui-table-link">{{d.username}}</a></div>'
                }
                , {field: 'engineer', title: '项目', width: 200, sort: true}
            ]]
            , data: [{'id': '1', 'username': 'iiiiii', 'engineer': 'adfdsafafd'},
                {'id': '2', 'username': 'aaaa', 'engineer': 'lkjljjilkj'}]

        });
    })
}

function table_engineer(theTable, update_table) {
        //第一个实例
        theTable.render({
            elem: '#table_engineer',
            url: '/manage/engineer/data', //数据接口
            width: '90%',
            page: true, //开启分页
            cols: [[ //表头
                {field: 'engineerId', title: '工号', width: 100, sort: true, fixed: 'left'}
                , {
                    field: 'engineerName',
                    title: '姓名',
                    width: 120,
                    sort: true,
                    fixed: 'left'
                    ,
                    templet: '<div><a href="javascript:show_popup_layer_engineer({{d.engineerId}})" class="layui-table-link">{{d.engineerName}}</a></div>'
                }
                , {field: 'engineerSex', title: '性别', width: 80}
                , {field: 'engineerCompany', title: '公司', width: 200, sort: true}
                , {field: 'engineerDepartment', title: '部门', width: 180, sort: true}
                , {field: 'engineerJob', title: '职务', width: 160, sort: true}
                , {fixed: 'right', width: 120, align: 'center', toolbar: '#barDemo'}
            ]]
        });

        theTable.on('tool(table_engineer)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）

            if (layEvent === 'del') { //删除
                console.log(obj);
                layer.confirm('确认删除?', function (index) {
                    console.log('/manage/engineer/delete?ID=' + obj.data.engineerId);
                    layer.close(index);
                    HttpGet('/manage/engineer/delete?ID=' + obj.data.engineerId, update_table, function (msg) {
                        layer.alert(msg);
                    });
                });
            } else if (layEvent === 'edit') { //编辑
                //do something
                console.log(obj.data)
                show_popup_layer_engineer_edit(obj.data.engineerId, update_table);
            }
        });

    theTable.on('sort(table_engineer)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        console.log(obj.field); //当前排序的字段名
        console.log(obj.type); //当前排序类型：desc（降序）、asc（升序）、null（空对象，默认排序）
        console.log(this); //当前排序的 th 对象
        console.log(theTable);

        theTable.reload('table_engineer', {
            initSort: obj //记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
            ,where: { //请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
                field: obj.field //排序字段
                ,isAsc: (obj.type == 'asc' ? 'true' : 'false') //排序方式
            }
            ,page: {
                curr : 1
            }
        });
    });

}
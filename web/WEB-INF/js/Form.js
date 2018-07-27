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
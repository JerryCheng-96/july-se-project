function table_class(table_class, update_table, dataUrl) {
    table_class.render({
        elem: '#table_class'
        , url: dataUrl
        , width: '90%'
        , page: true //开启分页
        , cols: [[ //表头
            {field: 'classId', title: 'ID', width: 200, sort: true, fixed: 'left'}
            , {
                field: 'className', title: '班级', width: 200, sort: true,
                templet: '<div><a href="/dashboard/class?id={{d.classId}}" class="layui-table-link">{{d.className}}</a></div>'
            }
            , {
                field: 'engineerName', title: '负责工程师', width: 200, sort: true,
                templet: '<div><a href="javascript:show_popup_layer_engineer({{d.classManager}});" class="layui-table-link">{{d.engineerName}}</a></div>'
            }
            , {
                field: 'programName', title: '适用教学计划', width: 200, sort: true,
                templet: '<div><a href="/dashboard/class?id={{d.classProgram}}" class="layui-table-link">{{d.programName}}</a></div>'
            }
        ]]
    });

    table_class.on('sort(table_class)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        console.log(obj.field); //当前排序的字段名
        console.log(obj.type); //当前排序类型：desc（降序）、asc（升序）、null（空对象，默认排序）
        console.log(this); //当前排序的 th 对象
        console.log(theTable);

        table_class.reload('table_class', {
            initSort: obj //记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
            , where: { //请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
                field: obj.field //排序字段
                , isAsc: (obj.type == 'asc' ? 'true' : 'false') //排序方式
            }
            , page: {
                curr: 1
            }
        });
    });
}

function table_group(table_group, update_table, dataUrl) {
    table_group.render({
        elem: '#table_group'
        , url: dataUrl
        , width: '90%'
        , page: true //开启分页
        , cols: [[ //表头
            {field: 'groupId', title: 'ID', width: 200, sort: true, fixed: 'left'}
            , {
                field: 'groupName', title: '小组名称', width: 200, sort: true,
                templet: '<div><a href="/dashboard/group?id={{d.groupId}}" group="layui-table-link">{{d.groupName}}</a></div>'
            }
            , {
                field: 'groupOnproject', title: '进行中项目', width: 200, sort: true,
                templet: '<div><a href="/dashboard/project?id={{d.groupOnproject}}" group="layui-table-link">{{d.groupOnproject}}</a></div>'
            }
        ]]
    });

    table_group.on('sort(table_group)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        console.log(obj.field); //当前排序的字段名
        console.log(obj.type); //当前排序类型：desc（降序）、asc（升序）、null（空对象，默认排序）
        console.log(this); //当前排序的 th 对象

        table_group.reload('table_group', {
            initSort: obj //记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
            , where: { //请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
                field: obj.field //排序字段
                , isAsc: (obj.type == 'asc' ? 'true' : 'false') //排序方式
            }
            , page: {
                curr: 1
            }
        });
    });
}

function table_student(theTable, update_table, dataUrl, showClass, toolbar_name) {
    if (typeof toolbar_name == 'undefined') {
        toolbar_name = '#barDemo';
    }

    if (typeof showClass == 'undefined') {
        var tableCols = [[ //表头
            {field: 'studentId', title: 'ID', width: 100, sort: true, fixed: 'left'}
            , {
                field: 'studentName', title: '姓名', width: 120, sort: true,
                templet: '<div><a href="javascript:show_popup_student({{d.studentId}})" class="layui-table-link">{{d.studentName}}</a></div>'
            }
            , {field: 'studentSex', title: '性别', width: 80, sort: true}
            , {field: 'studentDepartment', title: '学院', width: 150, sort: true}
            , {field: 'studentMajor', title: '专业', width: 150, sort: true}
            , {field: 'studentGrade', title: '年级', width: 150, sort: true}
            , {
                field: 'studentClass', title: '班级', width: 150, sort: true,
                templet: '<div><a href="/dashboard/class?id={{d.studentClass}}" class="layui-table-link">{{(typeof d.studentClass != "undefined") ? d.className : ""}}</a></div>'
            }
            , {fixed: 'right', width: 120, align: 'center', toolbar: toolbar_name}
        ]];
    }
    else if (showClass == 'no') {
        var tableCols = [[ //表头
            {field: 'studentId', title: 'ID', width: 100, sort: true, fixed: 'left'}
            , {
                field: 'studentName', title: '姓名', width: 120, sort: true,
                templet: '<div><a href="javascript:show_popup_student({{d.studentId}})" class="layui-table-link">{{d.studentName}}</a></div>'
            }
            , {field: 'studentSex', title: '性别', width: 80, sort: true}
            , {field: 'studentDepartment', title: '学院', width: 150, sort: true}
            , {field: 'studentMajor', title: '专业', width: 150, sort: true}
            , {field: 'studentGrade', title: '年级', width: 150, sort: true}
            , {fixed: 'right', width: 120, align: 'center', toolbar: toolbar_name}
        ]];
    }

    var tableParams = {
        elem: '#tableStudent'
        , url: dataUrl
        , width: '90%'
        , page: true //开启分页
        , cols: tableCols
    };

    theTable.render(tableParams);

    theTable.on('tool(tableStudent)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）

        if (layEvent === 'del') { //删除
            console.log(obj);
            layer.confirm('确认删除?', function (index) {
                console.log('/manage/student/delete?ID=' + obj.data.studentId);
                layer.close(index);
                HttpGet('/manage/student/delete?ID=' + obj.data.studentId, update_table, function (msg) {
                    layer.alert(msg);
                });
            });
        } else if (layEvent === 'edit') { //编辑
            //do something
            console.log(obj.data)
            show_student_edit(obj.data.studentId, update_table);
        } else if (layEvent === 'addToClass') {
            update_table(obj.data.studentId);
        } else if (layEvent === 'removeFromClass') {
            update_table(obj.data.studentId);
        }
    });

    theTable.on('sort(tableStudent)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        console.log(obj.field); //当前排序的字段名
        console.log(obj.type); //当前排序类型：desc（降序）、asc（升序）、null（空对象，默认排序）
        console.log(this); //当前排序的 th 对象
        console.log(theTable);

        theTable.reload('tableStudent', {
            initSort: obj //记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
            , where: { //请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
                field: obj.field //排序字段
                , isAsc: (obj.type == 'asc' ? 'true' : 'false') //排序方式
            }
            , page: {
                curr: 1
            }
        });
    });

}

function table_engineer(theTable, update_table, toolbar_name) {
    if (typeof toolbar_name == "undefined") {
        toolbar_name = '#barDemo';
    }

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
                fixed: 'left',
                templet: '<div><a href="javascript:show_popup_layer_engineer({{d.engineerId}})" class="layui-table-link">{{d.engineerName}}</a></div>'
            }
            , {field: 'engineerSex', title: '性别', width: 80}
            , {field: 'engineerCompany', title: '公司', width: 200, sort: true}
            , {field: 'engineerDepartment', title: '部门', width: 180, sort: true}
            , {field: 'engineerJob', title: '职务', width: 160, sort: true}
            , {fixed: 'right', width: 120, align: 'center', toolbar: toolbar_name}
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
        } else if (layEvent === 'select') {
            update_table(obj.data.engineerId);
        }
    });

    theTable.on('sort(table_engineer)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        console.log(obj.field); //当前排序的字段名
        console.log(obj.type); //当前排序类型：desc（降序）、asc（升序）、null（空对象，默认排序）
        console.log(this); //当前排序的 th 对象
        console.log(theTable);

        theTable.reload('table_engineer', {
            initSort: obj //记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
            , where: { //请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
                field: obj.field //排序字段
                , isAsc: (obj.type == 'asc' ? 'true' : 'false') //排序方式
            }
            , page: {
                curr: 1
            }
        });
    });

}

function table_program(table_program, update_table, dataUrl, showEngineer, toolbar_name) {
    if (typeof showEngineer == 'undefined') {
        var theCols = [[ //表头
            {field: 'programId', title: 'ID', width: 200, sort: true, fixed: 'left'}
            , {
                field: 'programName', title: '计划名称', width: 200, sort: true,
                templet: '<div><a href="/dashboard/program?id={{d.programId}}" class="layui-table-link">{{d.programName}}</a></div>'
            }
            , {
                field: 'programAuthor', title: '工程师', width: 200, sort: true,
                templet: '<div><a href="javascript:show_popup_layer_engineer({{d.programAuthor}});" class="layui-table-link">{{d.engineerName}}</a></div>'
            }
            , {fixed: 'right', width: 120, align: 'center', toolbar: toolbar_name}
        ]];
    } else if (showEngineer == 'no') {
        var theCols = [[ //表头
            {field: 'programId', title: 'ID', width: 200, sort: true, fixed: 'left'}
            , {field: 'programName', title: '计划名称', width: 200, sort: true}
            , {fixed: 'right', width: 120, align: 'center', toolbar: toolbar_name}
        ]];
    }

    table_program.render({
        elem: '#table_program'
        , url: dataUrl
        , width: '90%'
        , page: true //开启分页
        , cols: theCols
    });

    table_program.on('tool(table_program)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）

        if (layEvent === 'select') {
            update_table(obj.data.programId);
        }
    });

    table_program.on('sort(table_program)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        console.log(obj.field); //当前排序的字段名
        console.log(obj.type); //当前排序类型：desc（降序）、asc（升序）、null（空对象，默认排序）
        console.log(this); //当前排序的 th 对象
        console.log(theTable);

        table_program.reload('table_class', {
            initSort: obj //记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
            , where: { //请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
                field: obj.field //排序字段
                , isAsc: (obj.type == 'asc' ? 'true' : 'false') //排序方式
            }
            , page: {
                curr: 1
            }
        });
    });
}

function table_project(table_project, update_table, dataUrl, toolbar_name) {
    table_project.render({
        elem: '#table_project'
        , url: dataUrl
        , width: '90%'
        , page: true //开启分页
        , cols: [[ //表头
            {field: 'projectId', title: 'ID', width: 200, sort: true, fixed: 'left'}
            , {
                field: 'projectName', title: '项目名称', width: 200, sort: true,
                templet: '<div><a href="/dashboard/project?id={{d.projectId}}" class="layui-table-link">{{d.projectName}}</a></div>'
            }
            , {fixed: 'right', width: 120, align: 'center', toolbar: toolbar_name}
        ]]
    });

    table_project.on('tool(table_project)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）

        if (layEvent === 'select') {
            update_table(obj.data.projectId);
        }
    });

    table_project.on('sort(table_project)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        console.log(obj.field); //当前排序的字段名
        console.log(obj.type); //当前排序类型：desc（降序）、asc（升序）、null（空对象，默认排序）
        console.log(this); //当前排序的 th 对象

        table_project.reload('table_project', {
            initSort: obj //记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
            , where: { //请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
                field: obj.field //排序字段
                , isAsc: (obj.type == 'asc' ? 'true' : 'false') //排序方式
            }
            , page: {
                curr: 1
            }
        });
    });
}

function table_task(table_task, update_table, dataUrl, showEngineer, toolbar_name) {
    if (typeof showEngineer == 'undefined') {
        var theCols = [[ //表头
            {field: 'taskId', title: 'ID', width: 200, sort: true, fixed: 'left'}
            , {
                field: 'taskName', title: '任务名称', width: 200, sort: true
                // , templet: '<div><a href="/dashboard/program?id={{d.programId}}" class="layui-table-link">{{d.programName}}</a></div>'
            }
            , {
                field: 'taskDescription', title: '描述', width: 200, sort: true
                // , templet: '<div><a href="javascript:show_popup_layer_engineer({{d.programAuthor}});" class="layui-table-link">{{d.engineerName}}</a></div>'
            }
            , {
                field: 'taskTime', title: '时间', width: 200, sort: true
                // , templet: '<div><a href="javascript:show_popup_layer_engineer({{d.programAuthor}});" class="layui-table-link">{{d.engineerName}}</a></div>'
            }
            , {fixed: 'right', width: 120, align: 'center', toolbar: toolbar_name}
        ]];
    } else if (showEngineer == 'no') {
        var theCols = [[ //表头
            {field: 'programId', title: 'ID', width: 200, sort: true, fixed: 'left'}
            , {field: 'programName', title: '计划名称', width: 200, sort: true}
            , {fixed: 'right', width: 120, align: 'center', toolbar: toolbar_name}
        ]];
    }

    table_task.render({
        elem: '#table_task'
        , url: dataUrl
        , width: '90%'
        , page: true //开启分页
        , cols: theCols
    });

    table_task.on('tool(table_task)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）

        if (layEvent === 'del') {
            HttpGet('/manage/task/delete?ID=' + obj.data.taskId, update_table, function (msg) {
                layer.alert(msg);
            });
        }
    });

    table_task.on('sort(table_task)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        console.log(obj.field); //当前排序的字段名
        console.log(obj.type); //当前排序类型：desc（降序）、asc（升序）、null（空对象，默认排序）
        console.log(this); //当前排序的 th 对象
        console.log(theTable);

        table_task.reload('table_class', {
            initSort: obj //记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
            , where: { //请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
                field: obj.field //排序字段
                , isAsc: (obj.type == 'asc' ? 'true' : 'false') //排序方式
            }
            , page: {
                curr: 1
            }
        });
    });
}

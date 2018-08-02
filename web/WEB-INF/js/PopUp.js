function show_popup_layer_engineer(engineerId) {
    HttpGetResponse('/manage/engineer/getOne?ID=' + engineerId,
        function (response) {
            popup_layer_engineer(JSON.parse(response));
        }, undefined);
}

function show_popup_student(studentId) {
    HttpGetResponse('/manage/student/getOne?ID=' + studentId,
        function (response) {
            popup_student(JSON.parse(response));
        }, undefined);
}

function show_student_edit(studentId, whenDone) {
    HttpGetResponse('/manage/student/getOne?ID=' + studentId,
        function (response) {
            popup_student_edit(JSON.parse(response), whenDone);
        }, undefined);
}

function show_class_edit(classId, whenDone) {
    HttpGetResponse('/manage/class/getOne?ID=' + classId,
        function (response) {
            popup_class_edit(JSON.parse(response), whenDone);
        }, undefined);
}

function show_program_edit(programId, whenDone) {
    console.log('in program edit');
    HttpGetResponse('/manage/program/getOne?ID=' + programId,
        function (response) {
            popup_program_edit(JSON.parse(response), whenDone);
        }, undefined);
}

function show_group_edit(groupId, whenDone) {
    HttpGetResponse('/manage/group/getOne?ID=' + groupId,
        function (response) {
            popup_group_edit(JSON.parse(response), whenDone);
        }, undefined);
}

function show_popup_layer_engineer_edit(engineerId, whenDone) {
    HttpGetResponse('/manage/engineer/getOne?ID=' + engineerId,
        function (response) {
            popup_layer_engineer_edit(JSON.parse(response), whenDone);
        }, undefined);
}

function popup_layer_engineer(theEngineer) {
    console.log(theEngineer);
    layui.use('layer', function () {
        var layer = layui.layer;
        layer.open({
            type: 1,
            title: '人员信息',
            content: "" +
                '<div style="width: 90%">' +
                '<table border="0" style="margin:3%">' +
                '<tr>' +
                '<td>' +
                '<img src="/res/icon/5.png" style="width:80px;height:80px;border-radius:80px;margin:10px;">' +
                '</td>' +
                '<td colspan=2><span style="font-size:30px; margin-left:10px;">' + theEngineer.engineerName + '</span></td>' +
                '</tr>' +
                '<tr">' +
                '<td></td>' +
                '<td><span style="margin-left:10px; font-size: 17px"><b>性别</b></span></td>' +
                '<td><span style="margin-left:30px; font-size: 17px">' + theEngineer.engineerSex + '</span></td>' +
                '</tr>' +
                '<tr>' +
                '<td></td>' +
                '<td><span style="margin-left:10px; font-size: 17px"><b>工号</b></span></td>' +
                '<td><span style="margin-left:30px; font-size: 17px">' + theEngineer.engineerId + '</span></td>' +
                '</tr>' +
                '<tr>' +
                '<td></td>' +
                '<td><span style="margin-left:10px; font-size: 17px"><b>公司</b></span></td>' +
                '<td><span style="margin-left:30px; font-size: 17px">' + theEngineer.engineerCompany + '</span></td>' +
                '</tr>' +
                '<tr>' +
                '<td></td>' +
                '<td><span style="margin-left:10px; font-size: 17px"><b>部门</b></span></td>' +
                '<td><span style="margin-left:30px; font-size: 17px">' + theEngineer.engineerDepartment + '</span></td>' +
                '</tr>' +
                '<tr>' +
                '<td></td>' +
                '<td><span style="margin-left:10px; font-size: 17px"><b>职务</b></span></td>' +
                '<td><span style="margin-left:30px; font-size: 17px">' + theEngineer.engineerJob + '</span></td>' +
                '</tr>' +
                '<tr/>' +
                '</table>' +
                '<br/>' +
                '' +
                '' +
                '' +
                "</div>",
            area: '400px'
        });
    });
}

function popup_layer_engineer_edit(theEngineer, whenDone) {
    console.log(theEngineer);
    var buttonText = '更改';
    if (typeof theEngineer == "undefined") {
        theEngineer = {
            "engineerId": '',
            "engineerName": "",
            "engineerSex": "",
            "engineerCompany": "",
            "engineerDepartment": "",
            "engineerJob": ""
        };
        buttonText = '添加';
    }

    layui.use(['layer', 'form'], function () {
        var layer = layui.layer;
        var form = layui.form;

        layer.open({
            type: 1,
            title: '',
            content: "<div style='width: 90%; margin-right: 30px';>" +
                "<form class=\"layui-form\" action=\"\"'>" +
                "  <div class=\"layui-form-item\" style='padding-top:20px'>" +
                "    <label class=\"layui-form-label\"'>工号</label>" +
                "    <div class=\"layui-input-block\" >" +
                "      <input type=\"text\" name=\"engineerId\" value='" + theEngineer.engineerId + "' " + (theEngineer.engineerId != '' ? 'disabled="disabled"' : '') + " required  lay-verify=\"required\" placeholder=\"必填\" autocomplete=\"off\" class=\"layui-input\">" +
                "    </div>" +
                "  </div>" +

                "  <div class=\"layui-form-item\" >" +
                "    <label class=\"layui-form-label\" style='margin-left: 0px'>姓名</label>" +
                "    <div class=\"layui-input-block\">" +
                "      <input type=\"text\" name=\"engineerName\" value='" + theEngineer.engineerName + "' required  lay-verify=\"required\" placeholder=\"必填\" autocomplete=\"off\" class=\"layui-input\">" +
                "    </div>" +
                "  </div>" +

                "  <div class=\"layui-form-item\">" +
                "    <label class=\"layui-form-label\">性别</label>" +
                "    <div class=\"layui-input-block\">" +
                "      <input type=\"radio\" name=\"engineerSex\" value=\"男\" title=\"男\"" + (theEngineer.engineerSex == "男" || theEngineer.engineerSex == "" ? "checked" : "") + ">" +
                "      <input type=\"radio\" name=\"engineerSex\" value=\"女\" title=\"女\"" + (theEngineer.engineerSex == "女" ? "checked" : "") + ">" +
                "    </div>" +
                "  </div>" +

                "  <div class=\"layui-form-item\">" +
                "    <label class=\"layui-form-label\">公司</label>" +
                "    <div class=\"layui-input-block\">" +
                "      <input type=\"text\" name=\"engineerCompany\" value='" + theEngineer.engineerCompany + "' placeholder=\"选填\" autocomplete=\"off\" class=\"layui-input\">" +
                "    </div>" +
                "  </div>" +

                "  <div class=\"layui-form-item\">" +
                "    <label class=\"layui-form-label\">部门</label>" +
                "    <div class=\"layui-input-block\">" +
                "      <input type=\"text\" name=\"engineerDepartment\" value='" + theEngineer.engineerDepartment + "' placeholder=\"选填\" autocomplete=\"off\" class=\"layui-input\">" +
                "    </div>" +
                "  </div>" +

                "  <div class=\"layui-form-item\">" +
                "    <label class=\"layui-form-label\">职务</label>" +
                "    <div class=\"layui-input-block\">" +
                "      <input type=\"text\" name=\"engineerJob\" value='" + theEngineer.engineerJob + "' placeholder=\"选填\" autocomplete=\"off\" class=\"layui-input\">" +
                "    </div>" +
                "  </div>" +

                "  <div class=\"layui-form-item\">" +
                "    <div class=\"layui-input-block\">" +
                "      <button class=\"layui-btn\" lay-submit lay-filter=\"formDemo\">" + buttonText + "</button>" +
                "      <a href='javascript:layer.close(layer.index)' class=\"layui-btn layui-btn-primary\">取消</a>" +
                "    </div>" +
                "  </div>" +
                "</form>" +
                "</div>",
            area: '450px',
        });

        form.render();

        //监听提交
        form.on('submit(formDemo)', function (data) {
            var result = '';
            if (buttonText == '更改') {
                HttpPost('/manage/engineer/update', data.field, whenDone, function (msg) {
                    layer.alert(msg);
                });
            }
            else {
                HttpPost('/manage/engineer/new', data.field, whenDone, function (msg) {
                    layer.alert(msg);
                });
            }
            return false;
        });
    });
}

function popup_student_edit(theStudent, whenDone) {
    console.log(theStudent);
    var buttonText = '更改';
    if (typeof theStudent == "undefined") {
        theStudent = {
            "studentId": '',
            "studentName": "",
            "studentSex": "",
            "studentGrade": "",
            "studentDepartment": "",
            "studentMajor": ""
        };
        buttonText = '添加';
    }

    layui.use(['layer', 'form'], function () {
        var layer = layui.layer;
        var form = layui.form;

        layer.open({
            type: 1,
            title: '',
            content: "<div style='width: 90%; margin-right: 30px';>" +
                "<form class=\"layui-form\" action=\"\"'>" +
                "  <div class=\"layui-form-item\" style='padding-top:20px'>" +
                "    <label class=\"layui-form-label\"'>学号</label>" +
                "    <div class=\"layui-input-block\" >" +
                "      <input type=\"text\" name=\"studentId\" value='" + theStudent.studentId + "' " + (theStudent.studentId != '' ? 'disabled="disabled"' : '') + " required  lay-verify=\"required\" placeholder=\"必填\" autocomplete=\"off\" class=\"layui-input\">" +
                "    </div>" +
                "  </div>" +

                "  <div class=\"layui-form-item\" >" +
                "    <label class=\"layui-form-label\" style='margin-left: 0px'>姓名</label>" +
                "    <div class=\"layui-input-block\">" +
                "      <input type=\"text\" name=\"studentName\" value='" + theStudent.studentName + "' required  lay-verify=\"required\" placeholder=\"必填\" autocomplete=\"off\" class=\"layui-input\">" +
                "    </div>" +
                "  </div>" +

                "  <div class=\"layui-form-item\">" +
                "    <label class=\"layui-form-label\">性别</label>" +
                "    <div class=\"layui-input-block\">" +
                "      <input type=\"radio\" name=\"studentSex\" value=\"男\" title=\"男\"" + (theStudent.studentSex == "男" || theStudent.studentSex == "" ? "checked" : "") + ">" +
                "      <input type=\"radio\" name=\"studentSex\" value=\"女\" title=\"女\"" + (theStudent.studentSex == "女" ? "checked" : "") + ">" +
                "    </div>" +
                "  </div>" +

                "  <div class=\"layui-form-item\">" +
                "    <label class=\"layui-form-label\">年级</label>" +
                "    <div class=\"layui-input-block\">" +
                "      <input type=\"text\" name=\"studentGrade\" value='" + theStudent.studentGrade + "' placeholder=\"选填\" autocomplete=\"off\" class=\"layui-input\">" +
                "    </div>" +
                "  </div>" +

                "  <div class=\"layui-form-item\">" +
                "    <label class=\"layui-form-label\">学院</label>" +
                "    <div class=\"layui-input-block\">" +
                "      <input type=\"text\" name=\"studentDepartment\" value='" + theStudent.studentDepartment + "' placeholder=\"选填\" autocomplete=\"off\" class=\"layui-input\">" +
                "    </div>" +
                "  </div>" +

                "  <div class=\"layui-form-item\">" +
                "    <label class=\"layui-form-label\">专业</label>" +
                "    <div class=\"layui-input-block\">" +
                "      <input type=\"text\" name=\"studentMajor\" value='" + theStudent.studentMajor + "' placeholder=\"选填\" autocomplete=\"off\" class=\"layui-input\">" +
                "    </div>" +
                "  </div>" +

                "  <div class=\"layui-form-item\">" +
                "    <div class=\"layui-input-block\">" +
                "      <button class=\"layui-btn\" lay-submit lay-filter=\"formDemo\">" + buttonText + "</button>" +
                "      <a href='javascript:layer.close(layer.index)' class=\"layui-btn layui-btn-primary\">取消</a>" +
                "    </div>" +
                "  </div>" +
                "</form>" +
                "</div>",
            area: '450px',
        });

        form.render();

        //监听提交
        form.on('submit(formDemo)', function (data) {
            var result = '';
            if (buttonText == '更改') {
                HttpPost('/manage/student/update', data.field, whenDone, function (msg) {
                    layer.alert(msg);
                });
            }
            else {
                HttpPost('/manage/student/new', data.field, whenDone, function (msg) {
                    layer.alert(msg);
                });
            }
            return false;
        });
    });
}

function popup_student(theStudent) {
    console.log(theStudent);
    layui.use('layer', function () {
        var layer = layui.layer;
        layer.open({
            type: 1,
            title: '人员信息',
            content: "" +
                '<div style="width: 90%">' +
                '<table border="0" style="margin:3%">' +
                '<tr>' +
                '<td>' +
                '<img src="/res/icon/5.png" style="width:80px;height:80px;border-radius:80px;margin:10px;">' +
                '</td>' +
                '<td colspan=2><span style="font-size:30px; margin-left:10px;">' + theStudent.studentName + '</span></td>' +
                '</tr>' +
                '<tr">' +
                '<td></td>' +
                '<td><span style="margin-left:10px; font-size: 17px"><b>性别</b></span></td>' +
                '<td><span style="margin-left:30px; font-size: 17px">' + theStudent.studentSex + '</span></td>' +
                '</tr>' +
                '<tr>' +
                '<td></td>' +
                '<td><span style="margin-left:10px; font-size: 17px"><b>学号</b></span></td>' +
                '<td><span style="margin-left:30px; font-size: 17px">' + theStudent.studentId + '</span></td>' +
                '</tr>' +
                '<tr>' +
                '<td></td>' +
                '<td><span style="margin-left:10px; font-size: 17px"><b>年级</b></span></td>' +
                '<td><span style="margin-left:30px; font-size: 17px">' + theStudent.studentGrade + '</span></td>' +
                '</tr>' +
                '<tr>' +
                '<td></td>' +
                '<td><span style="margin-left:10px; font-size: 17px"><b>学院</b></span></td>' +
                '<td><span style="margin-left:30px; font-size: 17px">' + theStudent.studentDepartment + '</span></td>' +
                '</tr>' +
                '<tr>' +
                '<td></td>' +
                '<td><span style="margin-left:10px; font-size: 17px"><b>专业</b></span></td>' +
                '<td><span style="margin-left:30px; font-size: 17px">' + theStudent.studentMajor + '</span></td>' +
                '</tr>' +
                '<tr/>' +
                '</table>' +
                '<br/>' +
                '' +
                '' +
                '' +
                "</div>",
            area: '400px'
        });
    });
}

function popup_class_edit(theClass, whenDone) {
    console.log(theClass);
    var buttonText = '更改';

    layui.use(['layer', 'form'], function () {
        var layer = layui.layer;
        var form = layui.form;

        layer.open({
            type: 1,
            title: '',
            content: "<div style='width: 90%; margin-right: 30px';>" +
                "<form class=\"layui-form\" action=\"\"'>" +
                "  <div class=\"layui-form-item\" style='padding-top:20px'>" +
                "    <label class=\"layui-form-label\"'>班级编号</label>" +
                "    <div class=\"layui-input-block\" >" +
                "      <input type=\"text\" name=\"classId\" value='" + theClass.classId + "' " + (theClass.classId != '' ? 'disabled="disabled"' : '') + " required  lay-verify=\"required\" placeholder=\"必填\" autocomplete=\"off\" class=\"layui-input\">" +
                "    </div>" +
                "  </div>" +

                "  <div class=\"layui-form-item\" >" +
                "    <label class=\"layui-form-label\" style='margin-left: 0px'>班级名称</label>" +
                "    <div class=\"layui-input-block\">" +
                "      <input type=\"text\" name=\"className\" value='" + theClass.className + "' required  lay-verify=\"required\" placeholder=\"必填\" autocomplete=\"off\" class=\"layui-input\">" +
                "    </div>" +
                "  </div>" +

                "  <div class=\"layui-form-item\" >" +
                "    <label class=\"layui-form-label\" style='margin-left: 0px'>班级描述</label>" +
                "    <div class=\"layui-input-block\">" +
                "      <input type=\"text\" name=\"classDescription\" value='" + theClass.classDescription + "' required  lay-verify=\"required\" placeholder=\"必填\" autocomplete=\"off\" class=\"layui-input\">" +
                "    </div>" +
                "  </div>" +

                "  <div class=\"layui-form-item\">" +
                "    <div class=\"layui-input-block\">" +
                "      <button class=\"layui-btn\" lay-submit lay-filter=\"formDemo\">" + buttonText + "</button>" +
                "      <a href='javascript:layer.close(layer.index)' class=\"layui-btn layui-btn-primary\">取消</a>" +
                "    </div>" +
                "  </div>" +
                "</form>" +
                "</div>",
            area: '450px',
        });

        form.render();

        //监听提交
        form.on('submit(formDemo)', function (data) {
            theClass.className = data.field.className;
            theClass.classDescription = data.field.classDescription;

            HttpPost('/manage/class/update', theClass, whenDone, function (msg) {
                layer.alert(msg);
            });
            return false;
        });
    });
}

function popup_program_edit(theProgram, whenDone) {
    console.log(theProgram);
    var buttonText = '更改';
    if (typeof theProgram == 'undefined') {
        buttonText = '添加';
        theProgram = {
            programName: '',
            programDescription: ''
        };
    }

    layui.use(['layer', 'form'], function () {
        var layer = layui.layer;
        var form = layui.form;

        layer.open({
            type: 1,
            title: '',
            content: "<div style='width: 90%; margin-right: 30px; margin-top: 30px';>" +
                "<form class=\"layui-form\" action=\"\"'>" +
                "  <div class=\"layui-form-item\" >" +
                "    <label class=\"layui-form-label\" style='margin-left: 0px'>计划名称</label>" +
                "    <div class=\"layui-input-block\">" +
                "      <input type=\"text\" name=\"programName\" value='" + theProgram.programName + "' required  lay-verify=\"required\" placeholder=\"必填\" autocomplete=\"off\" class=\"layui-input\">" +
                "    </div>" +
                "  </div>" +

                "  <div class=\"layui-form-item\" >" +
                "    <label class=\"layui-form-label\" style='margin-left: 0px'>计划描述</label>" +
                "    <div class=\"layui-input-block\">" +
                "      <input type=\"text\" name=\"programDescription\" value='" + theProgram.programDescription + "' required  lay-verify=\"required\" placeholder=\"必填\" autocomplete=\"off\" class=\"layui-input\">" +
                "    </div>" +
                "  </div>" +

                "  <div class=\"layui-form-item\">" +
                "    <div class=\"layui-input-block\">" +
                "      <button class=\"layui-btn\" lay-submit lay-filter=\"formDemo\">" + buttonText + "</button>" +
                "      <a href='javascript:layer.close(layer.index)' class=\"layui-btn layui-btn-primary\">取消</a>" +
                "    </div>" +
                "  </div>" +
                "</form>" +
                "</div>",
            area: '450px',
        });

        form.render();

        //监听提交
        form.on('submit(formDemo)', function (data) {
            theProgram.programName = data.field.programName;
            theProgram.programDescription = data.field.programDescription;

            if (buttonText == '更改') {
                HttpPost('/manage/program/update', theProgram, whenDone, function (msg) {
                    layer.alert(msg);
                });
            }
            else if (buttonText == '添加') {
                HttpGetResponse('/getCurrentUser', function (response) {
                    var theUserJson = JSON.parse(response);
                    theProgram.programAuthor = theUserJson.username;
                    HttpPost('/manage/program/new', theProgram, whenDone, function (msg) {
                        layer.alert(msg);
                    });
                })
            }
            return false;
        });
    });
}

function popup_group_edit(theGroup, whenDone) {
    console.log(theGroup);
    var buttonText = '更改';

    layui.use(['layer', 'form'], function () {
        var layer = layui.layer;
        var form = layui.form;

        layer.open({
            type: 1,
            title: '',
            content: "<div style='width: 90%; margin-right: 30px; margin-top: 30px';>" +
                "<form class=\"layui-form\" action=\"\"'>" +
                "  <div class=\"layui-form-item\" >" +
                "    <label class=\"layui-form-label\" style='margin-left: 0px'>小组名称</label>" +
                "    <div class=\"layui-input-block\">" +
                "      <input type=\"text\" name=\"groupName\" value='" + theGroup.groupName + "' required  lay-verify=\"required\" placeholder=\"必填\" autocomplete=\"off\" class=\"layui-input\">" +
                "    </div>" +
                "  </div>" +

                "  <div class=\"layui-form-item\">" +
                "    <div class=\"layui-input-block\">" +
                "      <button class=\"layui-btn\" lay-submit lay-filter=\"formDemo\">" + buttonText + "</button>" +
                "      <a href='javascript:layer.close(layer.index)' class=\"layui-btn layui-btn-primary\">取消</a>" +
                "    </div>" +
                "  </div>" +
                "</form>" +
                "</div>",
            area: '450px',
        });

        form.render();

        //监听提交
        form.on('submit(formDemo)', function (data) {
            theGroup.groupName = data.field.groupName;

            HttpPost('/manage/group/update', theGroup, whenDone, function (msg) {
                layer.alert(msg);
            });
            return false;
        });
    });
}

function popup_task_edit(theTask, whenDone) {
    console.log(theTask);
    var buttonText = '更改';
    if (typeof theTask == 'undefined') {
        buttonText = '添加';
        theTask = {
            taskName: '',
            taskDescription: ''
        };
    }

    layui.use(['layer', 'form', 'laydate'], function () {
        var layer = layui.layer;
        var form = layui.form;
        var laydate = layui.laydate;

        var selDate = '';

        layer.open({
            type: 1,
            title: '',
            content: "<div style='width: 90%; margin-right: 30px; margin-top: 30px';>" +
                "<form class=\"layui-form\" action=\"\"'>" +
                "  <div class=\"layui-form-item\" >" +
                "    <label class=\"layui-form-label\" style='margin-left: 0px'>任务名称</label>" +
                "    <div class=\"layui-input-block\">" +
                "      <input type=\"text\" name=\"taskName\" value='" + theTask.taskName + "' required  lay-verify=\"required\" placeholder=\"必填\" autocomplete=\"off\" class=\"layui-input\">" +
                "    </div>" +
                "  </div>" +

                "  <div class=\"layui-form-item\" >" +
                "    <label class=\"layui-form-label\" style='margin-left: 0px'>任务描述</label>" +
                "    <div class=\"layui-input-block\">" +
                "      <input type=\"text\" name=\"taskDescription\" value='" + theTask.taskDescription + "' required  lay-verify=\"required\" placeholder=\"必填\" autocomplete=\"off\" class=\"layui-input\">" +
                "    </div>" +
                "  </div>" +

                "  <div class=\"layui-form-item\" >" +
                "    <label class=\"layui-form-label\" style='margin-left: 0px'>截止时间</label>" +
                "    <div class=\"layui-input-block\">" +
                '       <input type="text" name="taskTime" class="layui-input" id="dateTimePicker"> ' +
                "    </div>" +
                "  </div>" +


                "  <div class=\"layui-form-item\">" +
                "    <div class=\"layui-input-block\">" +
                "      <button class=\"layui-btn\" lay-submit lay-filter=\"formDemo\">" + buttonText + "</button>" +
                "      <a href='javascript:layer.close(layer.index)' class=\"layui-btn layui-btn-primary\">取消</a>" +
                "    </div>" +
                "  </div>" +
                "</form>" +
                "</div>",
            area: '450px',
        });

        form.render();

        laydate.render({
            elem: '#dateTimePicker',
            type: 'datetime',
            done: function (value) {
                selDate = value;
                console.log(typeof selDate);
                console.log(selDate);
            }
        });

        //监听提交
        form.on('submit(formDemo)', function (data) {
            theTask.taskName = data.field.taskName;
            theTask.taskDescription = data.field.taskDescription;
            theTask.taskTime = selDate;

            if (buttonText == '更改') {
                HttpPost('/manage/task/update', theTask, whenDone, function (msg) {
                    layer.alert(msg);
                });
            }
            else if (buttonText == '添加') {
                HttpGetResponse('/getCurrentUser', function (response) {
                    var theUserJson = JSON.parse(response);
                    theTask.taskEngineer = theUserJson.username;
                    HttpPost('/manage/task/new', theTask, whenDone, function (msg) {
                        layer.alert(msg);
                    });
                })
            }
            return false;
        });


    });
}

function popup_log_edit(theLog, whenDone, groupId, studentId) {
    console.log(theLog);
    var buttonText = '更改';
    if (typeof theLog == 'undefined') {
        buttonText = '添加';
        theLog = {
            logContent: '',
            logTime: '',
            logUploader: studentId,
            logGroup: groupId
        };
    }

    layui.use(['layer', 'form', 'laydate'], function () {
        var layer = layui.layer;
        var form = layui.form;
        var laydate = layui.laydate;

        var selDate;

        layer.open({
            type: 1,
            title: '',
            content: "<div style='width: 90%; margin-right: 30px; margin-top: 30px';>" +
                "<form class=\"layui-form\" action=\"\"'>" +
                "  <div class=\"layui-form-item\" >" +
                "    <label class=\"layui-form-label\" style='margin-left: 0px'>日志内容</label>" +
                "    <div class=\"layui-input-block\">" +
                "      <input type=\"text\" name=\"logContent\" value='" + theLog.logContent + "' required  lay-verify=\"required\" placeholder=\"必填\" autocomplete=\"off\" class=\"layui-input\">" +
                "    </div>" +
                "  </div>" +

                "  <div class=\"layui-form-item\" >" +
                "    <label class=\"layui-form-label\" style='margin-left: 0px'>时间</label>" +
                "    <div class=\"layui-input-block\">" +
                '       <input type="text" name="logTime" class="layui-input" id="dateTimePicker"> ' +
                "    </div>" +
                "  </div>" +


                "  <div class=\"layui-form-item\">" +
                "    <div class=\"layui-input-block\">" +
                "      <button class=\"layui-btn\" lay-submit lay-filter=\"formDemo\">" + buttonText + "</button>" +
                "      <a href='javascript:layer.close(layer.index)' class=\"layui-btn layui-btn-primary\">取消</a>" +
                "    </div>" +
                "  </div>" +
                "</form>" +
                "</div>",
            area: '450px',
        });

        form.render();

        laydate.render({
            elem: '#dateTimePicker',
            type: 'datetime',
            done: function (value) {
                selDate = value;
                console.log(typeof selDate);
                console.log(selDate);
            }
        });

        //监听提交
        form.on('submit(formDemo)', function (data) {
            console.log('Submitting log!')
            theLog.logContent = data.field.logContent;
            theLog.logTime = selDate;

            if (buttonText == '更改') {
                HttpPost('/manage/log/update', theLog, whenDone, function (msg) {
                    layer.alert(msg);
                });
            }
            else if (buttonText == '添加') {
                console.log('theLog');
                console.log(theLog);
                HttpPost('/manage/log/new', theLog, whenDone, function (msg) {
                    layer.alert(msg);
                });
            }
            return false;
        });


    });
}

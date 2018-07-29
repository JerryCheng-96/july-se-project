
function popup_layer_engineer(theEngineer) {
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
                '<td><span style="margin-left:30px; font-size: 17px">'+ theEngineer.engineerDepartment +'</span></td>' +
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
                "      <input type=\"text\" name=\"engineerId\" value='" + theEngineer.engineerId + "' " +  (theEngineer.engineerId != '' ? 'disabled="disabled"' : '')  + " required  lay-verify=\"required\" placeholder=\"必填\" autocomplete=\"off\" class=\"layui-input\">" +
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
                HttpPost('/manage/engineer/update', data, whenDone, function (msg) {
                    layer.alert(msg);
                });
            }
            else  {
                HttpPost('/manage/engineer/new', data, whenDone, function (msg) {
                    layer.alert(msg);
                });
            }
            return false;
        });
    });
}


function POSTJson (theObj) {

}
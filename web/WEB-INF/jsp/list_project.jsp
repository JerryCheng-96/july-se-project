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
        <jsp:param name="cat" value="projects"/>
        <jsp:param name="func" value="projects"/>
    </jsp:include>

    <div class="layui-body">
        <div class="layui-row">
            <div>
                <div style="float: left; padding-top: 10px"><span style="padding-left: 35px;"><a href=""
                                                                                                 class="layui-btn">添加项目</a></span>
                </div>
                <div style="float: right; margin-right: 25px; margin-top: 5px " id="demo0"></div>
            </div>
        </div>
        <div class="layui-row" style="padding: 15px;">
            <!--在此处添加页面代码-->
            <div id="theCards"></div>
            <!--在此处添加页面代码-->
        </div>
    </div>

</div>
<script src="/res/layui/layui.js"></script>
<script src="/js/Interaction.js"></script>
<script>
    layui.use(['element', 'laypage'], function () {
        var element = layui.element;
        var laypage = layui.laypage;
        //一些事件监听
        element.on('tab(demo)', function (data) {
            console.log(data);
        });

        function update_cards(card_json) {
            console.log(card_json);

            var cardHtml = '';
            for (var i = 0; i < card_json.length; i++) {
                var currProj = card_json[i];

                if (i == 0) {
                    cardHtml += '<div class="layui-row" style="padding-left: 10px; padding-right: 10px">'
                }
                if (i > 0 && i % 2 == 0) {
                    cardHtml += '</div><div class="layui-row" style="padding-left: 10px; padding-right: 10px">'
                }
                cardHtml += '<div class="layui-col-md6" style="padding-left: 10px;padding-bottom: 10px"> ' +
                    '<div class="layui-card" style="background-color: #F7F7F7"> ' +
                    "<div class='layui-card-header'><a href='/dashboard/project?id=" + currProj.projectId.toString() + "'><b>" + currProj.projectName +
                    "</b></a></div> " +
                    '<div class="layui-card-body"> ' +
                    '<label style="overflow: hidden; text-overflow: ellipsis; display: inline-block; height: 50px; word-break: break-word">' +
                     card_json[i].projectDescription.substr(0, 65) + (currProj.projectDescription.length > 65 ? '...' : '') +
                    '</label>' +
                    '</div>' +
                    '</div>' +
                    '</div>';
            }
            cardHtml += '</div>'
            document.getElementById('theCards').innerHTML = cardHtml;
        }

        HttpGetResponse('/manage/project/data?page=1&limit=8', function (response) {
            var theJson = JSON.parse(response);
            var projectCnt = theJson.count;
            update_cards(theJson.data);

            console.log('projectCnt');
            console.log(projectCnt);

            laypage.render({
                elem: 'demo0'
                , count: projectCnt //数据总数
                , limit: 8
                , jump: function (obj, first) {
                    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                    console.log(obj.limit); //得到每页显示的条数
                    if (!first) {
                        var url = '/manage/project/data?page=' + obj.curr + '&limit=' + obj.limit;
                        HttpGetResponse(url, function (response) {
                            update_cards(JSON.parse(response).data);
                        }, function () {
                            ;
                        })
                    }
                }
            });
        })


    });

</script>
</body>
</html>

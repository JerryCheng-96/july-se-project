<%--
  Created by IntelliJ IDEA.
  User: HC
  Date: 2018/7/27
  Time: 3:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AllEngineers</title>
</head>
<body>
<table>
    <c:choose>
        <c:when test="${not empty engineers}">
            <c:forEach items="${engineers}" var="engineer" varStatus = "status">
                <tr>
                <td>${engineer.getEngineerName()}</td>
                <td>${engineer.getEngineerSex()}</td>
                <td>${engineer.getEngineerCompany()}</td>
                <td>${engineer.getEngineerDepartment()}</td>
                <td>${engineer.getEngineerJob()}</td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
                <tr>
                    <td>nothing</td>
                </tr>
        </c:otherwise>
    </c:choose>
</table>
</body>
</html>

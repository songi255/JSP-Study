<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-11
  Time: 오후 5:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h4>구구단 출력하기</h4>
    <jsp:include page="forward_data.jsp">
        <jsp:param name="dan" value="5"/>
    </jsp:include>
</body>
</html>

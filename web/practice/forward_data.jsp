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
    <%
        int dan = Integer.parseInt(request.getParameter("dan"));
        for (int i = 1; i <= 9; i++) {
            out.println(dan + " * " + i + " = " + (dan * i) + "<br/>");
        }
    %>
</body>
</html>

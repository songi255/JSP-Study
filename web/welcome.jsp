<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-04-01
  Time: 오후 4:18
  To change this template use File | Settings | File Templates.
--%>

<%-- 부트스트랩 : 모바일 우선 웹프로젝트 개발시 가장인기있따. --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.Date" %>

<html>
<head>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <title>Welcome</title>
</head>
<body>
    <%@ include file="menu.jsp" %>
    <%! String greeting = "웹 쇼핑몰에 오신 것을 환영합니다";
        String tagline = "Welcome to Web Market!" ;%>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">
                <%= greeting %>
            </h1>
        </div>
    </div>
    <div class="container">
        <div class="text-center">
            <h3>
                <%= tagline %>
            </h3>
            <%
                response.setIntHeader("Refresh", 5);
                Date day = new Date();
                String am_pm;
                int hour = day.getHours();
                int minute = day.getMinutes();
                int second = day.getSeconds();
                if (hour / 12 == 0){
                    am_pm = "AM";
                }else{
                    am_pm = "PM";
                    hour -= 12;
                }
                String CT = hour + ":" + minute + ":" + second + " " + am_pm;
                out.println("현재 접속 시각: " + CT + "\n");

            %>
        </div>
        <hr>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>

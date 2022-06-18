<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-11
  Time: 오후 5:58
  To change this template use File | Settings | File Templates.
--%>

<%--implicit object(내장객체)
    서블릿으로 번역될 때, JSP 컨테이너가 자동으로 각종 참조변수로 포함시켜줌 (별도의 import문 없이 사용가능)
    - request
        - 가장많이 사용되는 객체
        - text input의 경우 입력안하면 빈문자열 전달
        - radio, check 경우 입력안하면 파라미터 자체가 전달되지 않음
        - 받기 전, request.setCharacterEncoding("UTF-8") 해줘야 한글입력 정상처리 가능!
        - 요청 HTTP 헤더 관련
            - getHeader
            - getIntHeader
            - getHeaders
            - getCookies() // 쿠키도 request 안에 있는것이다!
        - 브라우저 / 서버 관련
            - getRemoteAddr : 브라우저 IP
            - getContentLength : 브라우저의 요청파라미터 길이
            - getProtocol / Method : GET, POST, 요청 프로토콜 등등..
            - getRequestURI : 브라우저가 요청한 URI
            - getContextPath : 현재 JSP페이지의 웹 애플리케이션 콘텍스트 경로 가져옴
            - getServerName/Port 등등...
            - getQueryString : ?뒤로 이어지는 쿼리문 가져옴
    - response
        - 요청처리결과를 서버 -> 브라우저로 전달하는 객체
        - 페이지 이동방식
            - forward
                - 이동할 URL로 요청정보를 그대로 전달
                - 처음 요청한 URL이 나타나기 때문에 이동여부를 알 수 없음
            - redirect
                - 새로운 요청을 생성 - 최초 요청정보는 유효하지 않음
                - 이동한 URL 주소가 나타남
                response.sendRedirect
        - 응답 HTTP 헤더 관련
            - 서버가 브라우저에게 추가하는 정보
            - 주로 서버에 대한 정보
            - ~~Header, Cookie 관련 메서드들
        - 응답 콘텐츠 관련
            - setContentType
            - setCharacterEncoding
            - sendError // 호출되면 오류페이지가 뜬다
            - setStatus(응답할 HTTP 코드)
    - out
        - 표현문태그와 같은 결과
        - clear() : 현재 출력버퍼 전송하지 않고 비움. 이미 flush되었다면 IOException
        - clearBuffer() :  clear()와 동일. but 오류는 발생하지 않음
    - session
    - application
        - 웹 어플리케이션의 콘텍스트 정보
    - pageContext
        - JSP페이지의 정보
    - page
        - JSP페이지 자체를 나타냄
    - config
        - JSP페이지 설정정보
    - exception
        - JSP페이지 예외발생 처리
    서블릿에서의 위치
        - _jspService() 메소드 내부에 전부 들어가있음
        - request랑 response는 참조변수로 들어오고, 나머지는 메소드 내 지역변수임. 예를들어, page = this 로 되어있음.
    속성관리
        - 모든 내장객체는 JSP 컨테이너가 관리하는 객체임
        - request, session, application, pageContext를 이용하면 속성 관리 가능
            - scope
                - page : pageContext객체. 해당페이지가 서비스를 제공하는동안 유효
                - request : request객체. 클라이언트 요청이 처리되는동안 유효
                - session
                - application : 웹 애플리케이션이 실행되고있는동안 유효
        - 속성관리란 내장객체가 존재하는 동안 JSP페이지 사이 정보교환, 공유에 사용됨
            - setAttribute()
            - getAttribute()
            - removeAttribute()
            - getAttributeName() : pageContext는 미제공





--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        Enumeration en = request.getHeaderNames();
        while (en.hasMoreElements()){
            String name = (String)en.nextElement();
            String value = request.getHeader(name);
            out.print(name + " : " + value + "<br/>");
        }

        response.setIntHeader("Refresh", 5); // 요렇게 하면 5초마다 자동갱신된다.
        out.print(new java.util.Date() + "<br/>");
    %>
</body>
</html>

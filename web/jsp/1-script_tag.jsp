<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-04-01
  Time: 오전 10:05
  To change this template use File | Settings | File Templates.
--%>

<%-- JSP 주석. container가 무시해서, 서비스되면 html에 남지 않는다. --%>
<!-- Html 주석. 서비스되면 html에 남는다. 심지어 내부의 스크립트태그들까지 모두 컴파일된다. -->

<%-- 스크립트 태그
    HTML에 Java코드 삽입하는 것.

    종류
        - declaration(선언문) <%! %> : 변수나 메소드 정의
        - scriptlet(스크립틀릿) <% %> : 자바 로직코드
        - expression(표현문) <%= %> : 표현식 문자열로 출력

    처리과정
        - index.jsp 를 작성하면 컨테이너가 servlet으로 변환한다. (Tomcat ROOT\work\Catalina\localhost\ROOT\org\apache\jsp\에 저장)
        - index_jsp.java 와 index_jsp.class 로 저장된다.

        - 선언문태그의 내용은 index_jsp 클래스의 멤버가 되도록 복사된다. -> 즉, 한 jsp 파일 내에서 전역변수가 된다.
            - 따라서 어디에든 선언 가능하고, 나중에 선언해도 스크립틀릿에서 사용가능하다.
            - 또 무슨말이냐면, 모든 클라이언트가 공유한다는 뜻이다.
        - 스크립틀릿태그 내용은 index_jsp 클래스 내부의 _jspService() 함수 내부에 복사된다.
        - 표현문태그의 내용은 _jspService() 내부에서 out.print()의 매개변수영역에 복사된다. (그래서 ; 사용하면 안된다.)

--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-04-01
  Time: 오전 10:07
  To change this template use File | Settings | File Templates.
--%>

<%-- 디렉티브 태그
    JSP 페이지에 대한 정보를 container에 전달. -> 어떻게 처리할것인지? 전달

        - JSP를 수정하여 재컴파일시에만 역할 수행하므로, 개별 HTML응답에는 영향 미치지 않음
        - 일반적으로 JSP 최상단에 선언하는 것을 권장.

        - <%@ page 속성1="값1" [속성2="값2"]... %> : 페이지에 대한 정보 설정
            - 한 속성마다 개별적으로 설정해 줄 수도 있다.
            - language : 사용할 프로그래밍 언어. 기본값 = java. 향후 컨테이너가 다른 언어 지원할 수 있게 하기 위한 것. JSP는 자체적으로
                java를 지원하므로 생략가능.
            - contentType : 생성할 문서의 콘텐츠유형. text/html. text/plain, text/xml 등 자주 사용하며, html페이지는 사용할 필요 없음.
                - JSP페이지 전체 인코딩 변경에도 사용. "text/html; charset=utf-8"
                - 예시로, application/msword 하면 워드파일로 저장된다. (url 접속 시 파일 다운로드된다.)
                - 예시로, text/xml 하면, <xml></xml> 사이에 모든 html이 그대로 들어간다. (랜더링되지 않고, 마크업이 그대로 보임)
            - pageEncoding : ISO-8859-1. contentType에서의 설정과 동일기능을 한다.
            - import : 사용할 java class. 여러개 설정 가능하다.
                - import="java.io.*, java.lang.*" 혹은 import 자체를 여러번 해줄수도 있다.
            - session : 세션 사용여부. true
                - true이면 JSP내장객체 session을 사용할 수 있다.
                - 일반적으로 사용자가 웹애플리케이션 데이터 가져와 확인할 권한 부여받기 위해 사용 (로그아웃할때까지 모든 데이터에 접근가능)
            - buffer : 출력버퍼크기 설정. 일반적으로 8KB(서버 고유)
                - none 설정시 출력버퍼 채우지 않고 웹브라우저로 직접 보낸다. ?? 언제쓰나
                - 크기 설정시, 완료되거나, 버퍼 가득차지 않는 이상 브라우저에 전송하지 않음.
            - autoFlush : 출력버퍼 동작제어. true
                - false 시 버퍼가 가득찰 때 overflow 예외발생 ?? 언제쓰나
            - isThreadSafe : 멀티스레드 허용여부. true
                - 요청이 동시에 들어왔을때 동시처리할지 순차처리할 지 결정하는 것.
            - info : 현재 페이지에 대한 설명 저장
                - 개발자가 페이지기능 이해에 도움준다.
                - 주석기능과 같아, 컨테이너는 info속성을 무시한다.
                - Servlet의 getServletInfo()에 리턴값으로 복사된다.
            - errorPage : 현재 페이지에 오류 발생 시 보여줄 오류페이지
                - 미설정시 서버가 기본제공하는 오류페이지 사용.
            - isErrorPage : 오류페이지여부. false
                - false 이면 예외처리용 내장객체 exception을 사용할 수 없다.
                - exception.printStackTrace(new java.io.PrintWriter(out));
            - isELIgnored : 표현언어(EL) 지원여부. false
                - true이면 표현언어의 표현식 ${}를 사용할 수 없다. 따라서 정적 텍스트로 처리된다.
                - <% request.setAttribute("RequestAttribute", "~~~" ); %>
                - ${requestScope.RequestAttribute} 같이 사용할 수 있다. ?????
            - isScriptingEnabled : 스크립트태그 사용여부
                - false일때 사용하면 번역오류 발생.

        - <%@ include file="파일명" %> : 특정영역에 다른문서 포함
            - html, jsp, txt 등..
            - 어디에든 선언가능
            - 서블릿으로 번역하기 전 복사됨.
            - 머리글, 바닥글 같은 공통부분을 별도의 JSP파일로 만들어 모듈화한다.

        - <%@ taglib uri="경로" prefix="태그 식별자" %> : 사용할 태그 라이브러리 설정
            - EL, JSTL, custom tag 등의 태그라이브러리 설정
            - ex) <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            - <c:out value="JSTL Core 태그 라이브러리" /> -> (전체경로대신 prefix 사용.)
            - JSTL : 유용한 JSP태그의 모음. 자주사용되는 핵심기능 제공
                - 반복문, 조건문 같은 논리적구조작업
                - XML 문서 조작
                - 국제화태그 조작
                - SQL 조작 등,,
                - WebContent\WEB-INF\lib\ 에 jstl.jar 이 있어야 함. Apache Standard Taglib에서 다운가능
                - 사이트에 가서 readme.txt를 읽어보시라.. maven일때는 어떻게 설치하는지.. 등등.. 다 나와있다.
                - CORE LIBRARY
                    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                - XML LIBRARY
                    < %@ taglib 접두어="x" uri="http://java.sun.com/jsp/jstl/xml" %>
                - FMT 라이브러리
                    <%@ taglib 접두어="fmt" uri="http://java.sun .com/jsp/jstl/fmt" %>
                - SQL 라이브러리
                    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
                - 기능 라이브러리
                      <%@ taglib 접두어 ="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                - jar 파일 3개를 WEB-INF/lib에 넣은 후, IntelliJ경우 추가로 Library 추가도 해주어야 한다.
                - 프로젝트 속성 들어가서, Library하나 만들어서 jar3개 추가한 후, 종속성을 추가해준다.
                - <c:forEach var="k" begin="2" end="10" step="2"> 짝수 찍기 예제
                      <c:out value="${k}" />
                  </c:forEach>
                -
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>

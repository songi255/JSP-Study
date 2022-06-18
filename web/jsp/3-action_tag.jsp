<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-04-01
  Time: 오전 10:07
  To change this template use File | Settings | File Templates.
--%>

<%-- 액션태그
    Clinet / Server에 어떤 작동을 행하도록 명령하는 XML 형태의 태그
    - JSP 사이에서 제어를 이동할 수도 있다.
    - 다른 페이지 실행결과를 현재 페이지에 포함
    - Java beans 등.
    - 스크립트 태그로 JSP페이지에 직접 Java 코드 사용하는 것을 피하기 위해 사용한다.
    - <jsp: ... /> 같이 XML 형식을 사용한다. 반드시 끝나는태그 /로 끝내야 함.

    - <jsp:forward page="파일명 />
        - 페이지흐름 제어
        - JSP 컨테이너는 이 태그를 만나면, 이전까지 출력버퍼에 저장되었던 내용 모두 삭제후, 해당 파일로 제어 이동
            - "삭제"이다. 즉, 이전 페이지는 전송되지 않고, 바뀐 페이지만 전송된다. (제어가 이동해버려서, 원래 페이지로 돌아가지 않으니,)
               뒷부분도 출력되지 않는다.
            - forward 전에 버퍼가 가득차면 일부분이 응답될 수 있으므로, 큰 출력의 페이지에서는 신중해야 한다.
            - 브라우저의 주소란은 처음파일 그대로이다.
    - <jsp:include page="파일명" flush="false" />
        - HTML, JSP, Servlet Page 등 추가가능
        - flush는 false가 좋다. true일 경우, 제어 이동할 떄 출력버퍼를 브라우저에 보내고 이동한다. 헤더가 전송되면 나중에 추가해도 반영
          되지 않는다.
        - false 시 기존 출력버퍼에 추가로 저장된다.
        - 현재 JSP페이지로 제어를 다시 반환하는 것이 가장 큰 차이점이다.
        - 주소란은 처음 페이지 그대로이다.
        - 디렉티브 태그 include와의 차이
            - jsp:include
                - 요청시의 자원 포함
                - request, param 액션태그 이용하여 파라미터 전달
                - 용도 : 화면 레이아웃의 일부분 모듈화에 주로 사용
                - 동적 페이지에 사용
            - include
                - 번역시 자원을 포함
                - 페이지 내 변수 선언 후 값 저장
                - 다수의 JSP웹페이지에서 공통으로 사용되는 코드 / 저작권 같은 문장 포함하는 경우 사용
                - 정적 페이지에 사용
    - <jsp:useBean />
        - 자바빈즈 설정
            - 자바빈즈란?
                - HTML과 로직을 분리하기 위해, 로직부분 코드에 사용하는 클래스
                - 데이터 표현이 목적
                - 멤버변수인 property와 getter, setter로 구성
                - 작성 규칙
                    - Serializable 구현
                    - 기본생성자 있어야 함
                    - 모든 property는 private
                    - 모든 property는 Getter, Setter 존재
                - 이렇게 작성된 Beans를 useBean 으로 끌어와서 사용
                - 폼페이지 입력, HTML request 데이터를 쉽게 빈즈객체로 저장가능
        <jsp:useBean id="beans변수이름" class="com.dto.MemberBean" scope="page">
            - class : 패키지 이름 포함
            - scope : page(기본), request, session, application
            - request.setAttribute("member", member) 와 같음
    - <jsp:setProperty />
        - 자바빈즈
        - 속성
            - name : 자바빈즈 id
            - property : 자바빈즈 프로퍼티 이름. *을 사용하면 모든 요청파라미터가 빈즈에 저장
            - value : 변경할 값. null이거나, 존재하지 않으면 무시됨
            - param : 값이 전달되는 요청파라미터 이름. value와 param 중 하나를 택1해서 사용. (동시사용불가)
            만약 <input name="id" value="admin">으로 request에 왔다면, 별다른 저장 없이
            <jsp:setProperty name="member" property="id" /> 하면 매칭되서 저장된다. 만약 이름이 다를 경우
            param="userID" 같이, input태그 name을 추가한다.
            만약, input이 여러개인데, 여러 property가 모두 이렇게 일치한다면 property="*"로 적어주면 자동매치된다.

    - <jsp:getProperty />
        - 자바빈즈
        - 속성
            - name
            - property : *사용 시 모두 getter 호출된다는데 몰?루 ????
    - <jsp:param />
        - forward, include, plugin 태그에 인자추가
        - 다른 페이지에 정보를 전달하는 태그
        - 단독으로 사용되지 못함
        - 여러개 전송 시 다중 param 태그 사용가능
        - <jsp:forward page="">
            <jsp:param name="name1" value="value1" /> // request 객체로 전달된다.
            <jsp:param name="name2" value="value2" />
          </jsp:forward>
        -
    - <jsp:plugin />
        - 브라우저에 Java applet 실행.
        - Java 플러그인에 대한 OBJECT 또는 EMBED 태그 만드는, 브라우저별 코드 생성
    - <jsp:element />
        - 동적 XML요소 설정
    - <jsp:attribute />
        - 동적 XML요소 속성 설정
    - <jsp:body />
        - 동적 XML요소 몸체 설정
    - <jsp:text />
        - JSP페이지 혹은 문서에서, 템플릿텍스트 작성

--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:useBean id="date" class="java.util.Date" />
    <p><%
            out.print("오늘의 날짜 및 시각");
        %>
    </p><%=date%>>

</body>
</html>

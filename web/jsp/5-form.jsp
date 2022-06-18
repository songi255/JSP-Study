<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-11
  Time: 오후 9:32
  To change this template use File | Settings | File Templates.
--%>
<%--폼
    구성
        - form : 폼 정의하는 최상위 태그
            - 사용자가 다양한 정보를 입력하고 서로 전달할때 사용하는 태그
            - 단독으로 쓰이지 않음
            - action : 폼 데이터를 받아 처리할 URL
            - method : 기본 get
                - 쿼리스트링으로 전달. actionURL?name1=value&name2=value 같이 여러개인 경우 &로 구분
                - Get vs Post
                    - Get
                        - 보안 필요없이 읽을 떄 사용
                        - 전송량 제한 4096 B
                        - 속도가 빠름
                    - Post
                        - 지정 리소스에서 데이터 처리할 때 (쓰기, 수정, 삭제) 사용
                        - HTTP 헤더에 감춰 전송
                        - 전송량 제한 없음
                        - 속도 느림
            - name : 폼 식별용 이름
            - target : 폼 처리결과의 응답을 실행할 프레임 설정 ?????
            - enctype : 폼 MIME 유형
            - accept-charset : 폼 전송에 사용할 인코딩
        - select : 항목을 선택할 수 있는 태그
            - 목록상자 태그
            - 속성
                - name
                - size : 한번에 표시할 항목개수
                - multiple : 다중선택 가능 (Ctrl누른 채로 다중선택)
            - 예시
            <select>
                <option> 항목 </option>
                <option> 항목 </option>
                <optgroup label="서울특별시"> -> optgroup으로 그룹화하여 선택할 수 있다!
                    <option> 항목 </option>
                </optgroup>
            </select>
            - option 태그 속성
                - value : 항목의 값
                - selected : 초기값
                - disabled : 항목 비활성화
        - input : 사용자가 입력할 수 있는 태그
            - 종료태그 생략가능
            - type
                - hidden : 보이지 않게 숨겨서 값을 전송
                - radio, checkbox의 경우 name속성을 같게 해서 나열하면 됨.
                - checkbox
                    - value 지정하지 않으면 "on", null 로 request에 전달됨.
                    - name을 같게 하면, request.getParameterValues로 String[] 로 일괄적으로 받을 수 있음.

            - name : 입력양식 식별이름
            - value : 입력양식의 초기값
            - 그 외 속성
                - readonly : 읽기전용 지정
                - maxlength : type="text"일때만 사용. 최대 입력글자수
                - size : type="text"에만 사용. 입력양식 너비
                - disabled
                - checked type="checkbox", "radio"에만 사용
                - HTML5 추가
                    - required : 필수태그
                    - autofocus : 페이지 로딩되자마자 포커스 가짐
                    - placeholder : 입력양식 힌트 설정
                    - pattern : 정규식으로 입력겁사
        - textarea : 여러 줄 입력
            - 가장 큰 특징은, 태그에 입력한 기본값의 태그와 띄어쓰기가 그대로 출력된다.
            - 속성
                - cols : 가로크기
                - rows
                - wrap : 줄바꿈 설정
                    - off : 줄바꿈 안함. 수평스크롤바 생겨서 옆으로 계속 문장이 이어짐
                    - soft : 텍스트라인 끝에서 자동개행
                    - hard : 자동개행 + 실제로 캐리지리턴 문자 전달
        -



--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>

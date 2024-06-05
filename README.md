<JSP교재 0장 참고>
자바 home, path 설정
톰캣설정
이클립스설정(workbench 새로운 거 만들기-files->switch workspace)


*workspace 변경 시, 글자크기나 테마색 변경은 새로 해줘야함
글자크기:window-preference-general-appearance-color and fonts-basic-text font-edit-글자크기 조정 후 apply and close
배경색:window-preference-appearance-dark

*jsp파일이 servlet 파일로 변환된 파일 위치
C:\workspace_jsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\MustHaveJSP\org\apache\jsp

<% %><%= >_jspService()메서드 내부 method  (예)HelloJSP 
<%! %>  _jspService()메서드 외부  (예)IncludeMain

<%= %> 리턴값이 있을 때 (void가 아닐 때) (예)<%= addresult %><%= add(20,30) %>
<% out.println("");%> 


교재는 tomcat이라는 서블릿 컨테이너를 이용/http://localhost:8080 이용

===================================================================
1장
#지시어 <%@ page 속성%>
속성 ) language, contentType, pageEncoding ,import, errorPage , isErrorPage,buffer, autoFlush ,include

errorPage.jsp파일에서 지시어 errorPage="isErrorPage.jsp" 
isErrorPage.jsp파일에서 지시어 isErrorPage="true" /함수body 에서 <%=exception.getMessage() %>

#스크립트 요소
선언부:멤버 변수나 메서드 선언/<html>태그 전에 선언
<%! %>

표현식:멤버 변수나 메서드 출력 및 호출
<%= %>
예) 덧셈 결과 (표현식 변수) : <%= addresult %> <br />  덧셈 결과 (메소드 호출) : <%= add(20,30) %> <br />

#	문자열로 입력받아 정수로 변환
dan = Integer.parseInt(request.getParameter("dan"));

예) http://localhost:8080/MissionJSP/gugudan1.jsp   ->에러발생
  http://localhost:8080/MissionJSP/gugudan1.jsp?dan=2  ->실행
 http://localhost:8080/MissionJSP/gugudan1.jsp?name](http://localhost:8080/MustHaveJSP/01DirectiveScript/ScriptElements_trycatch.jsp?num1=200&num2=100       ->입력 여러개일 때 &로 연결 (?  &   &  )

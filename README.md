jsp파일 주석 ctrl shift c

java resources에 저장한 class import 하기
<%@ page import = "utils.CookieManager" %>


mysql 3306
tomcat 80
===========================
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

===========================
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
 ===========================
 2장 내장객체
 <%! %>은   public void _jspService()외부에 있기에 매개변수를 필요로 함

<% %><%= %>은 public void _jspService()내부에 있기에 별도로 선언하거나 객체로 생성하지 않아도 즉시 사용할 수 있음
 public void _jspService()내부 내장 메서드가 있어서
final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;  

***<@! @>은  _jspService() 외부에 있다. 
외부에서 바로 사용은 불가능하다.  _jspService내부에서 함수를 호출해야 한다.
<%! 
	public String useImplicitObject(){
		return this.getServletContext().getRealPath("/02ImplicitObject");
	}
	
	public String useImplicitObject(ServletContext app){
		return app.getRealPath("/02ImplicitObject");
	}
%>

public void _jspService(){

  final jakarta.servlet.ServletContext application; # 자동으로 생성된다.

 useImplicitObject();
 useImplicitObject(application);
}


get: 쿼리스트링이 url에 있음
post : 쿼리스트링이 url에 없음
         민감한 정보/보내는 정보 사이즈가 큰 경우

URL				        http://localhost:8080/MustHaveJSP/02ImplicitObject/RequestWebInfo.jsp
URI  URL에서 프로토콜/서버명 서버포트 제외 /MustHaveJSP/02ImplicitObject/RequestWebInfo.jsp



같은  name인 경우 ,radio button 은 1개만 선택
check button은  여러개 선택/같은  name인 경우 ,check button은 배열로 넘어온다.
textarea는 \n으로 여러 줄 쓸 수 있다.


jsp war file 만들고 배포(with tomcat)
만드는 방법 : project-exprt-war file -바탕화면에 파일 위치 저장
배포 :01.developkits-apache-tomcat-10.1.24-webapps 에 바탕화면에 파일 위치 저장된 war 파일 옮기기
서버의 물리적 경로 얻어오기 :  01.developkits-apache-tomcat-10.1.24-bin에서 주소창 클릭하고 cmd 입력
			cmd 열리고 cd 되었으면 dir *.bat
			startup.bat
			브라우저에서 http://localhost:8080/MustHaveJSP/02ImplicitObject/ApplicationMain.jsp 접근해보면 물리적경로가 다름을 확인할 수 있음
서버의 물리적 경로 얻어오기
application 내장 객체 : C:\01DevelopKits\apache-tomcat-10.1.24\webapps\MustHaveJSP\02ImplicitObject

*ip 찾기
cmd 에서 ipconfig -링크-로컬 IPv6 주소

status code (https://www.rfc-editor.org/rfc/rfc9110.html#section-15.5.4)
4xx 클라이언트 오류
5xx 서버 오류

 ===========================
 4장 쿠키
<script />태그를 만들어서 내장객체out을 이용하여 브라우저에 바로 출력하기
public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script=""
							+ "<script>"
							+"   alert('" + msg + "');"
							+"   location.href='" + url +" ' ; "
							+ "</script>";
			out.println(script);
		}
		catch (Exception e) {}
	}

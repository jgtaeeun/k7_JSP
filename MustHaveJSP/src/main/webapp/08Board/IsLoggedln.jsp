<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "utils.JSFunction" %>
<!-- 로그인 정보가 없을 떄 로그인 페이지로 이동시키는 페이지 -->
<%
if (session.getAttribute("UserId")==null){
	JSFunction.alertLocation("로그인 후 이용해주십시오.", "../06Session/LoginForm.jsp", out);
	return;  //특정한 조건에서 실행을 멈추고 싶을 때는 반드시 return문을 써줘야함
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "membership.MemberDAO" %>
<%@ page import = "membership.MemberDTO" %>
<%
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");

String MySQLDriver = application.getInitParameter("MySQLDriver");
String MySQLURL = application.getInitParameter("MySQLURL");
String MySQLId = application.getInitParameter("MySQLId");
String MySQLPwd = application.getInitParameter("MySQLPwd");

MemberDAO dao = new MemberDAO(MySQLDriver,MySQLURL,MySQLId,MySQLPwd);
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
dao.close();

if (memberDTO.getId() != null){
	session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserName", memberDTO.getName());
	response.sendRedirect("LoginForm.jsp");
}
else {
	request.setAttribute("LoginErrMsg" , "로그인 오류입니다.");
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
}
%>


<%@ page import= "java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 영역</title>
</head>
<body>
	<h2>페이지 이동 후 session영역의 속성 읽기</h2>
	<%
	ArrayList <String> lists = (ArrayList <String>) session.getAttribute("lists");
	for (String s : lists)
		out.print(s + "<br />");
	%>
</body>
</html>
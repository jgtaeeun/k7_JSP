
<!-- isErrorPage만 실행시 에러난다.
java.lang.NullPointerException: Cannot invoke "Object.getClass()" because "exception" is null -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"%>  <!-- exception을 받아옴 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지시어 -errorPage , isEooroPage 속성</title>
</head>
<body>
	<%
		String errname = exception ==null ? "noerr" : exception.getClass().getName();
		String errmsg = exception ==null ? "noerr" : exception.getMessage() ;
	%>
	<h2>서비스 중 일시적인 오류가 발생하였습니다.</h2>
	<p>
		오류명 :  <%= errname %> <br />
		오류메시지 : <%= errmsg %>
	</p>
	
</body>
</html>
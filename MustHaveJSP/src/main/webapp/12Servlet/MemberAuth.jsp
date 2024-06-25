<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberAuth.jsp</title>
</head>
<body>
	<h2>MVC 패턴으로 회원인증하기</h2>
	<P>
		<strong>${authMessage }</strong>
		<br />
		<a href = "./MemberAuth.mvc?id=nakja&pass=1234">회원인증(관리자)</a>
		&nbsp;&nbsp;
		<a href = "./MemberAuth.mvc?id=musthave&pass=1234">회원인증(회원)</a>
		&nbsp;&nbsp;
		<a href = "./MemberAuth.mvc?id=stranger&pass=1234">회원인증(비회원)</a>
	</P>
	
	<form method="post" action="./MemberAuth.mvc">
	id : <input type="text" name="id" value=""/> <br />
	pw : <input type="password" name="pass" value="" /> <br />
	<input type="submit" value="제출" />
 	</form>
</body>
</html>
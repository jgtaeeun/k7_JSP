<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 Form.jsp</title>
</head>
<body>
	<h2>구구단 Form</h2>
	<form action="gugudanVersion.jsp" method="post">
	<input type ="radio" name ="sel" value = "gugudan1.jsp"/> Type1
	<input type="text" name ="dan" value =""/>단
	<br />
	
	<input type ="radio" name ="sel" value = "gugudan1_1.jsp"/>Type2
	<input type ="radio" name ="val" value = "hor"/>Horizontal
	<input type ="radio" name ="val" value = "ver"/>Vertical

	<br />
	
	<input type ="radio" name ="sel" value="gugudan2.jsp"/>Type3
	<input type="text" name ="col" value =""/>열
	
	<br />
	<input type ="submit" value ="선택" />
	</form>
</body>
</html>
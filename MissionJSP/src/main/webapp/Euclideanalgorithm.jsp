<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Euclidean algorithm</title>
</head>
<body>
	<h2>최대공약수, 최소공배수 구하기</h2>
	
	<form name=inputvalue>
	숫자 1 :<input type="text" name="num1" value="" /> <br />
	숫자 2 :<input type="text" name="num2" value="" /> <br />
	최대공약수 :<input type="text" name="maxval" value=""  /> <br />
	최소공배수 :<input type="text" name="minval" value="" /> <br />
	<input type ="submit" value ="선택" />
	</form>
	<%
	int n1=Integer.parseInt("num1");
	int n2=Integer.parseInt("num2");
	int maxval=0;
	int minval=0;
	if (n1>=n2){
		if (n1%n2==0) {maxval=n2; minval=n1*n2/maxval;}
	}
	else {
		if (n2%n1==0) {maxval=n1; minval=n1*n2/maxval;}
	}

	%>
</body>
</html>
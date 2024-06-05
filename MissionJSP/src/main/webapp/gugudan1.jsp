<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%! public int multi(int num1, int num2){
		return num1 * num2;
} 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단</title>
</head>
<body>
<%
	int dan;
	try{
		dan = Integer.parseInt(request.getParameter("dan"));
		
		for (int i =0 ; i<10 ; i ++){
		
			out.print(dan+ "*" +i + "=" + multi(dan, i) + "<br />");
		}
	}
	catch (Exception e){
		out.println("입력값이 없습니다.<br />"); 
		dan=0;
	
	}
%>
  
</body>
</html>
<!-- num1, num2 입력 받아서 연산결과 출력하기
num1,num2가 null이기에 에러발생
http://localhost:8080/MustHaveJSP/01DirectiveScript/ScriptElements_trycatch.jsp?num1=200&num2=100   
?num1=정수%num2=정수
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
 public int add(int num1, int num2){
	return num1+num2;
}

public int sub(int num1, int num2){
	return num1-num2;
}

public int multi(int num1, int num2){
	return num1*num2;
}

public int div(int num1, int num2){
	return num1/num2;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 요소</title>
</head>
<body>
<%
	
	int addresult;
	int subresult;
	int multiresult;
	int divresult;
	
	try {
	
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 =Integer.parseInt(request.getParameter("num2"));
	addresult=add(num1,num2);
	subresult=sub(num1,num2);
	multiresult=multi(num1,num2);
	divresult=div(num1,num2);
	
	}
	catch (Exception e){
		out.println("예외 발생 : 매개변수 num1, num2 가 null 입니다. <br />  ");
		addresult=0;
		subresult=0;
		multiresult=0;
		divresult=0;
	}
%>
	덧셈 결과 (표현식 변수) : <%= addresult %> <br />  
	뺄셈 결과(표현식 변수) : <%= subresult %> <br />  
	곱셈 결과  (표현식 변수) : <%= multiresult %> <br /> 
	나눗셈 결과  (표현식 변수) : <%= divresult %> <br /> 
	
	
</body>
</html>
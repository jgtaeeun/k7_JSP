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
	int addresult=add(10,20);int subresult=sub(10,20);
	int multiresult=multi(10,20);int divresult=div(10,20);
	%>
	덧셈 결과 1 (표현식 변수) : <%= addresult %> <br />  덧셈 결과 2 (표현식 메서드 호출) : <%= add(20,30) %> <br /> 
	뺄셈 결과 1 (표현식 변수) : <%= subresult %> <br />  뺄셈 결과 2 (표현식 메서드 호출) : <%= sub(20,30) %> <br /> 
	곱셈 결과 1 (표현식 변수) : <%= multiresult %> <br />  곱셈 결과 2 (표현식 메서드 호출) : <%= multi(20,30) %> <br /> 
	나눗셈 결과 1 (표현식 변수) : <%= divresult %> <br />  나눗셈 결과 2 (표현식 메서드 호출) : <%= div(20,30) %> <br /> 
	
</body>
</html>
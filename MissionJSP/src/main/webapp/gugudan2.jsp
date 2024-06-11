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
		int col= Integer.parseInt(request.getParameter("col"));
		
		switch(col){
		case 1: //1열로 2단부터 9단 출력    gugudna1_1.jsp의 ver 가져오기
				for (int k=2; k<= 9 ; k++){
					for (int j=1 ; j<=9 ; j++){
						out.print(String.format("%4d * %4d = %4d", k, j, multi(k, j)));
						out.print("<br />");
					}
					out.print("<br />");
				}
				
			
			break;
			
		case 2: //2열로 2단부터 9단 출력
			for (int i =2 ; i<=9 ; i=i+2){
				for (int j=1 ; j<=9 ; j++){
						out.print(String.format("%4d * %4d = %4d", i, j, multi(i, j)));
						out.print(String.format("%4d * %4d = %4d", i+1, j, multi(i+1, j)));
						out.print("<br />");
				}
				out.print("<br />");
			}
			
			break;
			
			
		case 3://3열로 2단부터 9단 출력
			for (int i =2 ; i<=9 ; i=i+3){
				for (int j=1 ; j<=9 ; j++){
						out.print(String.format("%4d * %4d = %4d", i, j, multi(i, j)));
						out.print(String.format("%4d * %4d = %4d", i+1, j, multi(i+1, j)));
						if (i+2 != 10) out.print(String.format("%4d * %4d = %4d", i+2, j, multi(i+2, j)));
						out.print("<br />");
				}
				out.print("<br />");
			}
			
			break;
			
		case 4://4열로 2단부터 9단 출력
			for (int i =2 ; i<=9 ; i=i+4){
				for (int j=1 ; j<=9 ; j++){
						out.print(String.format("%4d * %4d = %4d", i, j, multi(i, j)));
						out.print(String.format("%4d * %4d = %4d", i+1, j, multi(i+1, j)));
						out.print(String.format("%4d * %4d = %4d", i+2, j, multi(i+2, j)));
						out.print(String.format("%4d * %4d = %4d", i+3, j, multi(i+3, j)));
						out.print("<br />");
				}
				out.print("<br />");
			}
			
			break;
		
		case 5://5열로 2단부터 9단 출력
			for (int i =2 ; i<=9 ; i=i+5){
				for (int j=1 ; j<=9 ; j++){
						out.print(String.format("%4d * %4d = %4d", i, j, multi(i, j)));
						out.print(String.format("%4d * %4d = %4d", i+1, j, multi(i+1, j)));
						out.print(String.format("%4d* %4d = %4d", i+2, j, multi(i+2, j)));
						if (i+3 != 10) out.print(String.format("%4d * %4d = %4d", i+3, j, multi(i+3, j)));
						if (i+4 != 11) out.print(String.format("%4d * %4d = %4d", i+4, j, multi(i+4, j)));
						out.print("<br />");
				}
				out.print("<br />");
			}
			break;
			
		case 6://6열로 2단부터 9단 출력
			for (int i =2 ; i<=9 ; i=i+6){
				for (int j=1 ; j<=9 ; j++){
						out.print(String.format("%4d * %4d = %4d", i, j, multi(i, j)));
						out.print(String.format("%4d * %4d = %4d", i+1, j, multi(i+1, j)));
						if (i+2 != 10) out.print(String.format("%4d * %4d = %4d", i+2, j, multi(i+2, j)));
						if (i+3 != 11) out.print(String.format("%4d * %4d = %4d", i+3, j, multi(i+3, j)));
						if (i+4 != 12) out.print(String.format("%4d * %4d = %4d", i+4, j, multi(i+4, j)));
						if (i+5 != 13) out.print(String.format("%4d * %4d = %4d", i+5, j, multi(i+5, j)));
						out.print("<br />");
				}
				out.print("<br />");
			}
			break;
		case 7://7열로 2단부터 9단 출력
			for (int i =2 ; i<=9 ; i=i+7){
				for (int j=1 ; j<=9 ; j++){
						out.print(String.format("%4d * %4d = %4d", i, j, multi(i, j)));
						if (i+1 != 10) out.print(String.format("%4d * %4d = %4d", i+1, j, multi(i+1, j)));
						if (i+2 != 11) out.print(String.format("%4d * %4d = %4d", i+2, j, multi(i+2, j)));
						if (i+3 != 12) out.print(String.format("%4d * %4d = %4d", i+3, j, multi(i+3, j)));
						if (i+4 != 13) out.print(String.format("%4d * %4d = %4d", i+4, j, multi(i+4, j)));
						if (i+5 != 14) out.print(String.format("%4d * %4d = %4d", i+5, j, multi(i+5, j)));
						if (i+6 != 15) out.print(String.format("%4d * %4d = %4d", i+6, j, multi(i+6, j)));
						out.print("<br />");
				}
				out.print("<br />");
			}
			break;
		case 8://8열로 2단부터 9단 출력
			for (int k=1; k<= 9 ; k++){
				for (int j=2 ; j<=9 ; j++){
					out.print(String.format("%4d * %4d = %4d", j, k, multi(k, j)));
				}
				out.print("<br />");
			}
			break;
		default : out.println("입력값이 없습니다.<br />"); 
			
		}
	
	%>
		
	
	

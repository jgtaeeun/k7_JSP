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
	String dir;
	try{
		dir =request.getParameter("dir");
		
		
		if (dir.equals("ver")){
			for (int i=2 ; i<=9 ; i++){
				for (int j=1 ; j<=9 ; j++){
					out.print(String.format("%d * %d = %d <br />", i, j, multi(i, j)));
					
				
				}
			}
		}
		else if (dir.equals("hor")){
			for (int i=1 ; i<=9 ; i++){
				for (int j=2 ; j<=9 ; j++){
					out.print(String.format("%d * %d = %d ", j, i, multi(i, j)));
					
				
				}
				out.print("<br />");
			}
			
		}
		
	}
	catch (Exception e){
		
		out.println("입력값이 없습니다.<br />"); 
	
	}
%>
  
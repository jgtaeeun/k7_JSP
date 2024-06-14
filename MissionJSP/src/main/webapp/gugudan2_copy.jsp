<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%! public int multi(int num1, int num2){
		return num1 * num2;
} 
<<<<<<< HEAD
=======
	
>>>>>>> c08e606943e43336be24101bf9820da547602395
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단</title>
</head>
<body>
	
	
<<<<<<< HEAD
	<% try{
=======
	<% 
>>>>>>> c08e606943e43336be24101bf9820da547602395
		int col= Integer.parseInt(request.getParameter("col"));
		
		for(int dan=2;dan<=9; dan+=col) {
			for(int i=1;i<=9;i++) {
				for(int j=dan ; j<dan+col && j<=9;j++) {
<<<<<<< HEAD
					out.print(String.format("%2d * %2d = %2d ",j, i, multi(j, i)));
				}
				out.print("<br />");
			}
			out.print("<br />"); 
=======
					out.print(String.format("%2d * %2d = %2d ",j, i, multi(j, i));
				}
				out.print("<br />");
			}
			out.print("<br />");
>>>>>>> c08e606943e43336be24101bf9820da547602395
		}
	}
	catch (Exception e){}
	%>
<<<<<<< HEAD
	
	
=======
>>>>>>> c08e606943e43336be24101bf9820da547602395

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
String sel = request.getParameter("sel");
String dan = request.getParameter("dan");
String dir = request.getParameter("val");
String col = request.getParameter("col");
String url ="http://localhost:8080/MissionJSP/"+sel;




if (sel.equals("gugudan1.jsp"))			url += String.format("?dan=%s", dan);
else if (sel.equals("gugudan1_1.jsp"))	url += String.format("?dir=%s", dir);
else 									url += String.format("?col=%s", col);

response.sendRedirect(url);
	
%>
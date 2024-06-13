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
	
=====================================================

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
String sel = request.getParameter("sel");    # Type1. Type2. Type3
String dan = request.getParameter("dan"); #2~9
String dir = request.getParameter("val");   #hor, ver
String col = request.getParameter("col");   #2~8
String url=null;

if (sel.equals("Type1"))			url = String.format("gugudan1.jsp?dan=%s", dan);
else if (sel.equals("Type2"))	       url = String.format("gugudan1_1.jsp?dir=%s", dir);
else 						url = String.format("gugudan2.jsp?col=%s", col);

request.getRequestDispatcher(url).forward(request, response);
%>

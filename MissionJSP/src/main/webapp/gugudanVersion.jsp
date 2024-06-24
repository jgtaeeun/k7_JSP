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
	
// =====================================================
// ****gugudanForm.jsp
// <h2>구구단 Form</h2>
// 	<form action="gugudanVersion.jsp" method="post">
// 	<input type ="radio" name ="sel" value = "Type1"/> Type1
// 	<input type="text" name ="val" value  =""/>단
// 	<br />
	
// 	<input type ="radio" name ="sel" value = "Type2"/>Type2
// 	<input type ="radio" name ="val" value = "hor"/>Horizontal
// 	<input type ="radio" name ="val" value = "ver"/>Vertical

// 	<br />
	
// 	<input type ="radio" name ="sel" value="Type3"/>Type3
// 	<input type="text" name ="val" value =""/>열
	
// 	<br />
// 	<input type ="submit" value ="선택" />
// 	</form>

// ****gugudanVersion.jsp
// String sel = request.getParameter("sel");    # Type1. Type2. Type3
// String val = request.getParameter("val");   ##2~9/or, ver/~8

// String url=null; String key=null;

// if (sel.equals("Type1"))			
// 	url="gugudan1.jsp";
// 	key="dan";
	
// else if (sel.equals("Type2"))	      	
// 	url="gugudan1_1";
// 	key="dir";


// else 						
// 	url="gugudan2";
// 	key="col";

// request.getRequestDispatcher(url+"?"+key+"="+val).forward(request, response);

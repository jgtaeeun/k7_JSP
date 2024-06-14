<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import = "common.JDBConnect" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ExeQuery2.jsp 실습</title>
</head>
<body>	
	
	<h2>파라미터로 사용자 id를 입력해서 목록 출력</h2>
	<% 
	try{
	String input_id = request.getParameter("input_id");
	JDBConnect jdbc = new JDBConnect();
	
	PreparedStatement pt = jdbc.getCon().prepareStatement("select num, title, content, id, postdate, visitcount from board where id=?");
	pt.setString(1, input_id);
				
	ResultSet rs = pt.executeQuery();
	out.print("<table>");
	out.print("num"+" title"+" content"+" id"+" postdate"+" visitcount");
	while (rs.next()) {
				out.print("<tr>"); 
				out.print(String.format("<td>%s</td>  <td>%s</td>  <td>%s</td>  <td>%s</td>  <td>%s</td>  <td>%s</td>",
				rs.getString("num"), rs.getString("title"),  rs.getString("content"), rs.getString("id"),
				rs.getString("postdate"),rs.getString("visitcount")));
				out.print("</tr>");
				
	}
	
	out.print("</table>");
	jdbc.close();
    
	}
	
	catch(Exception e){
		out.print(e.getMessage());
	}
	%>
</body>
</html>
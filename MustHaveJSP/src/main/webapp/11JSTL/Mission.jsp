<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.List" %>
<%@ page import ="model1.board.BoardDAO" %>
<%@ page import ="model1.board.BoardDTO" %>
<%@ page import ="java.util.Map" %>
<%@ page import ="java.util.HashMap" %>

<%
    
Map<String, Object> param = new HashMap<String, Object>();
String searchField= request.getParameter("searchField");
String searchWord= request.getParameter("searchWord");
if (searchWord != null){
	param.put("searchField",searchField);
	param.put("searchWord",searchWord);
}


//DAO객체를 통해 DB에 DTO 저장
BoardDAO dao = new BoardDAO(application);
List<BoardDTO> bbs = dao.selectList(param);  
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <h4>mysql에서 데이터 가져오기</h4>
    <form method="get">
	<table border="1" width = "90%">
	<tr>
		<td align="center">
			<select name="searchField">
				<option value="title"> 제목 </option>
				<option value="content"> 내용 </option>
			</select>
			<input type="text" name="searchWord" />
			<input type="submit" value="검색하기" />
		</td>
	</tr>
	</table>
	</form>
	
    <table border="1">
   	 <tr>
            <td>num</td>
            <td>title</td>
            <td>content </td>
            <td>id </td>
            <td>visitcount</td>
        </tr>
    <c:forEach items="<%= bbs %>" var="c" >
        <tr>
            <td>  ${dto.setNum("num")}</td>
           <td>  ${ dto.setNum("title")}</td>
            <td> ${dto.setNum("content") }</td>
            <td> ${dto.setNum("id") }</td>
            <td> ${ dto.setNum("visitcount") }</td>
        </tr>
    </c:forEach>
    </table>
</body>
</html>



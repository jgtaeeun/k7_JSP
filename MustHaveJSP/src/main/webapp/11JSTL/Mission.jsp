<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.List" %>
<%@ page import ="model1.board.BoardDAO" %>
<%@ page import ="model1.board.BoardDTO" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
//DAO를 생성해 DB에 연결
BoardDAO dao = new BoardDAO(application);

//사용자가 입력한 검색 조건을 Map에 저장




List<BoardDTO> boardLists = dao.selectAllList();
dao.close();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	
	<!-- 게시물 목록 출력 -->
	<table border="1" width = "90%">
		<tr align="center">
			
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
		
		<c:if test="${ boardLists.isEmpty()}" var="blist">
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다^^*</td>
		</tr>
		
		</c:if>
		
		
		
		
		
		<c:if test="${not blist}" >
		
		<c:forEach items ="<%=boardLists %>" var ="dto" >
		
		<tr align ="center">
						
						<td align="left">${ dto.getTitle()}</td>
						<td align="center">${ dto.getId()}</td>
						<td align="center">${ dto.getVisitcount() }</td>
						<td align="center">${ dto.getPostdate()}</td>
						
						
		</tr>
		
		</c:forEach>
		</c:if>
		
	
	
	
</body>
</html>

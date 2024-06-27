<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
<style>a{text-decoration:none;}</style>
</head>
<body>
	<h2>파일 첨부형 게시판 - 목록 보기(List)</h2>
	
	<form method="get">
	
	<table border="1" width="90%">
		<tr>
			<td align="center">
				<select name="searchField">
					<option value="title" >제목 </option>
					<option value="content" >내용 </option>
				</select>
				<input type="text" name="searchWord" />
				<input type="submit" value="검색하기"/>
				
			</td>
		
		</tr>
	
	</table>	
	</form>
	
	
	<table border="1" width = "90%">
		<tr align="center">
			<th width="10%">번호</th>
			<th width="*">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
			<th width="8%">첨부</th>
		</tr>
		
	<c:choose>
		<c:when test="${ boardLists.isEmpty()}" >
		<tr>
			<td colspan="6" align="center">등록된 게시물이 없습니다^^*</td>
		</tr>
		
		</c:when>
		<c:otherwise>
			<c:forEach items ="${ boardLists }" var ="dto" varStatus="loop" >
				
				<tr align ="center">
						<td>${map.totalCount - (((map.pageNum-1) * map.pageSize)+loop.index)}</td>
						<td align="left"><a href="../mvcboard/view.do?idx=${dto.getIdx()}">${ dto.getTitle()}</a></td>
						<td align="center">${ dto.getName()}</td>
						<td align="center">${ dto.getVisitcount() }</td>
						<td align="center">${ dto.getPostdate()}</td>
						<!-- 첨부파일 -->
						<td>
						<c:if test="${not empty dto.getOfile() }">
							<a href ="../mvcboard/download.do?ofile=${dto.getOfile()}&sfile=${dto.getSfile()}
							&idx=${dto.getIdx()}">[Down]</a>
						</c:if>
						</td>
	
	
				</tr>
		
		</c:forEach>
		
		</c:otherwise>
		
	</c:choose>	
	
	</table>	
	
	<!-- 게시물 목록이 있던 없던 글쓰기 버튼은 출력되어야 함-->
	<table border="1" width="90%">
		<tr align ="center">
		
			<td>${map.pagingImg}</td>
			<td width="100"><button type ="button" onclick="location.href='../mvcboard/write.do';">글쓰기</button></td>
		</tr>
	</table>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.List" %>
<%@ page import ="model1.board.BoardDAO" %>
<%@ page import ="model1.board.BoardDTO" %>
<%@ page import ="java.util.Map" %>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="utils.BoardPage" %>
<%
//DAO를 생성해 DB에 연결
BoardDAO dao = new BoardDAO(application);

//사용자가 입력한 검색 조건을 Map에 저장
Map<String, Object> param = new HashMap<String, Object>();
String searchField= request.getParameter("searchField");
String searchWord= request.getParameter("searchWord");
if (searchWord != null){
	param.put("searchField",searchField);
	param.put("searchWord",searchWord);
}

int totalCount = dao.selectCount(param);

int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));   //게시글 10개
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));  //블럭 5개
int totalPage = (int) Math.ceil((double)totalCount / pageSize);    //총 11개의 블럭 필요

int pageNum = 1;
String pageTemp = request.getParameter("pageNum");
if (pageTemp != null && !pageTemp.equals("")) pageNum = Integer.parseInt(pageTemp);

int start = (pageNum-1) * pageSize  ;
param.put("start" , start);
param.put("pageSize", pageSize);

List<BoardDTO> boardLists = dao.selectListPage(param);
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<h2>목록 보기(List)-현재 페이지 : <%= pageNum %> (전체 : <%= totalPage %>)</h2>
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
	
	<!-- 게시물 목록 출력 -->
	<table border="1" width = "90%">
		<tr align="center">
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
		
		<%
		// 게시물 목록이 아무것도 없을 때
		if (boardLists.isEmpty()){
		%>
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다^^*</td>
		</tr>
		<%
		}
		// 게시물 목록이 있을 때는 totalCount만큼 <tr><td>번호</td><td>제목</td><td>작성자</td><td>조회수</td><td>작성일</td></tr> 만들어야 함
		// list.get(i).getString("name")
		else{
			int virtualNum = 0 ; //화면상에서의 게시물 번호
			int countNum = 0;
			for (BoardDTO dto : boardLists){
					//virtualNum=totalCount--;
					virtualNum=totalCount - (((pageNum-1) * pageSize) + countNum++);
		%>
					<tr align ="center">
						<!-- 번호, 제목, 작성자 , 조회수, 작성일 순서로 td 만들기-->
						<td><%=virtualNum %></td>  
						<td align="left"><a href = "View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a></td>
						<td align="center"><%= dto.getId() %></td>
						<td align="center"><%= dto.getVisitcount() %></td>
						<td align="center"><%= dto.getPostdate() %></td>
					</tr>
		<%
			}
		}
		%>
	</table>
	<!-- 게시물 목록이 있던 없던 글쓰기 버튼은 출력되어야 함-->
	<table border="1" width="90%">
		<tr align ="center">
		
			<td><%= BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %></td>
			<td><button type ="button" onclick="location.href='Write.jsp';">글쓰기</button></td>
		</tr>
	</table>
	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="model1.board.BoardDAO" %>
<%@ page import ="model1.board.BoardDTO" %>
<%@ include file = "./IsLoggedln.jsp" %>
<%
//폼값 받기
String title= request.getParameter("title");
String content= request.getParameter("content");

//폼값을 DTO 객체에 저장
BoardDTO dto =  new BoardDTO();
dto.setContent(content);
dto.setId(session.getAttribute("UserId").toString());

//DAO객체를 통해 DB에 DTO 저장
BoardDAO dao = new BoardDAO(application);
int  iResult =0 ;

dto.setTitle(title );
iResult = dao.insertWrite(dto);
// for ( int i =1 ; i<=100 ; i++){
// 	dto.setTitle(title + "-" + i);
	
// 	iResult = dao.insertWrite(dto);
// }


dao.close();

if (iResult == 1){
	response.sendRedirect("List.jsp"); //글쓰기 성공하면 목록 페이지로 이동
}else {
	JSFunction.alertBack("글쓰기에 실패했습니다.", out);   //글쓰기 실패하면 경고창 띄운 후, 글쓰기 페이지로 이동
}
%>

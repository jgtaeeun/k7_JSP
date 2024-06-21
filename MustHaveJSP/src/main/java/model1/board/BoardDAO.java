package model1.board;

import jakarta.servlet.ServletContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;

public class BoardDAO extends JDBConnect{
	public BoardDAO(ServletContext application) {
		super(application);
	}
	//검색 조건에 맞는 게시물의 개수를 반환한다.
	public int selectCount(Map <String, Object> map) {
		int totalCount=0;
		
		//게시물 수를 얻더오는 쿼리문 작성
		String query="SELECT COUNT(*) FROM board ";
		if (map.get("searchWord")!= null) {
			query+= "WHERE " + map.get("searchField") +" " + " LIKE '%" +map.get("searchWord") + "%'";
		}
		Statement stmt=null;
		ResultSet rs=null;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
			
			rs.close();
			stmt.close();
			
		}catch(Exception e){
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}	
		
			
		
		return totalCount;
	}
	
	//검색조건에 맞는 게시물 목록을 반환한다.
	public List<BoardDTO> selectList (Map<String, Object> map){
		List<BoardDTO> bbs = new Vector <BoardDTO>();
		
		String query = "SELECT * FROM board ";
		if (map.get("searchWord")!= null) {
			query+= "WHERE " + map.get("searchField") +" " + " LIKE '%" +map.get("searchWord") + "%'";
		}
		query +=" ORDER BY num DESC";
		
		Statement stmt=null;
		ResultSet rs=null;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				//한 행의 내용을 DTO에 저장 -><BoardDTO> 타입의 LIST에 저장
				BoardDTO dto =  new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				bbs.add(dto);
			}
			rs.close();
			stmt.close();
		}catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	//Write.jsp에서 글쓰기 하고 작성완료 버튼을 누르면 WriteProcess.jsp로 폼값이 전송된다. 이 폼값을 받아 데이터베이스에 
	//추가하려면 메서드가 필요하다
	
	public int insertWrite(BoardDTO dto) {
		int result=0;
		PreparedStatement pt =null;
		
		try {
			String query = "INSERT INTO board ( " + " title, content, id, visitcount) " 
												+ " VALUES ( " + " ?, ?, ?, 0)";
		//	System.out.println(query);
			pt=con.prepareStatement(query);
			pt.setString(1, dto.getTitle());
			pt.setString(2, dto.getContent());
			pt.setString(3, dto.getId());
			
			result=pt.executeUpdate();
		//	System.out.println(result);
		
			
		}catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		//성공적으로 추가한 행의 개수
		return result;
	}
	
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		
		String query = "SELECT B.*, M.name " + " FROM member M INNER JOIN board B "
						+ " ON M.id=B.id "+ " where num = ? ";
		System.out.println(query);
		
		PreparedStatement pt =null;
		ResultSet rs = null;
		
		try {
			pt=con.prepareStatement(query);
			pt.setString(1, num);
			
			rs=pt.executeQuery();
			
			if (rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setName(rs.getString("name"));
			}
			rs.close();
			pt.close();
		}catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	//게시물의 조회수 증가
	public void updateVisitCount(String num) {
		String query = "Update board set  visitcount = visitcount +1  where num = ? ";

		PreparedStatement pt =null;
		
		try {
			pt=con.prepareStatement(query);
			pt.setString(1, num);
			
			pt.executeUpdate();
		
			
			pt.close();
		}catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		
	}
	
	public int updateEdit(BoardDTO dto) {
		int result = 0;
		PreparedStatement pt =null;
		try {
			String query = "update board set title = ?, content = ? where num = ?";
			
			pt=con.prepareStatement(query);
			pt.setString(1, dto.getTitle());
			pt.setString(2, dto.getContent());
			pt.setString(3, dto.getNum());
			
			result =pt.executeUpdate();
			
			pt.close();
		}catch(Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int deletePost(BoardDTO dto) {
		int result = 0 ;
		PreparedStatement pt =null;
		try {
			String query = "delete from board where num = ?";
			pt=con.prepareStatement(query);
			pt.setString(1, dto.getNum());
			
			result =pt.executeUpdate();
			
			pt.close();
		}catch(Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	//------------------------------------------페이징 기능 지원
	public List<BoardDTO> selectListPage(Map<String, Object> map){
		 List<BoardDTO> bbs = new Vector<BoardDTO>();
		 
		 String query = "select * from board ";
		 
		 if (map.get("searchWord")!= null) {
			 query += "where " + map.get("searchField") 
			 			+ " like '%" + map.get("searchWord") 
			 			+ "%' " ;
 		 }
		 query += " order by num desc limit ?,?" ;
		 PreparedStatement pt = null;
		 ResultSet rs =null;
		 try {
			 pt = con.prepareStatement(query);
			 pt.setInt(1,(int) map.get("start"));
			 pt.setInt(2,(int) map.get("pageSize"));
			 rs=pt.executeQuery();
			 
			 while(rs.next()) {
				 BoardDTO dto = new BoardDTO();
				 dto.setNum(rs.getString("num"));
				 dto.setTitle(rs.getString("title"));
				 dto.setContent(rs.getString("content"));
				 dto.setPostdate(rs.getDate("postdate"));
				 dto.setId(rs.getString("id"));
				 dto.setVisitcount(rs.getString("visitcount"));
				 bbs.add(dto);
			 }
		 }catch(Exception e) {
			 System.out.println("게시물 조회 중 예외 발생");
			 e.printStackTrace();
		 }
		 return bbs;
	}
}

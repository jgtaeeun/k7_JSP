package model2.mvcboard;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import java.util.List;
import java.util.Vector;
import java.util.Map;

import common.JDBConnect;
import model1.board.BoardDTO;


public class MVCBoardDAO extends JDBConnect {
	public MVCBoardDAO() {
		super();
	}
	//검색 조건에 맞는 게시물의 개수를 반환한다.
		public int selectCount(Map <String, Object> map) {
			int totalCount=0;
			
			//게시물 수를 얻더오는 쿼리문 작성
			String query="SELECT COUNT(*) FROM mvcboard ";
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
	
		public MVCBoardDTO selectView(String idx) {
			MVCBoardDTO dto = new MVCBoardDTO();
			
			String query = "select * from mvcboard where idx = ? ";
			
			PreparedStatement pt =null;
			ResultSet rs = null;
			
			try {
				pt=con.prepareStatement(query);
				pt.setString(1,idx);
				
				rs=pt.executeQuery();
				
				if (rs.next()) {
					 dto.setIdx(rs.getString("idx"));
					 dto.setName(rs.getString("name"));
					 dto.setTitle(rs.getString("title"));
					 dto.setContent(rs.getString("content"));
					 dto.setPostdate(rs.getDate("postdate"));
					 dto.setOfile(rs.getString("ofile"));
					 dto.setSfile(rs.getString("sfile"));
					 dto.setDowncount(rs.getInt("downcount"));
					 dto.setPass(rs.getString("pass"));
					 dto.setVisitcount(rs.getInt("visitcount"));
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
		public void updateVisitCount(String idx) {
			String query = "Update mvcboard set  visitcount = visitcount +1  where idx = ? ";

			PreparedStatement pt =null;
			
			try {
				pt=con.prepareStatement(query);
				pt.setString(1, idx);
				
				pt.executeUpdate();
			
				
				pt.close();
			}catch (Exception e) {
				System.out.println("게시물 상세보기 중 예외 발생");
				e.printStackTrace();
			}
			
		}
		
		//다운로드 횟수 증가
		public void downCountPlus(String idx) {
			String query = "Update mvcboard set  downcount = downcount +1  where idx = ? ";

			PreparedStatement pt =null;
			
			try {
				pt=con.prepareStatement(query);
				pt.setString(1, idx);
				
				pt.executeUpdate();
			
				
				pt.close();
			}catch (Exception e) {
				System.out.println("게시물 상세보기 중 예외 발생");
				e.printStackTrace();
			}
			
		}
	public List<MVCBoardDTO> selectListPage(Map<String, Object> map){
		 List<MVCBoardDTO> bbs = new Vector<MVCBoardDTO>();
		 
		 String query = "select * from mvcboard ";
		 
		 if (map.get("searchWord")!= null) {
			 query += "where " + map.get("searchField") 
			 			+ " like '%" + map.get("searchWord") 
			 			+ "%' " ;
		 }
		 query += " order by idx desc limit ?,?" ;
		 PreparedStatement pt = null;
		 ResultSet rs =null;
		 try {
			 pt = con.prepareStatement(query);
			 pt.setInt(1,(int) map.get("start"));
			 pt.setInt(2,(int) map.get("pageSize"));
			 rs=pt.executeQuery();
			 
			 while(rs.next()) {
				 MVCBoardDTO dto = new MVCBoardDTO();
				 dto.setIdx(rs.getString("idx"));
				 dto.setName(rs.getString("name"));
				 dto.setTitle(rs.getString("title"));
				 dto.setContent(rs.getString("content"));
				 dto.setPostdate(rs.getDate("postdate"));
				 dto.setOfile(rs.getString("ofile"));
				 dto.setSfile(rs.getString("sfile"));
				 dto.setDowncount(rs.getInt("downcount"));
				 dto.setPass(rs.getString("pass"));
				 dto.setVisitcount(rs.getInt("visitcount"));
				 bbs.add(dto);
				 
			 }
			 
			 rs.close();
			 pt.close();
		 }catch(Exception e) {
			 System.out.println("게시물 조회 중 예외 발생");
			 e.printStackTrace();
		 }
		 
		 return bbs;
	}
	
	public int insertWrite(MVCBoardDTO dto) {
		int result=0;
		PreparedStatement pt =null;
		
		try {
			String query = "INSERT INTO mvcboard ( " + " name, title, content, ofile, sfile, pass) "
												+ " VALUES ( " + "?,?, ?, ?, ?,?)";
		//	System.out.println(query);
			pt=con.prepareStatement(query);
			pt.setString(1, dto.getName());
			pt.setString(2, dto.getTitle());
			pt.setString(3, dto.getContent());
			pt.setString(4, dto.getOfile());
			pt.setString(5, dto.getSfile());
			pt.setString(6, dto.getPass());
			result=pt.executeUpdate();
		//	System.out.println(result);
		
			
		}catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		//성공적으로 추가한 행의 개수
		return result;
	}
	
	//입력한 비밀 번호가 지정한 일련번호의 게시물의 비밀번호와 일치하는지 확인한다.
	public boolean confirmPassword(String pass, String idx) {
		boolean isCorr=true;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		try {
			String sql = "select count(*) from mvcboard where pass=? and idx = ? ";
			psmt=con.prepareStatement(sql);
			psmt.setString(1,pass);
			psmt.setString(2,idx);
			rs=psmt.executeQuery();
			rs.next();
			if (rs.getInt(1)==0) 
				isCorr=false;
		}catch(Exception e) {
			isCorr=false;
			e.printStackTrace();
		}
	
		return isCorr;
	}
	
	//삭제
	public int deletePost(String idx) {
		int result = 0;
		PreparedStatement psmt = null;
		try {
			String sql = "delete from mvcboard where idx = ? ";
			psmt=con.prepareStatement(sql);
			psmt.setString(1, idx);
			result=psmt.executeUpdate();
			System.out.println(result);
		}catch(Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
	
		return result;
	}
	//게시글 수정
	public int updatePost(MVCBoardDTO dto) {
		int result = 0 ;
		PreparedStatement psmt = null;
		try {
			String sql = "update  mvcboard  set "+
					"title = ? , name= ? , content=?, ofile =?, sfile=? where idx = ? and pass =? ";
			psmt=con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4,dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getIdx());
			psmt.setString(7, dto.getPass());
			result=psmt.executeUpdate();
			System.out.println(result);
		}catch(Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
}

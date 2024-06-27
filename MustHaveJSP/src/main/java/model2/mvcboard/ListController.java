package model2.mvcboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.BoardPage;

public class ListController extends HttpServlet{
		
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			MVCBoardDAO dao =  new MVCBoardDAO();
			
			Map<String , Object> map = new HashMap<String, Object>();
			String searchField=req.getParameter("searchField");	
			String searchWord=req.getParameter("searchWord");
			
			if (searchWord != null){
				map.put("searchField",searchField);
				map.put("searchWord",searchWord);
			}

			int totalCount = dao.selectCount(map);
			
			//페이지 처리
			ServletContext application= getServletContext();
			int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));   //게시글 10개
			int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));  //블럭 5개
			int totalPage = (int) Math.ceil((double)totalCount / pageSize);    //총 11개의 블럭 필요

			int pageNum = 1;
			String pageTemp = req.getParameter("pageNum");
			
			//요청받은 페이지로 수정
			if (pageTemp != null && !pageTemp.equals("")) pageNum = Integer.parseInt(pageTemp);

			//목록에 출력할 게시물 범위 계산
			int start = (pageNum-1) * pageSize  ;
			map.put("start" , start);
			map.put("pageSize", pageSize);

			List<MVCBoardDTO> boardLists = dao.selectListPage(map);
			dao.close();
			
			//뷰에 전달할 매개변수 추가
			String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, 
					"../mvcboard/list.do"); 
			
			map.put("pagingImg", pagingImg);
			map.put("totalCount", totalCount);
			map.put("pageSize", pageSize);
			map.put("pageNum", pageNum);
				
			req.setAttribute("boardLists",boardLists);
			req.setAttribute("map",map);
			req.getRequestDispatcher("/14MVCBoard/List.jsp").forward(req, resp);
		}
		
		
		
}

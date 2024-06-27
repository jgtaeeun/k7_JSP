package model2.mvcboard;

import java.io.IOException;

import fileupload.FileUtil;
import fileupload.MyFileDAO;
import fileupload.MyFileDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.jsp.JspWriter;
import utils.JSFunction;

public class WriteController extends HttpServlet{
			@Override
			protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				req.getRequestDispatcher("/14MVCBoard/Write.jsp").forward(req, resp);
			}
			
			
			@Override
			protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				//파일 업로드 처리
				//업로드디렉토리의 물리적 경로 확인
				//드라이브 명으로 절대경로 지정하기 
				//String saveDirectory = "C:/02Workspaces/MustHaveJSP/src/main/webapp/Uploads";
				//Uploads 디렉토리의 물리적 경로 가져오기
			    String saveDirectory =req.getServletContext().getRealPath("/Uploads");
			    String originalFileName = "";
			    try{
			    	originalFileName = FileUtil.uploadFile(req, saveDirectory);
			    }
			    catch(Exception e) {
			    	JSFunction.alertLocation(resp, "파일 업로드 오류입니다.", "../mvcboard/write.do");
			    	return;
			    }
			   
			   
			  //DB에 입력하기
			    MVCBoardDTO dto = new MVCBoardDTO();
		        dto.setName(req.getParameter("name"));
		        dto.setTitle(req.getParameter("title"));
		        dto.setContent(req.getParameter("content"));
		        dto.setPass(req.getParameter("pass"));

		        
		        //원본파일명과 저장된 파일 이름 설정
		        if (originalFileName != "") {
		        	 String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
		        	 dto.setOfile(originalFileName);
		        	 dto.setSfile(savedFileName);
		        
		        }
		       
				
				
				
				
				//폼값을 dto에 저장
		        
		        //DAO를 통해 데이터베이스에 반영
		        MVCBoardDAO dao = new MVCBoardDAO();
		        int result = dao.insertWrite(dto);
		        dao.close();
		       
		        if(result==1) {
		        	resp.sendRedirect("../mvcboard/list.do");
		        }
		        else {
		        	JSFunction.alertLocation(resp, "글쓰기에 실패했습니다..", "../mvcboard/write.do");
			    	return;
		        }
		        
		      
			}
			
			
}

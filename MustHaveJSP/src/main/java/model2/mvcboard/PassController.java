package model2.mvcboard;

import java.io.IOException;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model2.mvcboard.MVCBoardDAO;
import model2.mvcboard.MVCBoardDTO;
import utils.JSFunction;


@WebServlet("/mvcboard/pass.do")
public class PassController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	req.setAttribute("mode", req.getParameter("mode"));
	//req.getRequestDispatcher("/14MVCBoard/Pass.jsp").forward(req, resp);
	req.getRequestDispatcher(getServletContext().getInitParameter("VIEWPATH")+"/Pass.jsp").forward(req, resp);
	}
		@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx=req.getParameter("idx");
		String mode = req.getParameter("mode");
		String pass = req.getParameter("pass");
		
		//비밀 번호 확인
		MVCBoardDAO dao =  new MVCBoardDAO();
		boolean confirmed=dao.confirmPassword(pass, idx);
		dao.close();
		
		if (confirmed) {
			if(mode.equals("edit")) {
				//수정일 경우 session영역에 비밀번호를 저장한 후 수정하기 페이지로 이동한다.
				HttpSession session = req.getSession();
				session.setAttribute("pass", pass);
				resp.sendRedirect("../mvcboard/edit.do?idx=" +idx);
			}
			else if (mode.equals("delete")){
				//삭제(게시글 삭제 후 파일저장된 것도 삭제)
				dao= new MVCBoardDAO();
				MVCBoardDTO dto = dao.selectView(idx);
				int result=dao.deletePost(idx); 
				dao.close();
				
				if (result ==1) {
					String saveFileName = dto.getSfile();
					FileUtil.deleteFile(req, "/Uploads", saveFileName);
					
				}
				JSFunction.alertLocation(resp, "삭제되었습니다.", "../mvcboard/list.do");
				
			}
		}
		else {
			JSFunction.alertBack(resp, "비밀번호 검증에 실패했습니다.");
		}
	}
}

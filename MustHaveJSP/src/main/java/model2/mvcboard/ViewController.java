package model2.mvcboard;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MVCBoardDAO dao =new MVCBoardDAO();
		String idx= req.getParameter("idx");
		dao.updateVisitCount(idx);
		
		MVCBoardDTO  dto = new MVCBoardDTO();
		dto=dao.selectView(idx);
		
		dao.close();
		//html문서는 일반텍스트 문서의 줄바꿈 문자 \r\n을 무시하기 때문에 html이 인식하는 <br />로 바꿔줘야 함
		dto.setContent(dto.getContent().replace("\r\n", "<br />"));
		
		//첨부파일 확장자 추출 및 이미지 타입 확인
		//첨부파일이 이미지라면 <img>태그로 상세복 화면에 보여줄 것이다.
		
		String ext= null;
		String fileName=dto.getSfile();
		
		if (fileName != null) {
			ext=fileName.substring(fileName.lastIndexOf(".")+1);
			System.out.println(ext);
		}
		String [] mimeStr = {"PNG", "jpg", "gif","JPG"};
		List<String> mimeList = Arrays.asList(mimeStr);
		boolean isImage=false;
		if(mimeList.contains(ext)) {
			isImage=true;
		}
		
		req.setAttribute("dto", dto);
		req.setAttribute("isImage", isImage);
		req.getRequestDispatcher("/14MVCBoard/View.jsp").forward(req, resp);
		
	}
	
}

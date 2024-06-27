package model2.mvcboard;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/mvcboard/pass.do")
public class PassContoller extends HttpServlet{
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setAttribute("idx", req.getParameter("idx"));
			req.setAttribute("mode", req.getParameter("mode"));
			req.getRequestDispatcher("/14MVCBoard/Pass.jsp").forward(req, resp);
		}
}

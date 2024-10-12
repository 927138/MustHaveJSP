package model2.mvcboard;

import java.io.IOException;

import fileupload.FileUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;


@WebServlet("/mvcboard/pass.do")
public class PassController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/mvcboard/Pass.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		String pass = req.getParameter("pass");
		
		MVCBoardDAO dao = new MVCBoardDAO(this.getServletContext());
		boolean isCorr = dao.confirmPassword(pass, idx);
		dao.close();
		
		System.out.println(idx + " , " + pass);
		if(isCorr) {
			if(mode.equals("delete")) {
				int result = 0;
				dao = new MVCBoardDAO(getServletContext());
				
				MVCBoardDTO dto = dao.selectView(idx);
				dao.deleteBoard(idx);
				dao.close();
				
				if(result == 1) {
					FileUtils.deleteFile(req, "/Uploads", dto.getSfile());
				}
				JSFunction.alertLocation(resp, "success / delete board", "../mvcboard/list.do");
				
			}else if(mode.equals("edit")) {
				HttpSession session = req.getSession();
				session.setAttribute("pass", pass);
				resp.sendRedirect("../mvcboard/edit.do?idx="+ idx);
			}
		}else {
			JSFunction.alertBack(resp, "잘못된 비밀번호");
		}
	}
}

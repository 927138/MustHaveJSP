package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("*.one")
public class FrontController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String url = req.getRequestURL().toString();
		String root = req.getContextPath();
		
		int index =  uri.lastIndexOf('/');
		String subUri = uri.substring(index);
		
		if(subUri.equals("/register.one")) {
			registerFunc(req);
		}else if(subUri.equals("/login.one")) {
			loginFunc(req);
		}else if(subUri.equals("/freeboard.one")) {
			freeboardFunc(req);
		}
		
		req.setAttribute("uri", uri);
		req.setAttribute("url", url);
		req.setAttribute("subUri", subUri);
		req.setAttribute("root", root);
		req.getRequestDispatcher("/servlet/FrontController.jsp").forward(req, resp);
	}
	
	void registerFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>회원가입</h4>");
	}
	
	void loginFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>로그인</h4>");
	}
	
	void freeboardFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>자유게시판</h4>");
	}
}

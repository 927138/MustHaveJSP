package servlet;

import java.io.IOException;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/servlet/lifeCycle.do")
public class LifeCycle extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@PostConstruct
	public void postConstruct() {
		System.out.println("postConstruct");
	}
	
	@Override
	public void init() throws ServletException {
		System.out.println("init()");
	}
	
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		System.out.println("service()");
		super.service(arg0, arg1);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet()");
		req.getRequestDispatcher("/servlet/LifeCycle.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost()");
		req.getRequestDispatcher("/servlet/LifeCycle.jsp").forward(req, resp);
	}
	
	@Override
	public void destroy() {
		System.out.println("destroy()");
	}
	
	@PreDestroy
	public void preDestory() {
		System.out.println("preDestroy()");
	}
}

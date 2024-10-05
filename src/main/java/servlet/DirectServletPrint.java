package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DirectServletPrint extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		
		PrintWriter pw = resp.getWriter();
		pw.append("<html>");
		pw.append("<head>");
		pw.append("<body>");
		pw.append("<h2>servlet direct print</h2>");
		pw.append("<p>jsp에서 forward 하지 않음</p>");
		pw.append("</body>");
		pw.append("</head>");
		pw.append("</html>");
		pw.flush();
		pw.close();
	}

}

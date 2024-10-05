package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import membership.MemberDAO;
import membership.MemberDTO;

public class MemberAuth extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private MemberDTO memberDto;
	private MemberDAO memberDao;
	
	
	@Override
	public void init() throws ServletException {
		memberDao = new MemberDAO(this.getServletContext());
	}
	

	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		
		String adminId = this.getInitParameter("admin_id"); 
				
		String id = arg0.getParameter("id");
		String pass = arg0.getParameter("pass");
		memberDto = memberDao.getMemberDTO(id, pass);
		
		String name = memberDto.getName();
		if(name != null) {
			if(memberDto.getId().equals(adminId)) {
				arg0.setAttribute("authMessage", "hello admin");
			}else {
				arg0.setAttribute("authMessage", "hello " + name);
			}
		}else {
			arg0.setAttribute("authMessage", "hello 비회원");
		}
		
		arg0.getRequestDispatcher("/servlet/MemberAuth.jsp").forward(arg0, arg1);
	}
	
	@Override
	public void destroy() {
		memberDao.close();
	}

}

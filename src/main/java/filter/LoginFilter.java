package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import membership.MemberDAO;
import membership.MemberDTO;
import utils.JSFunction;


@WebFilter(filterName = "loginFilter", 
			urlPatterns = "/filterListener/LoginFilter.jsp")
public class LoginFilter implements Filter{
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		
		HttpSession session = request.getSession();
		String method = request.getMethod().toLowerCase();
		
		if(method.equals("post")) {
			String userId = request.getParameter("UserId");
			String userPw = request.getParameter("UserPw");
			
			MemberDAO dao = new MemberDAO(request.getServletContext());
			MemberDTO dto = dao.getMemberDTO(userId, userPw);
			dao.close();
			
			if(dto.getId() != null) {
				session.setAttribute("UserId", dto.getId());
				session.setAttribute("UserPw", dto.getPass());
				
				String backUrl = request.getParameter("backUrl");
				System.out.println(backUrl);
				if(backUrl != null && !backUrl.equals("")) {
					JSFunction.alertLocation(response, "로그인 전 요청 페이지로 이동", backUrl);
					return;
				}else {
					response.sendRedirect("../filterListener/LoginFilter.jsp");
				}
			}else {
				request.setAttribute("LoginErrMsg", "fail the login");
				request.getRequestDispatcher("../filterListener/LoginFilter.jsp").forward(request, response);
			}
		}else if(method.equals("get")) {
			String mode = request.getParameter("mode");
			if(mode != null && mode.equals("logout")) {
				session.invalidate();
			}
		}
		
		chain.doFilter(req, resp);
	}
		
	
}

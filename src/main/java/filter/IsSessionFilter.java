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
import utils.JSFunction;


@WebFilter(urlPatterns = {"/boardPaging/Write.jsp", "/boardPaging/Edit.jsp", "/boardPaging/DeleteProcess.jsp"})
public class IsSessionFilter implements Filter{
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("UserId") == null) {
			String backUrl = request.getRequestURI();
			JSFunction.alertLocation(response, "[filter] login 후 이용해", 
								"../filterListener/LoginFilter.jsp?backUrl="+backUrl);
			return;
		}else {
			chain.doFilter(request, response);
		}
		
	}
}

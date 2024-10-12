package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;

public class BasicFilter implements Filter{

	private FilterConfig config;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		config = filterConfig;
		String filterName = config.getFilterName();
		
		System.out.println("BasicFilter.init() call : "+filterName);
	}
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		String filterInitParam = config.getInitParameter("FILTER_INIT_PARAM");
		System.out.println("BasicFilter.doFilter() -> init param : " + filterInitParam);
		
		String method = ((HttpServletRequest)req).getMethod();
		System.out.println("BasicFilter.doFilter() -> 전송방식 : " + method);
		
		chain.doFilter(req, resp);
	}
	
	@Override
	public void destroy() {
		System.out.println("BasicFilter.destroy()");
	}
}

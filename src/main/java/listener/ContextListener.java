package listener;

import java.util.Enumeration;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;


@WebListener
public class ContextListener implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		Enumeration<String> apps = sce.getServletContext().getInitParameterNames();
		
		while(apps.hasMoreElements()) {
			System.out.println("[listener] 컨텍스트 초기화 매개변수 생성 : " + apps.nextElement());
		}
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		Enumeration<String> apps = sce.getServletContext().getInitParameterNames();
		
		while(apps.hasMoreElements()) {
			System.out.println("[listener] 컨텍스트 초기화 매개변수 소멸" + apps.nextElement());
		}
	}

}

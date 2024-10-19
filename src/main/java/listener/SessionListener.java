package listener;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;


@WebListener
public class SessionListener implements HttpSessionListener{
	private int visitCount = 0;
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		visitCount++;
		
		System.out.println("[listener] create session : " + se.getSession().getId());
		System.out.println("[listener] counting session : " + this.visitCount);
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		visitCount--;
		
		System.out.println("[listener] Destroy session : " + se.getSession().getId());
		System.out.println("[listener] counting session : " + this.visitCount);
	}
}

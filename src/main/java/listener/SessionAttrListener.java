package listener;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;


@WebListener
public class SessionAttrListener implements HttpSessionAttributeListener {

	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		System.out.println("[listener] session attribute add : " + se.getName() + " , = " + se.getValue());
	}
	
	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
		System.out.println("[listener] session attribute remove : " + se.getName() + " , = " + se.getValue());
	}
	
	@Override
	public void attributeReplaced(HttpSessionBindingEvent se) {
		System.out.println("[listener] session attribute replace : " + se.getName() + " , = " + se.getValue());
	}
}

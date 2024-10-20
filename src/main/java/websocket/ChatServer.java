package websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnError;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;

@ServerEndpoint("/ChatingServer")
public class ChatServer {

	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<>());
	
	@OnOpen
	public void onOpen(Session session) {
		clients.add(session);
		System.out.println("webSocket conntion id : " + session.getId());
	}
	
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println("message transfer (" + session.getId() + ") : " + message);
		synchronized (clients) {
			for(Session s : clients) {
				if(!s.equals(session)) {
					s.getBasicRemote().sendText(message);
				}
			}
		}
	}
	
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
		System.out.println("webSocket exit : " + session.getId());
	}
			
	@OnError
	public void onError(Throwable e) {
		System.out.println("error");
		e.printStackTrace();
	}
	
			
}

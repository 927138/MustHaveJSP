<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

	long creationTime = session.getCreationTime();
	String creationTimeeStr = dateFormat.format(new Date(creationTime));
	
	long lastTime = session.getLastAccessedTime();
	String lastTimeStr = dateFormat.format(new Date(lastTime));
%>


<h2> session 설정 확인 </h2>
<ul>
	<li>세션 유지 시간 : <%= session.getMaxInactiveInterval() %>. sec</li>
	<li>세션 아이디 : <%= session.getId() %></li>
	<li>최초 요청 시간 : <%= creationTimeeStr %></li>
	<li>마지막 요청 시간 : <%= lastTimeStr %></li>
</ul>

<p>create session</p>
<%
	session.setAttribute("testSession", "1234");
	session.setMaxInactiveInterval(10);
%>
<%= session.getAttribute("testSession") %>
<a href="./testSession.jsp">test link</a>
</body>
</html>
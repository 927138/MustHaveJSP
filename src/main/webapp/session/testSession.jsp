<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= session.getAttribute("testSession") %>
<% 

	Cookie[] c = request.getCookies();
	out.print("<br/>");
	for(Cookie co : c){
		if(co.getName().equals("JSESSIONID")){
			out.print(co.getName());
			out.print("<br/>");
			out.print(co.getValue());
			out.print("<br/>");
			out.print(co.getDomain());
			out.print("<br/>");
		}
	}
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>1. 쿠키 설정</h2>
<%
	Cookie cookie = new Cookie("myCookie", "test cookie");
	cookie.setPath(cookie.getContextPath());
	cookie.setMaxAge(3600);
	response.addCookie(cookie);
%>

<h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie c : cookies){
			out.print(String.format("%s : %s <br/>", 
					c.getName(), c.getValue()));
		}
	}
%>


</body>
</html>
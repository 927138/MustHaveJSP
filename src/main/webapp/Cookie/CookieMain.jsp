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
	Cookie cookie = new Cookie("myCookie", "examplCookie");
	cookie.setMaxAge(3600);
	cookie.setPath(request.getContextPath());
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

<h2>3. 페이지 이동 후 쿠키값 확인하기</h2>
<a href="CookieResult.jsp"> 다음페이지에서 쿠기 값 확인하기 </a>



</body>
</html>
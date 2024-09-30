<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>쿠키값 확인하기(쿠키생성 이후의 페이지)</h2>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie c : cookies){
			out.print(String.format("cookieName : %s / cookieValue <br/>",
					c.getName(), c.getValue()));
		} 
	}
%>

</body>
</html>
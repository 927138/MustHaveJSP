<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>forward result</h2>

<ul>
	<li>pageContext attribute : <%= pageContext.getAttribute("page") %></li>
	<li>request attribute : <%= request.getAttribute("request") %></li>
</ul>

</body>
</html>
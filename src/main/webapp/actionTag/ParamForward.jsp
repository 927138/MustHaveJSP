<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>포워드된 페이지에서 매개변수 확인</h2>

<ul>
	<li>name : <jsp:getProperty property="name" name="person"/> </li>
	<li>age : <jsp:getProperty property="age" name="person"/> </li>
	<li>jsp:param tag p1 : <%= request.getParameter("p1") %></li>
	<li>jsp:param tag p2 : <%= request.getParameter("p2") %></li>
	<li>jsp:param tag pValue : <%= request.getParameter("p3") %></li>
</ul>

</body>
</html>
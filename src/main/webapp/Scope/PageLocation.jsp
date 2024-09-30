<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>page 이동 후 page 영역의 속성값 읽기</h2>

<%
	Object pInteger = pageContext.getAttribute("pageInteger");
	Object pString = pageContext.getAttribute("pageString");
	Object pPerson = pageContext.getAttribute("pagePerson");
%>

<ul>
	<li>Integer object : <%= (pInteger == null) ? "null" : pInteger %></li>
	<li>String object : <%= (pString == null) ? "null" : pString %></li>
	<li>Person object : <%= (pPerson == null) ? "null" : pPerson %></li>
</ul>
</body>
</html>
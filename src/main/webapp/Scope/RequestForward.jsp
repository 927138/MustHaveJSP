<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>포워드로 전달된 페이지</h2>
<h4>RequestMain file에서 requestArea read</h4>

<% 
	Person pPerson = (Person)(request.getAttribute("requestPerson"));
%>

<ul>
	<li>String Object : <%= request.getAttribute("requestString") %></li>
	<li>Person Object : <%= pPerson.getName() %>, <%= pPerson.getAge() %></li>
</ul>

<h4>매개변수로 전달된 값 출력하기</h4>
<%
	out.println(request.getParameter("paramHan"));
	out.println(request.getParameter("paramEng"));
%>



</body>
</html>
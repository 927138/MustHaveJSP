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

<%
	// String or Wrapper type의 객체는 expression으로 바로 사용가능
	// int pInteger2 =(Integer)(pageContext.getAttribute("pageInteger"));
	// String pString2 = pageContext.getAttribute("pageString").toStirng();
	Person pPerson2 = (Person)(pageContext.getAttribute("pagePerson"));
%>


<h2>include page -> Main PageContext 사용</h2>
<ul>
	<li> pIneger : <%= pageContext.getAttribute("pageInteger") %></li>
	<li> pString : <%= pageContext.getAttribute("pageString") %></li>
	<li> pPerson : <%= pPerson2 %></li>
</ul>

</body>
</html>
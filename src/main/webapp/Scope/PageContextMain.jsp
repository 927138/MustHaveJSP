<%@ page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	pageContext.setAttribute("pageInteger", 1000);
	pageContext.setAttribute("pageString", "page area String");
	pageContext.setAttribute("pagePerson", new Person("ji", 44));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h2>page 영역의 속성값 읽기</h2>
<%
	int pInteger = (Integer)(pageContext.getAttribute("pageInteger"));
	String pString = pageContext.getAttribute("pageString").toString();
	Person pPerson = (Person)(pageContext.getAttribute("pagePerson"));
%>

<ul>
	<li>pInteger : <%= pInteger %></li>
	<li>pString : <%= pString %></li>
	<li>pPerson : <%= pPerson %></li>
</ul>

<h2>include 된 파일에서 page 영역 읽기</h2>
<%@ include file="PageInclude.jsp" %>


<h2>페이지 이동 후 page 영역 읽어오기</h2>
<a href="PageLocation.jsp">PageLocation 바로가기 </a>
</body>
</html>
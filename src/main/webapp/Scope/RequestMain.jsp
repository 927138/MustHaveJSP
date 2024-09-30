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
	request.setAttribute("requestString", "requestArea");
	request.setAttribute("requestPerson", new Person("ji", 55));
%>

<h2>request 영역의 속성값 제거하기</h2>
<%
	request.removeAttribute("requestString");
	request.removeAttribute("requestInteger");
%>

<h2>request area 속성값 읽기</h2>
<%
	Person pPerson = (Person)(request.getAttribute("requestPerson"));
%>
<ul>
	<li>String Object = <%= request.getAttribute("requestString") %></li>
	<li>Person Object = <%= pPerson.getName() %>, <%= pPerson.getAge() %></li>
</ul>


<%
	request.getRequestDispatcher("RequestForward.jsp?paramHan=하이&paramEng=hello")
			.forward(request, response);
%>

</body>
</html>
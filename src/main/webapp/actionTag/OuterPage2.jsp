<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>OuterPage 2</h2>

<%
	String newVar2 = "OuterPage2 message";
%>

<ul>
	<li>page area attribute : <%= pageContext.getAttribute("pAttr") %></li>
	<li>request area attribute : <%= request.getAttribute("rAttr") %></li>
</ul>

</body>
</html>
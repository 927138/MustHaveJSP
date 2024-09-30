<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="person" class="common.Person" scope="request"></jsp:useBean>

<%
	String pValue = "page Value";
%>

<jsp:setProperty property="name" name="person" value="person1"/>
<jsp:setProperty property="age" name="person" value="100000"/>

<jsp:forward page="./ParamForward.jsp">
	<jsp:param value="prams1" name="p1"/>
	<jsp:param value="prams2" name="p2"/>
	<jsp:param value="<%= pValue %>" name="p3"/>
</jsp:forward>

</body>
</html>

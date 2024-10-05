<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:set var="str" value="jstl core forToken"/>
<c:forTokens items="${ str }" delims=" " var="element">
	<p>${ element }</p>
</c:forTokens>


<%
	String color = "RED,BLRU,BALCK,ORANGE";
%>
<c:forTokens items="<%= color %>" delims="," var="c">
	<span style="color:${c}"> ${ c }</span> <br/>
</c:forTokens>

</body>
</html>
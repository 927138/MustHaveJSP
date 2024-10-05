<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:set var="today" value="<%= new Date() %>"/>
<c:set var="money" value="10000"/>

<ul>
	<li>
		korea : 
		<fmt:setLocale value="ko_kr"/>
		<fmt:formatNumber value="${ money }" type="currency"/> / 
		<fmt:formatDate value="${ today }"/>
	</li>
	
	<li>
		japan : 
		<fmt:setLocale value="ja_JP"/>
		<fmt:formatNumber value="${ money }" type="currency"/> /
		<fmt:setLocale value="ja_JP"/> 
		<fmt:formatDate value="${ today }"/>
	</li>
	
	<li>
		america : 
		<fmt:setLocale value="en_US"/>
		<fmt:formatNumber value="${ money }" type="currency"/> / 
		<fmt:formatDate value="${ today }"/>
	</li>
	
</ul>

</body>
</html>
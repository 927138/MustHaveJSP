<%@page import="java.util.TimeZone"%>
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

<h3>fmt:formatDate</h3>
<h4>date format / type=date, dateStyle=(full, short, medium, default) </h4>
<ul>
	<li>full : <fmt:formatDate value="${ today }" type="date" dateStyle="full"/> </li>
	<li>short : <fmt:formatDate value="${ today }" type="date" dateStyle="short"/> </li>
	<li>long : <fmt:formatDate value="${ today }" type="date" dateStyle="long"/> </li>
	<li>medium(default) : <fmt:formatDate value="${ today }" type="date"/> </li>
</ul>

<h4>time format / type=time, timyStyle=(full, short, medium, default) </h4>
<ul>
	<li>full : <fmt:formatDate value="${ today }" type="time" timeStyle="full"/> </li>
	<li>short : <fmt:formatDate value="${ today }" type="time" timeStyle="short"/> </li>
	<li>long : <fmt:formatDate value="${ today }" type="time" timeStyle="long"/> </li>
	<li>medium(default) : <fmt:formatDate value="${ today }" type="time" timeStyle="default"/> </li>
</ul>

<h4>time&date / type=both, time/date Style 두개다 사용가능</h4>
<ul>
	<li> <fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full"/></li>
	<li> <fmt:formatDate value="${ today }" type="both" pattern="yyyy-MM-dd hh:mm:ss"/></li>
</ul>

<h3>fmt:timeZone</h3>
<h4>set timeZone </h4>
<ul>
	<li><fmt:timeZone value="GMT">
		<fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full"/>
	</fmt:timeZone></li>
	
	<li><fmt:timeZone value="America/Chicago">
		<fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full"/>
	</fmt:timeZone></li>
</ul>


</body>
</html>
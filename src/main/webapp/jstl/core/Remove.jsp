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

<c:set var="scopeVar" value="page"/>
<c:set var="scopeVar" value="request" scope="request"/>
<c:set var="scopeVar" value="session" scope="session"/>
<c:set var="scopeVar" value="application" scope="application"/>

<h4>print</h4>
<ul>
	<li>page : ${ scopeVar }</li>
	<li>request : ${ requestScope.scopeVar }</li>
	<li>session : ${ sessionScope.scopeVar }</li>
	<li>application : ${ applicationScope.scopeVar }</li>
</ul>


<h4>session area remove scopeVar</h4>
<c:remove var="scopeVar" scope="session"/>
<ul>
	<li>session : ${ sessionScope.scopeVar }</li>
</ul>

<h4>non area remove scopeVar</h4>
<c:remove var="scopeVar"/>
<ul>

	<%= pageContext.getAttribute("scopeVar") %>
	<li>page : ${ scopeVar }</li>
	<li>request : ${ requestScope.scopeVar }</li>
	<li>application : ${ applicationScope.scopeVar }</li>
</ul>

</body>
</html>
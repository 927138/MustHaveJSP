<%@page import="common.Person"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>Use List Collection</h4>
<% 
	List<Person> pList = new LinkedList<>();
	pList.add(new Person("p1", 1));
	pList.add(new Person("p2", 2));
%>

<c:set var="pList" scope="request" value="<%= pList %>"></c:set>
<ul>
	<li>non scope name : ${ pList[0].name }</li>
	<li>age : ${ requestScope.pList[0].age }</li>
</ul>


</body>
</html>
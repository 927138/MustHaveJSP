<%@page import="java.util.LinkedList"%>
<%@page import="common.Person"%>
<%@page import="java.util.List"%>
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



<%
	List<Person> pList = new LinkedList<>();
	pList.add(new Person("t1", 1));
	pList.add(new Person("t2", 2));
%>



<h4>for(Object o : objList) 형태의 for문</h4>
<ul>
	<c:set var="lists" value="<%= pList %>"/>
	<c:forEach items="${ lists }" var="element">
		<li> ${ element.name }, ${ element.age }</li>
	</c:forEach>
</ul>


<h4>for(Object o : objList) 형태의 for문 varStatus 속성 확인</h4>
<table border="1">
	<c:forEach items="<%= pList %>" varStatus="loop">
		<tr>
			<td>count : ${ loop.count }</td>
			<td>current : ${ loop.current }</td>
			<td>index : ${ loop.index }</td>
			<td>first : ${ loop.first }</td>
			<td>last : ${ loop.last }</td>
		</tr>
</c:forEach>
</table>

</body>
</html>
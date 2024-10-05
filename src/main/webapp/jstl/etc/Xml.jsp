<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="x" uri="jakarta.tags.xml" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:set var="bookList">
	<c:import url="../inc/BookList.xml" charEncoding="UTF-8" />
</c:set>
<x:parse xml="${ bookList }" var="list"/>

<h4>parsing1</h4>
<ul>
	<li><x:out select="$list/bookList/book[1]/name"/></li>
	<li><x:out select="$list/bookList/book[1]/author"/></li>
	<li><x:out select="$list/bookList/book[1]/price"/></li>
</ul>


<h4>parsing2</h4>
<table border="1">
	<x:forEach select="$list/bookList/book" var="books">0
		<tr>
			<td><x:out select="$books/name"/></td>
			<td><x:out select="$books/author"/></td>
			<td><x:out select="$books/price"/></td>
		</tr>	
	</x:forEach>
</table>


</body>
</html>
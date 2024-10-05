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

<h4>normal forEach </h4>
<c:forEach begin="1" end="5" step="1" var="i">
	<p> index : ${ i } </p>
</c:forEach>

<h4>varStatus 속성 보기</h4>
<table border="1">
	<c:forEach begin="0" end="5" var="i" varStatus="loop">
		<tr>
			<td>count : ${ loop.count }</td>
			<td>current : ${ loop.current }</td>
			<td>index : ${ loop.index }</td>
			<td>first : ${ loop.first }</td>
			<td>last : ${ loop.last }</td>
		</tr>
</c:forEach>
</table>

<h4>1 ~ 100까지 정수 중 홀수의 합</h4>
<c:forEach begin="1" end="100" var="i" >
	<c:if test="${ i mod 2 eq 1 }">
		<c:set var="sumValue" value="${ sumValue + i }"/>
	</c:if>
</c:forEach>
<p> 1~100 까지의 합 : ${ sumValue }</p>
</body>
</html>
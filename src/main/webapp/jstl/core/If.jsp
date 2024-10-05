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

<c:set var="number" value="100"/>
<c:set var="string" value="jsp/servlet"/>

<h4>홀짝판단</h4>
<c:if test="${ number mod 2 eq 0 }" var="result1"></c:if>
<li> number mod 2 eq 0 : ${ result1 }</li>

<h4>문자열 비교</h4>
<c:if test="${ string eq 'java' }" var="result1">
	<li>'java'</li>
</c:if>
<c:if test="${ not result1 }">
	<li>not 'java'</li>
</c:if>

<h4>조건식 주의사항</h4>
<c:if test="100 mod 3" var="result3">
	<li> el이아닌 정수를 지정하면 false	</li>
</c:if>
<li> result3 : ${ result3 }</li>

<c:if test="tRuE" var="result4">
	<li>대소문자 구분하지 않은 tRuE</li>
</c:if>
<li>result4 : ${ result4 }</li>

<c:if test="${true}" var="result5"></c:if>
<li>result5 : ${ result5 }</li>




</body>
</html>
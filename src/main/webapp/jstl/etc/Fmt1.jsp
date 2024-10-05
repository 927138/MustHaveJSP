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


<h4>숫자 포맷 설정</h4>

<ul>
<c:set var="num1" value="12345"/>
	<li>콤마 O : <fmt:formatNumber value="${ num1 }" /> </li>
 	<li>콤마 X : <fmt:formatNumber value="${ num1 }" groupingUsed="false"/> </li>	


<fmt:formatNumber value="${ num1 }" type="currency" var="printNum1"/>
	<li> 통화 기호 : ${ printNum1 } </li>

<fmt:formatNumber value="0.02" type="percent" var="printNum2"/>
	<li> percent : ${ printNum2 } </li>

</ul>

<h4>문자열을 숫자로 변환</h4>
<ul>
	<c:set var="num2" value="6,789.01"/>
	<fmt:parseNumber value="${ num2 }" pattern="00,000.00" var="printNum3"/>
	<li> 소수점 표현(pattern / 00,000.00) : ${ printNum3 } </li>
	
	<fmt:parseNumber value="${ num2 }" integerOnly="true" var="printNum4"/>
	<li> 정수 표현 (integerOnly true) : ${ printNum4 }</li>
</ul>


</body>
</html>
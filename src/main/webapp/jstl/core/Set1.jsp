<%@page import="common.Person"%>
<%@page import="java.util.Date"%>
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

<c:set var="directVar" value="100"></c:set>
<c:set var="elVar" value="${ direectVar div 5 }"></c:set>
<c:set var="expVar" value="<%= new Date() %>"></c:set>
<%-- value속성에 값을 대입하지 않고 변수값을 설정하는 방법  --%>
<c:set var="betweenVar">변수값 설정</c:set>


<h4>el을 사용해 변수 출력</h4>
<ul>
	<li>directVar : ${ pageScope.directVar }</li>
	<li>elVar : ${ elVar }</li>
	<li>expVar : ${ expVar }</li>
	<li>betweenVar : ${ betweenVar }</li>
</ul>

<h4>자바빈즈의 생성1 - 생성자 사용</h4>
<c:set var="personVar1" scope="request" value='<%= new Person("test1", 40) %>'></c:set>
<ul>
	<li>name : ${ requestScope.personVar1.name }</li>
	<li>age : ${ personVar1.age }</li>
</ul>

<h4>자바빈즈 생성2 - target, property 사용</h4>
<c:set var="personVar2" scope="request" value="<%= new Person() %>"></c:set>
<c:set target="${personVar2}" property="name" value="test2"/>
<c:set target="${personVar2}" property="age">20</c:set>
<ul>
	<li>name : ${ requestScope.personVar2.name }</li>
	<li>age : ${ personVar2.age }</li>
</ul>



</body>
</html>
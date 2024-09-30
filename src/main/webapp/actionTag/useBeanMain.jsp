<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>useBean 액션 태그</h2>
<h3>자바빈즈(useBean) 생성</h3>
<jsp:useBean id="person" class="common.Person" scope="request"></jsp:useBean>

<h3>자바빈즈 속성 저장 (setProperty)</h3>
<jsp:setProperty property="name" name="person" value="person1"/>
<jsp:setProperty property="age" name="person" value="100000"/>

<h3>자바빈즈 속성 읽기 (getProperty)</h3>
<ul>
	<li>name : <jsp:getProperty property="name" name="person"/> </li>
	<li>age : <jsp:getProperty property="age" name="person"/> </li>
</ul>
</body>
</html>
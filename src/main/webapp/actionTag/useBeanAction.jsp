<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>setProperty 와일드 카드 사용</h2>

<jsp:useBean id="person" class="common.Person"></jsp:useBean>
<jsp:setProperty property="*" name="person"/>

<ul>
	<li>name : <jsp:getProperty property="name" name="person"/> </li>
	<li>age : <jsp:getProperty property="age" name="person"/> </li>
</ul>

</body>
</html>
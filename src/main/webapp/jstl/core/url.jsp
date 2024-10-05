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

<h4>c:url</h4>

<c:url value="../inc/OtherPage.jsp" var="link"/>

<form method="post" action="${link }">
	param1 : <input type="text" name="user_param1">
	param2 : <input type="text" name="user_param2">
	<input type="submit" value="click"/>
</form>

</body>
</html>
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

<c:set var="requestVar" value="variable1" scope="request"/>
<c:redirect url="../inc/OtherPage.jsp">
	<c:param name="user_param1" value="param1"></c:param>
	<c:param name="user_param2" value="param2"></c:param>
</c:redirect>



</body>
</html>
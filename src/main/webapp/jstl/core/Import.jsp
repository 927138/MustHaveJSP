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

<c:set var="requestVar" value="requestVarValue" scope="request"/>
<c:import url="../inc/OtherPage.jsp" var="contents">
	<c:param name="user_param1" value="JSP"/>
	<c:param name="user_param2" value="Servlet"/>
</c:import>

<h4>page import</h4>
${ contents }
<c:import url="../inc/OtherPage.jsp"></c:import>


<h4>out</h4>
<iframe src="../inc/GoldPage.jsp" style="width:100%; height:600px;"></iframe>

</body>
</html>
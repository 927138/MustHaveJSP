<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	pageContext.setAttribute("page", "page");
	request.setAttribute("request", "request");
%>

<h2>액션 태그를 이용한 포워드 방식</h2>
<jsp:forward page="./forwardSub.jsp"></jsp:forward>

</body>
</html>
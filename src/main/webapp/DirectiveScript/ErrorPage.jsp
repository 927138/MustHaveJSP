<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="IsErrorrPage.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <%
 	int myAge = Integer.parseInt(request.getParameter("age")) + 10;
	out.println("10 year after age : " + myAge);
 %>

</body>
</html>
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
	try{
		int myAge = Integer.parseInt(request.getParameter("age")) + 10;
		out.println("10 year after age : " + myAge);
	}
	catch(Exception e){
		out.println("exception : 매개변수 age 가 null 입니다");
	}
%>

</body>
</html>
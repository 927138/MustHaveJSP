<%@page import="common.JDBCConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>JDBC(mysql) test</h2>
<%
	JDBCConnect jdbc = new JDBCConnect();
	jdbc.close();
	
	jdbc = new JDBCConnect(application);
	jdbc.close();
%>

</body>
</html>
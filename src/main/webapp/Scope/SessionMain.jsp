<%@page import="java.util.ArrayList"%>
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
	ArrayList<Integer> list = new ArrayList<>();
	for(int i=1; i<=10; i++){
		list.add(i);
	}
	session.setAttribute("IntegerList", list);
%>

<h2>페이지 이동 후 session area의 속성 읽기</h2>
<a href="SessionLocation.jsp">SessionLocation.jsp로 이동</a>


</body>
</html>
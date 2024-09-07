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

<h2>page 이동 후 session attribute에 저장된 리스트 출력하기</h2>
<%
	ArrayList<Integer> list = (ArrayList<Integer>)session.getAttribute("IntegerList");
	for(Integer i : list){
		out.print(i + "<br/>");
	}
%>

</body>
</html>
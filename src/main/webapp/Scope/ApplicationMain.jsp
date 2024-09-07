<%@page import="common.Person"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>application area</h2>
<%
	if(application.getAttribute("maps") == null){
		Map<String, Person> maps = new HashMap<>();
		maps.put("actor1", new Person("홍길동", 10000));
		maps.put("actor2", new Person("장영실", 42));
		application.setAttribute("maps", maps);
	}else{
		Map<String, Person> maps = (Map<String, Person>)application.getAttribute("maps");
		int count = maps.size() + 1;
		maps.put("actor"+count, new Person("guest"+count, count));
	}
		
%>
storage : application area Attribute

</body>
</html>
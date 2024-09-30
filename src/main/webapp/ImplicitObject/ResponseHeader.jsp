<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	SimpleDateFormat sDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	long add_date = sDate.parse(request.getParameter("date")).getTime();
	int add_int = Integer.parseInt(request.getParameter("integer"));
	String add_str = request.getParameter("string");

	response.addDateHeader("myBirth", add_date);
	response.addIntHeader("myInteger", add_int);
	response.addIntHeader("myInteger", 1234);
	
	// set() 데이터 존재 : 기존의 데이터들은 모두 사라짐
	//       데이터 존재x : add()의 기능과 동일
	// response.setIntHeader("myInteger", 4321); 
	response.addHeader("myName", add_str);
	response.setHeader("myName", "ji");
	
%>


<h2>응답 헤더 정보 출력하기</h2>

<%	
	Collection<String> headerNames = response.getHeaderNames();
	for(String headerName : headerNames){
		String responseHeaderName = response.getHeader(headerName);
%>
		<li> <%= headerName %> : <%= responseHeaderName %></li>
<%
	}
%>

<h2>response header에서 myInteger만 출력</h2>
<%
	Collection<String> myInteger = response.getHeaders("myInteger");
	for(String integer : myInteger){
%>
		<li> myInteger : <%= integer %></li>
<%
	}
%>
</body>
</html>
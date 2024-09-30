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
	int statusCode = response.getStatus();
	
	System.out.println(statusCode);
	if(statusCode == 404){
		out.print("404 error 발생 <br/>");
		out.print("파일 경로를 확인하세요");
	}else if(statusCode == 405){
		out.print("405 error 발생 <br/>");
		out.print("요청방식(method)를 확인하세요");
	}else if(statusCode == 500){
		out.print("500 error 발생 <br/>");
		out.print("소스 코드에 오류가 없는지 확인하세요");
	}
%>

</body>
</html>
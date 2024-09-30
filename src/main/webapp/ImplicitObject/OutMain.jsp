<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>out implicitObject</h2>

<% //scriptlet

	out.println("출력 x");
	out.clearBuffer();
	
	out.print("출력 버퍼의 크기 : " + out.getBufferSize() + "<br/>");
	out.print("남은 버퍼의 크기 : " + out.getRemaining() + "<br/>");
	out.flush();
	
	out.print("flush() 실행 후 남은 버퍼 크기 : " + out.getRemaining() + "<br/>");
	
	
%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- script declaration -->
<!-- 서블릿 변환 시 _jspService() method 외부에 선언 -->

<%!
	public int add(int o1, int o2){
		return o1+o2;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<!-- script Scriptlet -->
<!-- 서블릿 변환 시 _jspService() method 내부에 선언 -->
<%
	int result = add(10, 4);
%>

<h2>중요 포인트</h2>
<p>script declaration은 서블릿 변환 시 _jspService() method 외부에 선언</p>
<p>script scriptlet은 서블릿 변환 시 _jspService() method 내부에 선언</p>
<p>script expression은 "실행 경과로 하나의 값이 남는 문장" 이다</p><br/><br/><br/>


sum result = <%= result %> <br/>
sum result = <%= add(10, 10) %>



</body>
</html>
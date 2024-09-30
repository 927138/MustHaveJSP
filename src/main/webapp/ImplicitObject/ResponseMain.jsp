<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>1. 로그인 </h2>

<%
	String loginErr = request.getParameter("loginErr");
	if(loginErr != null) out.print("login fail");
%>


<form action="./ResponseLogin.jsp" method="post">
	아이디 : <input type="text" name="id" value=""><br/>
	비밀번호 : <input type="text" name="pw" value=""><br/>
	<input type="submit" value="로그인">
</form>

<h2>2. HTTP header setting </h2>

<form action="./ResponseHeader.jsp" method="get">
	날짜 형식 : <input type="text" name="date" value="ex) 2022-12-20 05:00"><br/>
	숫자 형식 : <input type="text" name="integer" value="1234"><br/>
	문자 형식 : <input type="text" name= "string" value="abcd"><br/>
	<input type="submit" value="response header setting & print">
</form>


</body>
</html>
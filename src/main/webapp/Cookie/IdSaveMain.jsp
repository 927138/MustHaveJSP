<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	String loginId = CookieManager.readCookie(request, "loginId");

	String cookieCheck = "";
	if(!loginId.equals("")){
		cookieCheck = "checked";
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>login page</h2>

<form action="./IdSaveProcess.jsp" method="post">
	아이디 : <input type="text" name="userId" value="<%= loginId %>"/>
	<input type="checkbox" name="saveCheck" value="Y" <%= cookieCheck %>/>아이디 저장하기
	<br/>
	
	비밀번호 : <input type="text" name="userPw"/><br/>
	
	<input type="submit" value="login"/> 
</form>


</body>
</html>
<%@page import="utils.JSFunction"%>
<%@page import="utils.CookieManager"%>
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
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	String idSaveCheck = request.getParameter("saveCheck");
	
	if(userId.equals("admin") && userPw.equals("1234")){
		if(idSaveCheck != null && idSaveCheck.equals("Y")){
			CookieManager.makeCookie(response, "loginId", userId, 600);
		}else{
			CookieManager.deleteCookie(response, "loginId");
		}
		
		JSFunction.alertLocation("success login", "IdSaveMain.jsp", out);
	}else{
		JSFunction.alertBack("failed login", out);
	}
%>



</body>
</html>
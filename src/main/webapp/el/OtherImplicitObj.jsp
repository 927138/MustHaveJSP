<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	for(int i=0; i<10; i++){
		CookieManager.makeCookie(response, "elCookie"+i, "helloerror"+i, 10);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3> read cookie </h3>
<li> ElCookie value : ${ cookie.elCookie.value }</li>

<h3> http header </h3>
<ul>
	<li>host : ${ header.host }</li>
	<%-- el에서 []의 사용은 특수문자 or 한국어 일때 사용한다. ( .test 와 ['test'] 는 동일한 기능을 한다.) --%>
	<li>user-agent : ${ header['user-agent'] }</li> 
	<li>cookie : ${ header.cookie }</li>
</ul>

<h3>context init parameter </h3>
<li>MysqlDriver : ${ initParam.MysqlDriver }</li>

<h3>context root </h3>
<li> ${ pageContext.request.contextPath }</li>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>한번에 mappping 하기</h3>
${ requestScope.resultValue }

<ol>
	<li>URI : ${ uri }</li>
	<li>UTL : ${ url }</li>
	<li>request Command : ${ subUri }</li>
	<li>contextPath : ${ root }</li>
	
</ol>

<ul>
	<li><a href="../servlet/register.one">회원가입</a></li>
	<li><a href="../servlet/login.one">로그인</a></li>
	<li><a href="../servlet/freeboard.one">자유게시판</a></li>
</ul>
</body>
</html>
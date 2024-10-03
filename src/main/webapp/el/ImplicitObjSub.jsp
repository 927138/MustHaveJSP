<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>Sub page</h2>
<h3>지정한 영역 속성값</h3>
<ul>
	<li> page area :  ${ pageScope.scope } </li>
	<li> request area : ${ requestScope.scope }</li>
	<li> session area : ${ sessionScope.scope } </li>
	<li> application area : ${ applicationScope.scope }</li>
</ul>

<h3>지정하지 않은 영역 속성값</h3>
<ul>
	<li> ${ scope }</li>
</ul>
</body>
</html>
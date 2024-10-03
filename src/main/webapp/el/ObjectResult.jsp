<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>영역(request)을 통해 전송된 객체</h2>
<ul>
	<li>person object : ${ personObj.name } , ${ personObj.age }</li>
	<li>string object : ${ stringObj } / ${ requestScope.stringObj }</li>
	<li>integer object : ${ integerObj } / ${ requestScope.integerObj }</li>
</ul>

<h2>parameter로 전달된 값 읽기</h2>
<ul>
	<li> param1 : ${ param1 }, ${ param.param1 }, <%= request.getParameter("param1") %></li>
	<li> param2 : ${ param.param2 }, ${ param['param2'] }</li>
</ul>
</body>
</html>
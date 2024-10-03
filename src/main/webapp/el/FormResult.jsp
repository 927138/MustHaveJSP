<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3> el로 form 값 받기</h3>
<ul>
	<li> 이름 : ${ param.name }</li>
	<li> el gender : ${ param.gender }</li>
	<li> script expression gender : <%= request.getParameter("gender") %></li>
	<li> 학력 : ${ param.grade }</li>
	<li> 관심사항 : ${ paramValues.inter[0] } ${ paramValues.inter[1] } 
				${ paramValues.inter[2] } ${ paramValues.inter[3] } </li>
</ul>
</body>
</html>
<%@ page import="el.MyElClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	 pageContext.setAttribute("myClass", new MyElClass());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>영역에 저장 후 메서드 호출하기</h3>
000000-100000 => ${ myClass.getGender("000000-100000") } <br/>
000000-200000 => ${ myClass.getGender("000000-200000") } <br/>
000000-700000 => ${ myClass.getGender("000000-700000") }

<h3>클래스명을 통해 정적 메서드 적용</h3>
${MyElClass.showGugudan(3) }

<h3>TLD 파일 등록 후 정적 메서드 호출</h3>
<ul>
	<li>myClass : isNumber("100") => ${ myClass.isNumber("100") }</li>
	<li>myClass : isNumber("한국어") => ${ myClass.isNumber("한국어") }</li>
	
</ul>

</body>
</html>
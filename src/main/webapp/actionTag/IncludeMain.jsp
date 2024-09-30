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
	String outer1 = "./OuterPage1.jsp";
	String outer2 = "./OuterPage2.jsp";
	
	pageContext.setAttribute("pAttr", "page");
	request.setAttribute("rAttr", "request");
%>
<h2>지시어와 액션태그 동작 비교</h2>

<h3>지시어로 페이지 포함하기</h3>
<%@ include file="./OuterPage1.jsp" %>
<p>외부 파일에 선언한 변수 : <%= newVar1 %></p>

<h3>액션태그로 페이지 포함하기</h3>
<jsp:include page="./OuterPage2.jsp"></jsp:include>
<p>외부 파일에 선언한 변수 : <%-- newVar2 --%></p>

</body>
</html>
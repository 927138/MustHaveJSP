<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>web.xml에 설정한 내용 읽어오기</h2>
초기화 매개변수 : <%= application.getInitParameter("INIT_PARAM") %> <br/>

<h2>서버의 물리적 경로 얻어오기</h2>
application implicit object : <%= application.getRealPath("/ImplicitObject") %><br/>

<h2>declaration : use the implicit object application </h2>
<%!
	public String useImplicitObject(){
		return this.getServletContext().getRealPath("/ImplicitObject");
	}

	public String useImplicitObject(ServletContext app){
		return app.getRealPath("/ImplicitObject");
	}
%>

<ul>
	<li>this 사용 : <%= useImplicitObject() %></li>
	<li>매개변수 사용 : <%= useImplicitObject(application) %></li>
</ul>



</body>
</html>
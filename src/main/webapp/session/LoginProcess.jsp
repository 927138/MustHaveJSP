<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
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
	String userId = request.getParameter("user_id");
	String userPw = request.getParameter("user_pw");
	
	MemberDAO dao = new MemberDAO(application);
	MemberDTO dto = dao.getMemberDTO(userId, userPw);
	dao.close();
	
	if(dto.getId() != null){
		session.setAttribute("UserId", dto.getId());
		session.setAttribute("UserName", dto.getName());
		response.sendRedirect("./LoginForm.jsp");
	}else{
		request.setAttribute("LoginErrMsg", "login error");
		request.getRequestDispatcher("./LoginForm.jsp")
				.forward(request, response);
	}
	
%>


</body>
</html>
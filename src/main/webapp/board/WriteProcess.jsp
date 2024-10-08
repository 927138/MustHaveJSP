<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedin.jsp" %>

<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BoardDTO dto = new BoardDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setId(session.getAttribute("UserId").toString());
	
	BoardDAO dao = new BoardDAO(application);
	int result = dao.insertWrite(dto);
	dao.close();
	
	if(result == 1){
		response.sendRedirect("List.jsp");
	}else{
		JSFunction.alertBack("글쓰기 실패", out);
	}
%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedin.jsp"%>

<%
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BoardDTO dto = new BoardDTO();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	
	BoardDAO dao = new BoardDAO(application);
	int result = dao.updateEdit(dto);
	dao.close();
	
	if(result == 1){
		response.sendRedirect("./View.jsp?num="+num);
		
	}else{
		JSFunction.alertBack("수정 실패", out);
	}
%>

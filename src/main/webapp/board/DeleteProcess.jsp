<%@page import="utils.JSFunction"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedin.jsp" %>
<%
	String num = request.getParameter("num");
	
	BoardDAO dao = new BoardDAO(application);
	BoardDTO dto = dao.selectView(num);
	
	String sessionId = session.getAttribute("UserId").toString();
	int deleteResult = 0;
	
	if(sessionId.equals(dto.getId())){
		dto.setNum(num);
		deleteResult = dao.deletePost(dto);
		dao.close();
		
		if(deleteResult == 1){
			JSFunction.alertLocation("success : delete post", "./List.jsp", out);
		}else{
			JSFunction.alertBack("failed : delete post", out);
		}
	}else{
		JSFunction.alertBack("본인만 삭제 가능", out);
		return;
	}
	
%>
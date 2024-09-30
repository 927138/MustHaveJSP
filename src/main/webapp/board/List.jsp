<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%
	BoardDAO dao = new BoardDAO(application);
	Map<String, Object> param = new HashMap<>();
	
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	if(searchWord != null){
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	
	int totalCount = dao.selectCount(param);
	List<BoardDTO> boardLists = dao.selectList(param);
	dao.close();
%>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="../common/Link.jsp" />


<h2>목록 보기</h2>
<form method="get">
<table border="1" width="90%">
	<tr>
		<td align="center">
			<select name="searchField">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			
			<input type="text" name="searchWord"/>
			<input type="submit" value="검색하기" />
		</td>
	</tr>
</table>
</form>

<table border="1" width="90%">
<tr>
	<td width="10%">번호</td>
	<td width="50%">제목</td>
	<td width="15%">작성자</td>
	<td width="10%">조회수</td>
	<td width="15%">작성일</td>
</tr>

<% 
	if(boardLists.isEmpty()){
%>
<tr>
	<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
</tr>
<%
	}else{
		int virtualNum = 0;
		for(BoardDTO dto : boardLists){
			virtualNum = totalCount--;
%>
			<tr align="center">
				<td><%= virtualNum %></td>
				<td align="left"> <a href="View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a>
				</td>
				<td><%= dto.getId() %></td>
				<td><%= dto.getVisitcount() %></td>
				<td><%= dto.getPostdate() %></td>
			</tr>

<%		}
	}
%>
</table>

<table border="1" width="90%">
	<tr align="right">
		<td>
			<button type="button" onclick="location.herf='Write.jsp';">글쓰기</button>
		</td>
	</tr>
</table>
</body>
</html>
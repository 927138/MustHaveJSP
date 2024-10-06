<%@page import="java.net.URLEncoder"%>
<%@page import="fileupload.MyFileDAO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="fileupload.MyFileDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
	MyFileDAO dao = new MyFileDAO(application);
	List<MyFileDTO> fileList = dao.myFileList();
	dao.close();
%>

<body>
<h2>DB에 등록된 파일 목록 보기</h2>

<a href="./FileUploadMain.jsp">single / file upload</a> <br/>
<a href="./MultiFileUploadMain.jsp">multy / file upload</a>

<table border="1">
	<c:forEach items="<%= fileList %>" var="e">
		<tr>
			<td>${ e.idx }</td>
			<td>${ e.title }</td>
			<td>${ e.cate }</td>
			<td>${ e.ofile }</td>
			<td>${ e.sfile }</td>
			<td>${ e.postdate }</td>
			<td>
				<a href="Download.jsp?oName=${ URLEncoder.encode(e.ofile, 'UTF-8') }&sName=${ URLEncoder.encode(e.sfile, 'UTF-8') }">Download</a>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>
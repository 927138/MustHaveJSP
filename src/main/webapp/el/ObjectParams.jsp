<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("personObj", new Person("name", 33));
	request.setAttribute("stringObj", "im string");
	request.setAttribute("integerObj", new Integer(10));
%>

<jsp:forward page="./ObjectResult.jsp">
	<jsp:param value="10" name="param1"/>
	<jsp:param value="20" name="param2"/>
</jsp:forward>

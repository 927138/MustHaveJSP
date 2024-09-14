<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
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

try{
	String driver = "com.mysql.cj.jdbc.Driver";
	Class.forName(driver);
	
	
	String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&serverTimezone=Asia/Seoul";
	String user = "root";
	String password = "1234";
	
	Connection conn = DriverManager.getConnection(url, user, password);
	
	String query = "select * from Members";
	PreparedStatement pstmt = conn.prepareStatement(query);
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()){
		out.print(rs.getString(1) + "<br/>");
		out.print(rs.getString(2) + "<br/>");
		out.print(rs.getString(3) + "<br/>");
		out.print(rs.getString(4) + "<br/>");
	}
	
	
	
}catch(ClassNotFoundException e){
	e.printStackTrace();
}catch(SQLException e){
	e.printStackTrace();
}

	
	
%>

qweqwe
</body>
</html>
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
	String chkVal = request.getParameter("inactiveToday");

	if(chkVal != null && chkVal.equals("1")){
		Cookie c = new Cookie("PopupClose", "off");
		c.setPath(request.getContextPath());
		c.setMaxAge(24*60*60);
		response.addCookie(c);
		out.print("success add cookie");
	}
%>



</body>
</html>
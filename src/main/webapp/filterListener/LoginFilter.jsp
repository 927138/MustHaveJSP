<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>login page</h2>
<span style="color:red; font-size:1.2em;">
	<%=
		request.getAttribute("LoginErrMsg") == null ?
				"" : request.getAttribute("LoginErrMsg")
	%>
</span>

<%
	if(session.getAttribute("UserId") == null){
		
%>
	<script type="text/javascript">
		function validation(form) {
			if(form.UserId.value == ""){
				alert("input id");
				form.userId.focus();
				return false;;
			}
			
			if(form.UserPw.value == ""){
				alert("input pw");
				form.userPw.focus();
				return false;
			}
		}
			
	</script>
	
	<form onsubmit="return validation(this);" method="post" name="loginFrm">
		<input type="hidden" name="backUrl" value="${ param.backUrl }"/>
		id : <input type="text" name="UserId"/> <br/>
		pw : <input type="password" name="UserPw"/> <br/>
		<input type="submit" value="submit"/>
	</form>

<%
	}else{
		
%>
	<%= session.getAttribute("UserId") %> <br/>
	<a href="?mode=logout">logout</a>		
<%
	}
%>

</body>
</html>
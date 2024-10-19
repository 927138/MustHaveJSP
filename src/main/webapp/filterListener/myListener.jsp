<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
	String mode = request.getParameter("mode");

	out.print(mode);
	if(mode != null && mode.equals("1")){
		session.setAttribute("mySession", "create session");
	}else if(mode != null && mode.equals("2")){
		session.removeAttribute("mySession");
	}else if( mode != null && mode.equals("3")){
		session.invalidate();
	}
%>

<script type="text/javascript">
	function formSubmit(form, modeValue) {
		form.mode.value = modeValue;
		form.submit();
	}
</script>

<body>


<h2>listener activate</h2>

<form>
	<input type="hidden" name="mode"/>

	<input type="button" value="session attribute add" onclick="return formSubmit(this.form, 1); "/>
	<input type="button" value="session attribute remove" onclick="return formSubmit(this.form, 2); "/>
	<input type="button" value="session attribute removeAll" onclick="return formSubmit(this.form, 3); "/>
</form>

</body>
</html>
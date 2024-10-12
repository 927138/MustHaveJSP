<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">
	function formSubmit(form, formMethod) {
		if(formMethod == 1){
			form.method = "get";
		}else if(formMethod == 2){
			form.method = "post";
		}
		
		form.submit();
	}
</script>
<body>

<h2>web.xml filter mapping</h2>
<form>
${ param.backUrl }
	<input type="button" value="get" onclick="return formSubmit(this.form, 1); "/>
	<input type="button" value="post" onclick="return formSubmit(this.form, 2); "/>
</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
	function requestAction(form, index) {
		if(index == 0){
			form.method = 'get';
		}else if(index == 1){
			form.method = 'post';
		}form.submit();
	}
</script>


<h2>servlet Life Cycle method</h2>
<form action="./lifeCycle.do">
	<input type="button" value="get(0) button" onclick="requestAction(this.form, 0)"/>
	<input type="button" value="post(1) button" onclick="requestAction(this.form, 1)"/>
</form>

</body>
</html>
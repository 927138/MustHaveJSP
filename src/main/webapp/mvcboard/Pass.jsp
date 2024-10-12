<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">
	function validation(form) {
		if(form.pass.value==""){
			alert("pass 입력하세여");
			form.pass.focus();
			return false;
		}
	}
</script>
<body>

<h2>비밀번호 검증 페이지</h2>
<form action="../mvcboard/pass.do" method="post" onsubmit="return validation(this);">
	<input type="hidden" name="mode" value="${ param.mode }"/>
	<input type="hidden" name="idx" value="${ param.idx }">
	
	${ param.mode } ${ param.idx }
	<table border="1">
		<tr>
			<td>pass</td>
			<td><input type="text" name="pass" style="width:100px;"/></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<button type="submit"> 검증하기</button>
				<button type="reset">reset</button>
				<button type="button" onclick="location.href='../mvcboard/list.do'">리스트 목록</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
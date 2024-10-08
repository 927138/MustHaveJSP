<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function validateForm(form) {
	if(form.title.value == ""){
		alert("제목을 입력하세요");
		form.title.focus();
		return false;
	}
	
	if(form.content.value == ""){
		alert("내용을 입력하세요");
		form.content.focus();
		return false;
	}
}
</script>
</head>
<body>

<jsp:include page="../common/Link.jsp"></jsp:include>
<form name="writeFrm" method="post" action="WriteProcess.jsp" onsubmit="retrun validateFrom(this)">
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" style="width : 80%;"/></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content" style="width : 80%; height: 100px;"></textarea></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<button type="submit">작성 완료</button>
				<button type="reset">다시 입력</button>
				<button type="button" onclick="location.href='./List.jsp';">목록보기</button>
			</td>
		</tr>
	</table>
</form>

</body>
</html>
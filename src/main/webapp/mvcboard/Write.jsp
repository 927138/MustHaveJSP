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
		if(form.name.value == ""){
			alert("name field value is null");
			form.name.focus();
			return false;
		}
		if(form.title.value == ""){
			alert("title field value is null");
			form.title.focus();
			return false;
		}
		if(form.content.value == ""){
			alert("content field value is null");
			form.content.focus();
			return false;
		}
		if(form.pass.value == ""){
			alert("pass field value is null");
			form.pass.focus();
			return false;
		}
	}
</script>

<body>

<h2>파일 첨부형 게시판 글쓰기</h2>
<form method="post" enctype="multipart/form-data" action="../mvcboard/write.do"
	onsubmit="return validation(this);">
<table border="1" width="90%">
	<tr>
		<td>작성자</td>
		<td> <input name="name" type="text" style="width:150px;"/> </td>
	</tr>
	<tr>
		<td>제목</td>
		<td> <input name="title" type="text" style="width:90%;"/> </td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name="content" style="width:90%; height:100px;"></textarea></td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td><input type="file" name="ofile"/></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pass" style="width:100px;"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">작성완료</button>
			<button type="reset">reset</button>
			<button type="button" onclick="location.href='../mvcboard/list.do';">목록</button>
		</td>
	</tr>
</table>
</form>		

</body>
</html>
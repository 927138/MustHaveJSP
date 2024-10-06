<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script>
	function vaildation(form) {
		if(form.title.value == ""){
			alert("제목을 입력");
			form.title.focus();
			return false;
		}
		if(form.attachedFile.value == ""){
			alert("파일 첨부 하세요");
			return false;
		}
	}
</script>

<body>

<h3>multy 파일 업로드</h3>
<span style="color:red;">${ errorMessage }</span>
<form action="MultiUploadProcess.do" name="fileForm" method="post"
		onsubmit="return vaildation(this);" enctype="multipart/form-data">
	제목 : <input type="text" name="title"/> <br/>
	카테고리(선택) : 
		<input type="checkbox" name="cate" value="사진" checked/> 사진
		<input type="checkbox" name="cate" value="과제" /> 과제
		<input type="checkbox" name="cate" value="워드" /> 워드
		<input type="checkbox" name="cate" value="음원" /> 음원 <br/>
	첨부 파일 : <input type="file" name="ofile" multiple="multiple"/> <br/>
	
	<input type="submit" value="submit"/>
</form>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>form request</h2>
<form name="frm" method="post" action="./FormResult.jsp">
	이름 : <input type="text" name="name"/><br/>
	성별 : <input type="radio" name="gender" value="여자"/> 
		  <input type="radio" name="gender" value="남자"/> <br>
	학력 : <select name="grade">
			<option value="ele">초등</option>
			<option value="mid">중등</option>
			<option value="high">고등</option>
			<option value="uni">대학</option>
		</select> <br/>
	관심사항 : <input type="checkbox" name="inter" value="pol"/> 정치
			<input type="checkbox" name="inter" value="eco"/> 경제
			<input type="checkbox" name="inter" value="ent"/> 연예
			<input type="checkbox" name="inter" value="spo"/> 운동 <br/>
	<input type="submit" value="submit"/>
</form>

</body>
</html>
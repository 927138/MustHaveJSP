<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">
	function chatWinOpen() {
		var id = document.getElementById("chatId");
		if(id.value == ""){
			alert("대화명을 입력 후 채팅창을 열어주세여");
			id.focus();
			return;
		}
		
		window.open("chatWindow.jsp?chatId=" + id.value, "", "width=320,height=400");
		id.value="";
	}
	
</script>
<body>

<h2>webSocket Chat</h2>
대화명 : <input type="text" id="chatId"/>
<button onclick="return chatWinOpen();">채팅 참여</button><br/>

<%
	Enumeration<String> s = session.getAttributeNames();

	while(s.hasMoreElements()){
		
		String t1 = s.nextElement();
		String t2 = session.getAttribute(t1).toString();
		
		System.out.println(t1 + " , " + t2);
	}

	
	for(Cookie c : request.getCookies()){
		System.out.println(c.getName());
	}
	
	
%>

</body>
</html>
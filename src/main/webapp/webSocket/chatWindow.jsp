<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>  <!-- 대화창 스타일 지정 -->  
	#chatWindow{border:1px solid black; width:270px; height:310px; overflow:scroll; padding:5px;}
	#chatMessage{width:236px; height:30px;}
	#sendBtn{height:30px; position:relative; top:2px; left:-2px;}
	#closeBtn{margin-bottom:3px; position:relative; top:2px; left:-2px;}
	#chatId{width:158px; height:24px; border:1px solid #AAAAAA; background-color:#EEEEEE;}
	.myMsg{text-align:right;}
</style>

<script type="text/javascript">
	var webSocket = new WebSocket("<%= application.getInitParameter("CHAT_ADDR") %>/ChatingServer");
	var chatWindow, chatMessage, chatId;
	
	
	// 채팅창 접근 시 기본 변수 할당
	window.onload = function() {
		chatWindow = document.getElementById("chatWindow");
		chatMessage = document.getElementById("chatMessage");
		chatId = document.getElementById('chatId').value;
	}
	
	
	// message 전송
	function sendMessage() {
		chatWindow.innerHTML +=  "<div class='myMsg'>" + "me : " + chatMessage.value + "</div>";
		webSocket.send(chatId + ':' + chatMessage.value);
		chatMessage.value = "";
		chatWindow.scrollTop = chatWindow.scrollHeight;
	}
	
	// js -> WebSocket 
	// element (open, close, message, error)
	
	// 서버 연결 종료
	function disconnect() {
		webSocket.close();
	}
	
	function entryKey() {
		if(window.event.keyCode == 13){
			sendMessage();
		}
	}
	
	webSocket.onopen = function(event) {
		chatWindow.innerHTML += "웹 소켓 서버에 연결. <br/>";
	}
	
	webSocket.onclose = function(event) {
		chatWindow.innerHTML += "웹 소켓 서버 종료. <br/>";
	}
	
	webSocket.onerror = function(event) {
		alert(event.data);
		chatWindow.innerHTML += "채팅 중 에러 발생. <br/>";
	}
	
	webSocket.onmessage = function(event) {
		var message = event.data.split(":");
		var sender = message[0];
		var content = message[1];
	
		if(content != ""){
			if(content.match("/")){
				if(content.match(("/" + chatId))){
					var temp = content.replace(("/"+chatId), "[귓속말] : ");
					chatWindow.innerHTML += "<div>" + sender + "" + temp + "</div>";
				}
			}else{
				chatWindow.innerHTML += "<div>" + sender + " : "+ content + "</div>";
			}
		}
			chatWindow.scrollTop = chatWindow.scrollHeight;
	}
	
	
</script>

<body>

이름 : <input type="text" id="chatId" value="${ param.chatId }" readonly />
<button id="closeBtn" onclick="disconnect();">채팅 종료</button>
<div id="chatWindow"></div>
<div>
	<input type="text" id="chatMessage" onkeyup="enterKey();">
	<button id="sendBtn" onclick="sendMessage();">전송</button>
</div>
</body>
</html>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Java API for WebSocket (JSR-356)</title>  
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="http://apps.bdimg.com/libs/sockjs-client/0.3.4/sockjs.min.js"></script>

<% 
	String serverName = request.getLocalName();
	int serverPort = request.getLocalPort();
%>
</head>
<body>
<script>
	var websocket = null;
	if ('WebSocket' in window) {
		console.log("1");
		websocket = new WebSocket("ws://${server}/chatMessageServer");
	} else if ('MozWebSocket' in window) {
		console.log("2");
		websocket = new MozWebSocket("ws://${server}/chatMessageServer");
	} else {
		console.log("3");
		websocket = new SockJS("http://${server}/chatMessageServer");
	}
	console.log(websocket);
	websocket.onopen = onOpen;
	websocket.onmessage = onMessage;
	websocket.onerror = onError;
	websocket.onclose = onClose;
	function onOpen(openEvt) {
		console.log(openEvt.Data);
		alert(openEvt.Data);
	}
	function onMessage(evt) {
		alert(evt.data);
	}
	function onError() {}
	function onClose() {}
	
	function doSend() {
		if (websocket.readyState == websocket.OPEN) {  	
			var msg = document.getElementById("inputMsg").value;  
            websocket.send(msg);//调用后台handleTextMessage方法
            alert("发送成功!");  
        } else {
        	alert("连接失败!");  
        }
	}
</script>
请输入：<textarea rows="5" cols="10" id="inputMsg" name="inputMsg"></textarea>
<input onclick="doSend()" type="button" value="发送" />
</body>
</html>
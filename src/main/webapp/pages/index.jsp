<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Video Conferencing App</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<body>
	<div>
		<input type="text" id="messageInput" placeholder="Type your message" />
		<button onclick="sendMessage()">Send</button>
	</div>
	<div id="videoMessages"></div>

	<script>
		let userName;
		var stompClient = null;
		$("#messageInput").on('keyup', function(e) {
			if (e.which == 13) {
				sendMessage();
			}
		});

		function setConnected(connected) {
			if (connected) {
				console.log('Connected');
			} else {
				console.log('Disconnected');
			}
		}

		function connect() {
			var socket = new SockJS('/ShoppeeWebApp/websocket');
			stompClient = Stomp.over(socket);
			stompClient.connect({}, function(frame) {
				setConnected(true);
				console.log('Connected: ' + frame);
				stompClient.subscribe('/topic/video', function(response) {
					showMessage(response.body);
				});
			});
		}

		function disconnect() {
			if (stompClient !== null) {
				stompClient.disconnect();
			}
			setConnected(false);
			console.log('Disconnected');
		}

		function sendMessage() {
			var message = userName + ' : ' + $('#messageInput').val();
			stompClient.send("/app/sendMessage", {}, message);
			$('#messageInput').val('');
		}

		function showMessage(message) {
			$('#videoMessages').append('<p>' + message + '</p>');
		}

		$(function() {
			if (sessionStorage.getItem('sessionUserName') == ""
					|| sessionStorage.getItem('sessionUserName') == null) {
				location.href = "login";
				return false;
			}
			userName = sessionStorage.getItem('sessionUserName');
			sessionStorage.clear();
			connect();
		});
	</script>
</body>
</html>

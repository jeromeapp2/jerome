<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Form</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
}

form {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 300px;
}

label {
	display: block;
	margin-bottom: 8px;
}

input {
	width: 100%;
	padding: 8px;
	margin-bottom: 16px;
	box-sizing: border-box;
}

button {
	background-color: #4caf50;
	color: #fff;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 100%;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<body>

	<form action="#" method="post" id="loginForm">
		<label for="username">Username:</label> <input type="text"
			id="username" name="username" required> <label for="password">Password:</label>
		<input type="password" id="password" name="password" required>

		<button type="button" onclick="login()">Login</button>
	</form>

	<script>
		function createUsers() {
			// User names should be strings, so enclose them in quotes
			let users = [ 'Jerome', 'Jas', 'Ron', 'Gin' ];

			// Convert the array to a JSON string and store it in session storage
			sessionStorage.setItem('usernames', JSON.stringify(users));
		}

		function checkUser(username) {
			let storedUsernames = JSON.parse(sessionStorage
					.getItem('usernames'));
			for (var i = 0; i < storedUsernames.length; i++) {
				if (username === storedUsernames[i]) {
					return true;
				}
			}
			return false;
		}
		function login() {
			var username = document.getElementById('username').value;
			var password = document.getElementById('password').value;

			if (checkUser(username)) {
				if (password === 'P@ssword123') {
					sessionStorage.setItem('sessionUserName', username);
					location.href = "Message";
				}
			} else {
				alert('Invalid username or password');
			}
		}
		$("#password").on('keypress', function(e) {
			if (e.keyCode == 13) {
				login();
			}
		});
		createUsers();
	</script>
</body>
</html>

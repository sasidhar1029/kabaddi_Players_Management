<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// 🔐 If already logged in, redirect to home
if (session.getAttribute("username") != null) {
	response.sendRedirect("home.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login | Kabaddi Players Management</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	height: 100vh;
	background: linear-gradient(135deg, #667eea, #764ba2);
	display: flex;
	align-items: center;
	justify-content: center;
	font-family: 'Poppins', sans-serif;
	transition: background 0.3s;
}

body.dark {
	background: linear-gradient(135deg, #1f1c2c, #928dab);
}

.login-box {
	background: #fff;
	padding: 35px;
	width: 400px;
	border-radius: 16px;
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.25);
	transition: background 0.3s, color 0.3s;
}

body.dark .login-box {
	background: #2c2c2c;
	color: #fff;
}

.login-box h2 {
	text-align: center;
	color: #0d6efd;
	margin-bottom: 20px;
	font-weight: 600;
}

body.dark h2 {
	color: #0dcaf0;
}

.form-control {
	margin-bottom: 15px;
	padding: 12px;
}

.btn-login {
	width: 100%;
	padding: 12px;
	font-size: 16px;
	border-radius: 8px;
}

.toggle-btn {
	position: absolute;
	right: 15px;
	top: 38px;
	cursor: pointer;
	font-size: 14px;
	color: #0d6efd;
}

.mode-toggle {
	text-align: right;
	margin-bottom: 10px;
	cursor: pointer;
	font-size: 14px;
	color: #555;
}

body.dark .mode-toggle {
	color: #ddd;
}

.links {
	display: flex;
	justify-content: space-between;
	margin-bottom: 15px;
	font-size: 14px;
}
</style>
</head>

<body>

	<div class="login-box position-relative">

		<!-- 🌗 Light / Dark Mode -->
		<div class="mode-toggle" id="modeToggle" onclick="toggleMode()">
			🌙 Dark Mode</div>

		<h2>🔐 Login</h2>

		<!-- ❌ Server-side Error -->
		<%
		if ("invalid".equals(request.getParameter("error"))) {
		%>
		<div class="alert alert-danger text-center">Invalid Username or
			Password</div>
		<%
		}
		%>


		<!-- ✅ Login Form -->
		<form action="login" method="post" onsubmit="return validateLogin()">

			<input type="text" id="username" name="username" class="form-control"
				placeholder="Enter Username">

			<div class="position-relative">
				<input type="password" id="password" name="password"
					class="form-control" placeholder="Enter Password"> <span
					class="toggle-btn" onclick="togglePassword()">Show</span>
			</div>

			<div class="links">
				<a href="register.jsp">New user? Register</a> <a href="#"
					data-bs-toggle="modal" data-bs-target="#forgotModal"> Forgot
					Password? </a>
			</div>

			<button class="btn btn-primary btn-login">Login</button>
		</form>
	</div>

	<!-- 🔐 Forgot Password Modal -->
	<div class="modal fade" id="forgotModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Forgot Password</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<div class="modal-body">
					<form action="forgotPassword" method="post">
						<div class="mb-3">
							<label class="form-label">Username or Email</label> <input
								type="text" name="user" class="form-control" required>
						</div>

						<button class="btn btn-primary w-100">Reset Password</button>
					</form>
				</div>

			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		// ✅ Client-side Validation
		function validateLogin() {
			const username = document.getElementById("username").value.trim();
			const password = document.getElementById("password").value.trim();

			if (username === "") {
				alert("Username is required");
				return false;
			}

			if (password === "") {
				alert("Password is required");
				return false;
			}

			if (password.length < 6) {
				alert("Password must be at least 6 characters");
				return false;
			}

			return true;
		}

		// 👁 Show / Hide Password
		function togglePassword() {
			const pwd = document.getElementById("password");
			event.target.innerText = pwd.type === "password" ? "Hide" : "Show";
			pwd.type = pwd.type === "password" ? "text" : "password";
		}

		// 🌗 Light / Dark Mode Toggle
		function toggleMode() {
			const body = document.body;
			const toggle = document.getElementById("modeToggle");

			body.classList.toggle("dark");

			if (body.classList.contains("dark")) {
				toggle.innerHTML = "☀️ Light Mode";
			} else {
				toggle.innerHTML = "🌙 Dark Mode";
			}
		}
	</script>

</body>
</html>

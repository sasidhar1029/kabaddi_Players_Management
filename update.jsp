<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.hostel.dao.*,com.hostel.model.*"%>

<%
// 🔐 Session check
String user = (String) session.getAttribute("username");
if (user == null) {
	response.sendRedirect("login.jsp");
	return;
}

Student s = new StudentDAOImpl().getStudentByUsername(user);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile | Kabaddi Players Management</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	min-height: 100vh;
	background: linear-gradient(135deg, #ffecd2, #fcb69f);
	display: flex;
	align-items: center;
	justify-content: center;
	font-family: 'Poppins', sans-serif;
}

.update-box {
	background: #fff;
	width: 430px;
	padding: 35px;
	border-radius: 15px;
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
	animation: fadeIn 0.5s ease-in;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(15px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.update-box h2 {
	text-align: center;
	color: #fd7e14;
	font-weight: 600;
	margin-bottom: 20px;
}

.form-control {
	margin-bottom: 15px;
	padding: 12px;
}

.btn-update {
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
	color: #fd7e14;
}
</style>
</head>

<body>

	<div class="update-box">
		<h2>✏️ Update Profile</h2>

		<form action="update" method="post" onsubmit="return validateUpdate()">

			<input type="text" id="name" name="name" class="form-control"
				value="<%=s.getName()%>" placeholder="Full Name"> <input
				type="email" id="email" name="email" class="form-control"
				value="<%=s.getEmail()%>" placeholder="Email Address">

			<div class="position-relative">
				<input type="password" id="password" name="password"
					class="form-control"
					placeholder="Enter new password (leave blank to keep old)">

				<span class="toggle-btn" onclick="togglePassword()">Show</span>
			</div>

			<button class="btn btn-warning btn-update mt-3">Update
				Profile</button>
		</form>

		<div class="text-center mt-3">
			<a href="home.jsp">⬅ Back to Home</a>
		</div>
	</div>

	<script>
		// ✅ Client-side Validation
		function validateUpdate() {

			const name = document.getElementById("name").value.trim();
			const email = document.getElementById("email").value.trim();
			const pwd = document.getElementById("password").value;

			const nameRegex = /^[A-Za-z ]+$/;
			const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

			if (name === "") {
				alert("Name is required");
				return false;
			}

			if (!nameRegex.test(name)) {
				alert("Name should contain only letters");
				return false;
			}

			if (!emailRegex.test(email)) {
				alert("Please enter a valid email address");
				return false;
			}

			if (pwd.length < 6) {
				alert("Password must be at least 6 characters");
				return false;
			}

			return true;
		}

		// 👁 Show / Hide Password
		function togglePassword() {
			const pwd = document.getElementById("password");
			const btn = event.target;

			if (pwd.type === "password") {
				pwd.type = "text";
				btn.innerText = "Hide";
			} else {
				pwd.type = "password";
				btn.innerText = "Show";
			}
		}
	</script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String user = (String) session.getAttribute("username");
if (user == null) {
	response.sendRedirect("login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home | Hostel Management</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	min-height: 100vh;
	background: linear-gradient(135deg, #74ebd5, #9face6);
	font-family: 'Poppins', sans-serif;
	display: flex;
	align-items: center;
	justify-content: center;
}

.dashboard {
	background: white;
	width: 420px;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
	text-align: center;
}

.dashboard h2 {
	color: #0d6efd;
	margin-bottom: 10px;
	font-weight: 600;
}

.welcome {
	color: #555;
	margin-bottom: 25px;
}

.btn-custom {
	width: 100%;
	margin-bottom: 12px;
	font-size: 16px;
	padding: 10px;
	border-radius: 8px;
}

.logout-btn {
	background: #dc3545;
	color: white;
}

.logout-btn:hover {
	background: #bb2d3b;
}
</style>
</head>

<body>

	<div class="dashboard">
		<h2>Hostel Dashboard</h2>
		<p class="welcome">
			Welcome, <strong><%=user%></strong> 👋
		</p>

		<a href="profile.jsp" class="btn btn-primary btn-custom">View
			Profile</a> <a href="update.jsp" class="btn btn-warning btn-custom">Update
			Profile</a> <a href="delete.jsp" class="btn btn-danger btn-custom">Delete
			Account</a> <a href="logout.jsp"
			class="btn btn-dark btn-custom logout-btn">Logout</a> <a
			href="viewPlayers" class="btn btn-success btn-custom"> View All
			Players </a>

	</div>

</body>
</html>

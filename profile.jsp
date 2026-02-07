<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.hostel.dao.*,com.hostel.model.*" %>

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
<title>Profile | Kabaddi Players Management</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>
    body {
        min-height: 100vh;
        background: linear-gradient(135deg, #ff512f, #dd2476);
        display: flex;
        align-items: center;
        justify-content: center;
        font-family: 'Poppins', sans-serif;
        transition: background 0.3s;
    }

    body.dark {
        background: linear-gradient(135deg, #1f1c2c, #928dab);
    }

    .profile-card {
        background: #fff;
        width: 440px;
        padding: 32px;
        border-radius: 18px;
        box-shadow: 0 18px 35px rgba(0,0,0,0.25);
        animation: fadeIn 0.5s ease-in;
        transition: background 0.3s, color 0.3s;
    }

    body.dark .profile-card {
        background: #2c2c2c;
        color: #fff;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(15px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .profile-card img {
        width: 100px;
        margin-bottom: 15px;
        display: block;
        margin-left: auto;
        margin-right: auto;
    }

    .profile-card h2 {
        text-align: center;
        color: #dc3545;
        margin-bottom: 20px;
        font-weight: 600;
    }

    body.dark h2 {
        color: #0dcaf0;
    }

    .info {
        font-size: 16px;
        margin-bottom: 12px;
        color: #444;
    }

    body.dark .info {
        color: #ddd;
    }

    .info span {
        font-weight: 600;
        color: #000;
    }

    body.dark .info span {
        color: #fff;
    }

    .btn-group-custom a {
        width: 100%;
        margin-top: 10px;
    }

    .mode-toggle {
        text-align: right;
        font-size: 14px;
        cursor: pointer;
        color: #555;
        margin-bottom: 10px;
    }

    body.dark .mode-toggle {
        color: #ddd;
    }
</style>
</head>

<body>

<div class="profile-card">

    <!-- 🌗 Light / Dark Mode -->
    <div class="mode-toggle" id="modeToggle" onclick="toggleMode()">
        🌙 Dark Mode
    </div>

    <!-- 🏋️ Kabaddi Player Image -->
    <img src="https://cdn-icons-png.flaticon.com/512/3048/3048397.png"
         alt="Kabaddi Player">

    <h2>Player Profile</h2>

    <div class="info">
        <span>Name:</span> <%= s.getName() %>
    </div>

    <div class="info">
        <span>Username:</span> <%= s.getUsername() %>
    </div>

    <div class="info">
        <span>Email:</span> <%= s.getEmail() %>
    </div>

    <div class="btn-group-custom">
        <a href="home.jsp" class="btn btn-primary">Back to Dashboard</a>
        <a href="update.jsp" class="btn btn-warning">Update Player</a>
        <a href="logout.jsp" class="btn btn-dark">Logout</a>
    </div>
</div>

<script>
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

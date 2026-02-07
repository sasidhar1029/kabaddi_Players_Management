<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // 🔐 Session check
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
<title>Delete Player | Kabaddi Players Management</title>

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
    }

    .delete-box {
        background: #fff;
        width: 440px;
        padding: 35px;
        border-radius: 18px;
        box-shadow: 0 18px 35px rgba(0,0,0,0.25);
        text-align: center;
        animation: fadeIn 0.5s ease-in;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(15px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .delete-box img {
        width: 100px;
        margin-bottom: 15px;
    }

    .delete-box h2 {
        color: #dc3545;
        font-weight: 600;
        margin-bottom: 12px;
    }

    .delete-box p {
        color: #555;
        margin-bottom: 25px;
        font-size: 15px;
    }

    .btn-custom {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        border-radius: 10px;
        margin-bottom: 10px;
    }
</style>
</head>

<body>

<div class="delete-box">

    <!-- 🏋️ Kabaddi Players Image -->
    <img src="https://cdn-icons-png.flaticon.com/512/3048/3048397.png"
         alt="Kabaddi Players">

    <h2>⚠️ Delete Player</h2>

    <p>
        Are you sure you want to permanently delete this player profile?<br>
        <strong>This action cannot be undone.</strong>
    </p>

    <form action="delete" method="post">
        <button class="btn btn-danger btn-custom">
            Yes, Delete Player
        </button>
    </form>

    <a href="home.jsp" class="btn btn-secondary btn-custom">
        Cancel
    </a>
</div>

</body>
</html>

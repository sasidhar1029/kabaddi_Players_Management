<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // 🔐 Invalidate session
    if (session != null) {
        session.invalidate();
    }

    // 🚫 Prevent back-button cache
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout | Hostel Management</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>
    body {
        height: 100vh;
        background: linear-gradient(135deg, #ff9a9e, #fad0c4);
        display: flex;
        align-items: center;
        justify-content: center;
        font-family: 'Poppins', sans-serif;
    }

    .logout-box {
        background: #fff;
        padding: 40px;
        border-radius: 15px;
        text-align: center;
        box-shadow: 0 15px 30px rgba(0,0,0,0.2);
        width: 380px;
        animation: fadeIn 0.6s ease-in;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(15px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .logout-box h2 {
        color: #dc3545;
        font-weight: 600;
        margin-bottom: 15px;
    }

    .logout-box p {
        color: #555;
        margin-bottom: 20px;
    }

    .countdown {
        font-size: 14px;
        color: #888;
        margin-bottom: 20px;
    }

    .btn-login {
        width: 100%;
        font-size: 16px;
        padding: 10px;
    }
</style>
</head>

<body>

<div class="logout-box">
    <h2>Logged Out Successfully</h2>
    <p>You have been logged out of your account.</p>

    <div class="countdown">
        Redirecting to login in <span id="sec">5</span> seconds...
    </div>

    <a href="login.jsp" class="btn btn-primary btn-login">
        Go to Login Now
    </a>
</div>

<script>
    // ⏱ Auto redirect after 5 seconds
    let time = 5;
    const sec = document.getElementById("sec");

    setInterval(() => {
        time--;
        sec.innerText = time;
        if (time === 0) {
            window.location.href = "login.jsp";
        }
    }, 1000);
</script>

</body>
</html>

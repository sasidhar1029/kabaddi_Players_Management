<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kabaddi Players Management System</title>

<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
    rel="stylesheet">

<style>
body {
    height: 100vh;
    margin: 0;
    background: linear-gradient(135deg, #667eea, #764ba2);
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: 'Poppins', sans-serif;
}

.welcome-box {
    background: #ffffff;
    padding: 45px;
    border-radius: 18px;
    text-align: center;
    width: 430px;
    box-shadow: 0 18px 35px rgba(0, 0, 0, 0.25);
    animation: fadeIn 0.6s ease-in;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to   { opacity: 1; transform: translateY(0); }
}

.welcome-box h2 {
    color: #0d6efd;
    font-weight: 600;
    margin-bottom: 15px;
}

.welcome-box p {
    color: #555;
    margin-bottom: 28px;
    font-size: 15px;
}

.btn-custom {
    width: 100%;
    padding: 12px;
    font-size: 16px;
    border-radius: 10px;
    margin-bottom: 12px;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.btn-custom:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.2);
}
</style>
</head>

<body>

<div class="welcome-box">
    <h2> Kabaddi Players Management System</h2>
    <p>Manage your kabaddi players profile easily and securely</p>

    <a href="login.jsp" class="btn btn-primary btn-custom">Login</a>
    <a href="register.jsp" class="btn btn-success btn-custom">Register</a>
</div>

</body>
</html>

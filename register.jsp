<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register | Kabaddi Players Management</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>
    body {
        height: 100vh;
        background: linear-gradient(135deg, #43cea2, #185a9d);
        display: flex;
        align-items: center;
        justify-content: center;
        font-family: 'Poppins', sans-serif;
    }

    .register-box {
        background: #fff;
        padding: 35px;
        width: 420px;
        border-radius: 15px;
        box-shadow: 0 15px 30px rgba(0,0,0,0.25);
        animation: fadeIn 0.5s ease-in;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(15px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .register-box h2 {
        text-align: center;
        color: #198754;
        font-weight: 600;
        margin-bottom: 20px;
    }

    .form-control {
        margin-bottom: 15px;
        padding: 12px;
    }

    .btn-register {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        border-radius: 8px;
    }

    .login-link {
        text-align: center;
        margin-top: 15px;
    }
</style>
</head>

<body>

<div class="register-box">
    <h2>📝 Register</h2>

    <form action="register" method="post" onsubmit="return validateForm()">

        <input type="text" id="name" name="name" class="form-control"
               placeholder="Full Name">

        <input type="text" id="username" name="username" class="form-control"
               placeholder="Username">

        <input type="email" id="email" name="email" class="form-control"
               placeholder="Email Address">

        <input type="password" id="password" name="password"
               class="form-control"
               placeholder="Password (min 6 characters)">

        <input type="password" id="confirmPassword"
               class="form-control"
               placeholder="Confirm Password">

        <button class="btn btn-success btn-register">Register</button>
    </form>

    <div class="login-link">
        Already have an account?
        <a href="login.jsp">Login here</a>
    </div>
</div>

<script>
    function validateForm() {

        const name = document.getElementById("name").value.trim();
        const username = document.getElementById("username").value.trim();
        const email = document.getElementById("email").value.trim();
        const pwd = document.getElementById("password").value;
        const cpwd = document.getElementById("confirmPassword").value;

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

        if (username === "" || username.length < 4) {
            alert("Username must be at least 4 characters");
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

        if (pwd !== cpwd) {
            alert("Passwords do not match");
            return false;
        }

        return true;
    }
</script>

</body>
</html>

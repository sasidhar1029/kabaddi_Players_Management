<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String user = (String) session.getAttribute("username");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String idStr = request.getParameter("id");

    if (idStr == null) {
        response.sendRedirect("viewPlayers");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Player</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet">
</head>

<body class="bg-light d-flex justify-content-center align-items-center"
      style="height:100vh;">

<div class="card p-4 shadow text-center"
     style="width:400px;">

    <h4 class="text-danger mb-3">
        ⚠ Delete Player
    </h4>

    <p>Are you sure you want to delete this player?</p>

    <form action="deletePlayer" method="post">
        <input type="hidden" name="id"
               value="<%= idStr %>">

        <button class="btn btn-danger w-100">
            Yes, Delete
        </button>
    </form>

    <a href="viewPlayers"
       class="btn btn-secondary w-100 mt-2">
        Cancel
    </a>

</div>

</body>
</html>

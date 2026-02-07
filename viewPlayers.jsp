<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*,com.hostel.model.*"%>

<%
    String user = (String) session.getAttribute("username");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Student> players =
        (List<Student>) request.getAttribute("players");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Players</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet">
</head>

<body class="bg-light p-5">

<div class="container bg-white p-4 shadow rounded">

    <h3 class="text-center text-danger mb-4">
        🏋️ All Registered Kabaddi Players
    </h3>

    <table class="table table-bordered table-hover text-center">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Username</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
        </thead>

        <tbody>

        <%
            if (players != null && !players.isEmpty()) {
                for (Student s : players) {
        %>

            <tr>
                <td><%= s.getId() %></td>
                <td><%= s.getName() %></td>
                <td><%= s.getUsername() %></td>
                <td><%= s.getEmail() %></td>

                <td>
                    <a href="<%= request.getContextPath() %>/editPlayer.jsp?id=<%= s.getId() %>"
                       class="btn btn-warning btn-sm me-1">
                        ✏ Edit
                    </a>

                    <a href="<%= request.getContextPath() %>/deletePlayer.jsp?id=<%= s.getId() %>"
                       class="btn btn-danger btn-sm">
                        🗑 Delete
                    </a>
                </td>
            </tr>

        <%
                }
            } else {
        %>

            <tr>
                <td colspan="5">No players found</td>
            </tr>

        <%
            }
        %>

        </tbody>
    </table>

    <div class="text-center mt-3">
        <a href="home.jsp" class="btn btn-primary">
            ⬅ Back to Dashboard
        </a>
    </div>

</div>

</body>
</html>

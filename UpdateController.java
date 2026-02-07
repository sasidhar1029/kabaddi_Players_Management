package com.hostel.controller;

import java.io.IOException;

import com.hostel.dao.StudentDAOImpl;
import com.hostel.model.Student;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/update")
public class UpdateController extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        Student s = new Student();
        s.setUsername(username);
        s.setName(name);
        s.setEmail(email);

        // Update password only if entered
        if (password != null && !password.trim().isEmpty()) {
            s.setPassword(password);
        }

        new StudentDAOImpl().updateStudent(s);

        res.sendRedirect("profile.jsp");
    }
}

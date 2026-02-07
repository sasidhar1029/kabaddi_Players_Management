package com.hostel.controller;

import java.io.IOException;

import com.hostel.dao.StudentDAOImpl;
import com.hostel.dao.StudentDAOInterface;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (username == null || password == null) {
            res.sendRedirect("login.jsp?error=invalid");
            return;
        }

        StudentDAOInterface dao = new StudentDAOImpl();

        if (dao.login(username, password)) {
            HttpSession session = req.getSession();
            session.setAttribute("username", username);
            res.sendRedirect("home.jsp");
        } else {
            res.sendRedirect("login.jsp?error=invalid");
        }
    }
}

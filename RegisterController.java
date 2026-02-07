package com.hostel.controller;
import java.io.IOException;

import com.hostel.dao.StudentDAOImpl;
import com.hostel.dao.StudentDAOInterface;
import com.hostel.model.Student;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        Student s = new Student(
            req.getParameter("name"),
            req.getParameter("username"),
            req.getParameter("email"),
            req.getParameter("password")
        );

        StudentDAOInterface dao = new StudentDAOImpl();
        String result = dao.registerStudent(s);

        if ("success".equals(result))
            res.sendRedirect("login.jsp");
        else
            res.sendRedirect("register.jsp?error=1");
    }
}


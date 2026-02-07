package com.hostel.controller;

import java.io.IOException;

import com.hostel.dao.StudentDAOImpl;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/delete")
public class DeleteController extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

        HttpSession session = req.getSession(false);

        if (session != null && session.getAttribute("username") != null) {
            new StudentDAOImpl().deleteStudent(
                    (String) session.getAttribute("username"));
            session.invalidate();
        }

        res.sendRedirect("index.jsp");
    }
}

package com.hostel.controller;

import java.io.IOException;

import com.hostel.dao.StudentDAOImpl;
import com.hostel.model.Student;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updatePlayer")
public class UpdatePlayerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String username = req.getParameter("username");
        String email = req.getParameter("email");

        Student s = new Student();
        s.setId(id);
        s.setName(name);
        s.setUsername(username);
        s.setEmail(email);

        StudentDAOImpl dao = new StudentDAOImpl();
        dao.updatePlayer(s);

        res.sendRedirect("viewPlayers");
    }
}

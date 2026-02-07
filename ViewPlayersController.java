package com.hostel.controller;

import java.io.IOException;
import java.util.List;

import com.hostel.dao.StudentDAOImpl;
import com.hostel.model.Student;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/viewPlayers")
public class ViewPlayersController extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        List<Student> players =
                new StudentDAOImpl().getAllStudents();

        req.setAttribute("players", players);
        RequestDispatcher rd =
                req.getRequestDispatcher("viewPlayers.jsp");
        rd.forward(req, res);
    }
}

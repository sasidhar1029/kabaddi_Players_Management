package com.hostel.controller;

import java.io.IOException;

import com.hostel.dao.StudentDAOImpl;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/deletePlayer")
public class DeletePlayerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,
                          HttpServletResponse res)
            throws IOException {

        String idStr = req.getParameter("id");

        System.out.println("DELETE ID: " + idStr); // DEBUG

        if (idStr != null) {

            int id = Integer.parseInt(idStr);

            StudentDAOImpl dao = new StudentDAOImpl();
            dao.deletePlayer(id);

            System.out.println("DELETE SUCCESS");
        }

        res.sendRedirect("viewPlayers");
    }
}

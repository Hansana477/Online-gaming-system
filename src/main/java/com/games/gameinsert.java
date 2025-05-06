package com.games;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class gameinsert extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        float price;
        try {
            price = Float.parseFloat(request.getParameter("price"));
        } catch (NumberFormatException e) {
            price = 0.0f; // Default value or handle error
            request.setAttribute("errorMessage", "Invalid price format: " + e.getMessage());
            RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
            dis.forward(request, response);
            return;
        }
        String category = request.getParameter("category");

        GamesDBUtil.InsertResult result = GamesDBUtil.insertgame(title, description, price, category);

        if (result.isSuccess()) {
            RequestDispatcher dis = request.getRequestDispatcher("addgames.jsp");
            dis.forward(request, response);
        } else {
            request.setAttribute("errorMessage", result.getErrorMessage());
            RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
            dis.forward(request, response);
        }
    }
}
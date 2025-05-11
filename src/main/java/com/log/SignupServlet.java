package com.log;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Basic validation
        if (username == null || username.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required.");
            RequestDispatcher dis = request.getRequestDispatcher("signup.jsp");
            dis.forward(request, response);
            return;
        }

        // Simple email format check
        if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            request.setAttribute("errorMessage", "Invalid email format.");
            RequestDispatcher dis = request.getRequestDispatcher("signup.jsp");
            dis.forward(request, response);
            return;
        }

        // Register user
        GamesDBUtil.InsertResult result = GamesDBUtil.registerUser(username, email, password);

        if (result.isSuccess()) {
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("errorMessage", result.getErrorMessage());
            RequestDispatcher dis = request.getRequestDispatcher("signup.jsp");
            dis.forward(request, response);
        }
    }
}
package com.log;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Basic validation
        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Email and password are required.");
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
            return;
        }

        // Authenticate user
        GamesDBUtil.UserResult result = GamesDBUtil.authenticateUser(email, password);

        if (result.isSuccess()) {
            // Create session
            HttpSession session = request.getSession();
            session.setAttribute("userId", result.getUserId());
            session.setAttribute("username", result.getUsername());
            session.setAttribute("role", result.getRole());

            // Redirect based on role
            if ("admin".equals(result.getRole())) {
                response.sendRedirect("addgames.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            request.setAttribute("errorMessage", result.getErrorMessage());
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        }
    }
}
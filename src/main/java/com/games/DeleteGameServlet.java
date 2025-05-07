package com.games;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteGameServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Log received parameter
            System.out.println("Received delete parameter:");
            System.out.println("id: " + request.getParameter("id"));

            // Retrieve and parse ID
            String idParam = request.getParameter("id");
            if (idParam == null || idParam.trim().isEmpty()) {
                throw new IllegalArgumentException("Game ID is missing");
            }
            int id = Integer.parseInt(idParam);

            // Log processed ID
            System.out.println("Processed ID: " + id);

            // Call the database delete method
            GamesDBUtil.InsertResult result = GamesDBUtil.deleteGame(id);

            // Handle the result
            if (result.isSuccess()) {
                System.out.println("Delete successful, redirecting to addgames.jsp");
                response.sendRedirect("addgames.jsp");
            } else {
                System.out.println("Delete failed: " + result.getErrorMessage());
                request.setAttribute("errorMessage", result.getErrorMessage());
                RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
                dis.forward(request, response);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            System.out.println("NumberFormatException: " + e.getMessage());
            request.setAttribute("errorMessage", "Invalid number format for ID");
            RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
            dis.forward(request, response);
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            System.out.println("IllegalArgumentException: " + e.getMessage());
            request.setAttribute("errorMessage", e.getMessage());
            RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
            dis.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Unexpected error: " + e.getMessage());
            request.setAttribute("errorMessage", "Unexpected error: " + e.getMessage());
            RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
            dis.forward(request, response);
        }
    }
}
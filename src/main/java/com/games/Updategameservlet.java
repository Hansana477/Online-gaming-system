package com.games;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Updategameservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Log all received parameters for debugging
            System.out.println("Received form parameters:");
            System.out.println("id: " + request.getParameter("id"));
            System.out.println("title: " + request.getParameter("title"));
            System.out.println("description: " + request.getParameter("description"));
            System.out.println("price: " + request.getParameter("price"));
            System.out.println("category: " + request.getParameter("category"));

            // Retrieve and parse ámbitos
            String idParam = request.getParameter("id");
            if (idParam == null || idParam.trim().isEmpty()) {
                throw new IllegalArgumentException("Game ID is missing");
            }
            int id = Integer.parseInt(idParam);

            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String priceParam = request.getParameter("price");
            String category = request.getParameter("category");

            // Validate parameters
            if (title == null || title.trim().isEmpty() || 
                description == null || description.trim().isEmpty() || 
                priceParam == null || priceParam.trim().isEmpty() ||
                category == null || category.trim().isEmpty()) {
                throw new IllegalArgumentException("Required fields are missing or empty");
            }

            float price = Float.parseFloat(priceParam);

            // Log validated parameters
            System.out.println("Processed parameters: id=" + id + ", title=" + title + 
                               ", description=" + description + ", price=" + price + 
                               ", category=" + category);

            // Call the database update method
            GamesDBUtil.InsertResult result = GamesDBUtil.updategames(id, title, description, price, category);

            // Handle the result
            if (result.isSuccess()) {
                System.out.println("Update successful, redirecting to addgames.jsp");
                response.sendRedirect("addgames.jsp");
            } else {
                System.out.println("Update failed: " + result.getErrorMessage());
                request.setAttribute("errorMessage", result.getErrorMessage());
                RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
                dis.forward(request, response);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            System.out.println("NumberFormatException: " + e.getMessage());
            request.setAttribute("errorMessage", "Invalid number format for ID or price");
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
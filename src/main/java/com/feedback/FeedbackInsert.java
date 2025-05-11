package com.feedback;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FeedbackInsert extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/viewfeedback");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String comment = request.getParameter("comment");
        int rating;
        
        try {
            rating = Integer.parseInt(request.getParameter("rating"));
            if (rating < 1 || rating > 10) {
                throw new NumberFormatException("Rating must be between 1 and 10");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid rating: " + e.getMessage());
            request.setAttribute("feedbackList", FeedbackDBUtil.getAllFeedback());
            RequestDispatcher dis = request.getRequestDispatcher("feedback.jsp");
            dis.forward(request, response);
            return;
        }

        FeedbackDBUtil.InsertResult result = FeedbackDBUtil.insertFeedback(username, comment, rating);

        if (result.isSuccess()) {
            response.sendRedirect(request.getContextPath() + "/viewfeedback");
        } else {
            request.setAttribute("errorMessage", result.getErrorMessage());
            request.setAttribute("feedbackList", FeedbackDBUtil.getAllFeedback());
            RequestDispatcher dis = request.getRequestDispatcher("feedback.jsp");
            dis.forward(request, response);
        }
    }
}
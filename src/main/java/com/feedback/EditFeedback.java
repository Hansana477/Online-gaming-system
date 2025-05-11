package com.feedback;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditFeedback extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // If action is "edit" (or null, initial request to display form), fetch the feedback and display the edit form
        if (action == null || action.equals("edit")) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                Feedback feedback = FeedbackDBUtil.getFeedbackById(id);
                if (feedback != null) {
                    request.setAttribute("editFeedback", feedback);
                    request.setAttribute("feedbackList", FeedbackDBUtil.getAllFeedback());
                    RequestDispatcher dis = request.getRequestDispatcher("feedback.jsp");
                    dis.forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Feedback not found for ID: " + id);
                    request.setAttribute("feedbackList", FeedbackDBUtil.getAllFeedback());
                    RequestDispatcher dis = request.getRequestDispatcher("feedback.jsp");
                    dis.forward(request, response);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Invalid feedback ID.");
                request.setAttribute("feedbackList", FeedbackDBUtil.getAllFeedback());
                RequestDispatcher dis = request.getRequestDispatcher("feedback.jsp");
                dis.forward(request, response);
            }
        }
        // If action is "update", process the update
        else if (action.equals("update")) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String username = request.getParameter("username");
                String comment = request.getParameter("comment");
                int rating = Integer.parseInt(request.getParameter("rating"));

                if (rating < 1 || rating > 10) {
                    throw new NumberFormatException("Rating must be between 1 and 10");
                }

                FeedbackDBUtil.InsertResult result = FeedbackDBUtil.updateFeedback(id, username, comment, rating);

                if (result.isSuccess()) {
                    response.sendRedirect(request.getContextPath() + "/viewfeedback");
                } else {
                    request.setAttribute("errorMessage", result.getErrorMessage());
                    request.setAttribute("feedbackList", FeedbackDBUtil.getAllFeedback());
                    RequestDispatcher dis = request.getRequestDispatcher("feedback.jsp");
                    dis.forward(request, response);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Invalid input: " + e.getMessage());
                request.setAttribute("feedbackList", FeedbackDBUtil.getAllFeedback());
                RequestDispatcher dis = request.getRequestDispatcher("feedback.jsp");
                dis.forward(request, response);
            }
        }
    }
}
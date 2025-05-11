package com.feedback;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteFeedback extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            FeedbackDBUtil.InsertResult result = FeedbackDBUtil.deleteFeedback(id);

            if (result.isSuccess()) {
                response.sendRedirect(request.getContextPath() + "/viewfeedback");
            } else {
                request.setAttribute("errorMessage", result.getErrorMessage());
                request.setAttribute("feedbackList", FeedbackDBUtil.getAllFeedback());
                request.getRequestDispatcher("feedback.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid feedback ID.");
            request.setAttribute("feedbackList", FeedbackDBUtil.getAllFeedback());
            request.getRequestDispatcher("feedback.jsp").forward(request, response);
        }
    }
}
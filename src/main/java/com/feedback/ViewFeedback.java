package com.feedback;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewFeedback extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Feedback> feedbackList = FeedbackDBUtil.getAllFeedback();
            request.setAttribute("feedbackList", feedbackList);
            RequestDispatcher dis = request.getRequestDispatcher("feedback.jsp");
            dis.forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error retrieving feedback: " + e.getMessage());
            RequestDispatcher dis = request.getRequestDispatcher("feedback.jsp");
            dis.forward(request, response);
        }
    }
}
package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.review;
import com.service.reviewService;


@WebServlet("/deleteReview")
public class deleteReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
         review rev = new review();
           rev.setGameid(request.getParameter("gameid"));;
		
		reviewService serv = new reviewService();
        serv.deletrev(rev);
		
		RequestDispatcher dis = request.getRequestDispatcher("Reviewui.jsp");
		dis.forward(request, response);
		
		
	}

}

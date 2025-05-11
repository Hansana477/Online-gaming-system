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


@WebServlet("/addReview")
public class addReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		review rev = new review();
       rev.setGameid(request.getParameter("gameid"));  
       rev.setUserid(request.getParameter("userid"));
       rev.setReview(request.getParameter("review"));   
	rev.setRate(Integer.parseInt(request.getParameter("rate")));	
		
		reviewService serv = new reviewService();
	    serv.addRev(rev);
		
		RequestDispatcher dispa = request.getRequestDispatcher("Reviewui.jsp");
		dispa.forward(request, response);
	}

}

package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.review;
import com.service.reviewService;



@WebServlet("/editrev")
public class editrev extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		review rev = new review();
		rev.setGameid(request.getParameter("gameId"));  // changed to match JSP
		rev.setUserid(request.getParameter("userId"));  // changed to match JSP

        rev.setReview(request.getParameter("review"));   
		rev.setRate(Integer.parseInt(request.getParameter("rate")));	
		
	
		
reviewService serv = new reviewService();
serv.updaterev(rev);

javax.servlet.RequestDispatcher dis = request.getRequestDispatcher("singlePay");
		dis.forward(request, response);
	}

}

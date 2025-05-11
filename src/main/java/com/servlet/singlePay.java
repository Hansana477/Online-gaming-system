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

@WebServlet("/singlePay")
public class singlePay extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		review rev = new review();
		rev.setUserid(request.getParameter("userId"));
	   reviewService serv = new reviewService();
		review revi = serv.getone(rev);
		RequestDispatcher dis = request.getRequestDispatcher("singleReview.jsp");
		request.setAttribute("sing", revi);
		dis.forward(request, response);

	}

}

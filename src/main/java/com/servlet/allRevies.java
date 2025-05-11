package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.review;
import com.service.reviewService;


@WebServlet("/allRevies")
public class allRevies extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  String userId = request.getParameter("userId");
		reviewService serv = new reviewService();
		ArrayList<review> reviw = serv.getAllRevies((userId));
		request.setAttribute("list1", reviw);
		
		RequestDispatcher dispa = request.getRequestDispatcher("allreviesw.jsp");
		dispa.forward(request, response);
		
		
	}

}

package com.ktds.ktrip.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ktds.ktrip.dao.ItemDAO;
import com.ktds.ktrip.dao.ReviewDAO;
import com.ktds.ktrip.domain.ItemVO;
import com.ktds.ktrip.domain.ReviewVO;

/**
 * Servlet implementation class ViewReviewController
 */
@WebServlet("/viewReview")
public class ViewReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		int item_id = Integer.parseInt(request.getParameter("item_id"));

		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");

		ReviewDAO review = new ReviewDAO();
		ArrayList<ReviewVO> reviewList = review.reviewList(item_id);
		 
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");

		Gson gson = new Gson();
		String jsonList = gson.toJson(reviewList);
		PrintWriter out = response.getWriter();
		out.write(jsonList);
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ArrayList<ReviewVO> itemList2 = new ArrayList<ReviewVO>();

		response.setCharacterEncoding("utf-8");
	      response.setContentType("application/json");
	      
		
		int item_id = Integer.parseInt(request.getParameter("item_id"));
		int pagingnumber = Integer.parseInt(request.getParameter("pagingnumber"));
		int pageEnd = pagingnumber * 3;
		
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");

		ReviewDAO review = new ReviewDAO();
		ArrayList<ReviewVO> reviewList = review.reviewList(item_id);
		System.out.println("post review: ");
		if(pageEnd > reviewList.size()) {
			pageEnd = reviewList.size();
		}
		
		for(int i = pagingnumber*3-3; i<pageEnd; i++) {
			itemList2.add(reviewList.get(i));


		}
		
		System.out.println("itemList2 size : " + itemList2.size());

		Gson gson = new Gson();
		String jsonList = gson.toJson(itemList2);
		PrintWriter out = response.getWriter();
		out.write(jsonList);
		out.flush();
		out.close();
		
	}

}

package com.ktds.ktrip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ktds.ktrip.dao.ReviewDAO;
import com.ktds.ktrip.domain.ReviewVO;



/**
 * Servlet implementation class InsertReviewController
 */
@WebServlet("/insertReview")
public class InsertReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int user_id = (int)session.getAttribute("user_id");
		int item_id = Integer.parseInt(request.getParameter("item_id"));
		String title = request.getParameter("title");
		String comment = request.getParameter("comment");
		int score = Integer.parseInt(request.getParameter("score"));
		
		ReviewDAO review = new ReviewDAO();
		ReviewVO reviewVo = new ReviewVO();
		reviewVo.setUser_id(user_id);
		reviewVo.setItem_id(item_id);
		reviewVo.setReview_contents(comment);
		reviewVo.setScore(score);
		reviewVo.setTitle(title);
		
		
		System.out.println("review item_id : " + item_id);
		if(review.addReview(reviewVo) == 1) {
			response.getWriter().write("success");

		}
		else {
			response.getWriter().write("false");

		}
		
		
		
	
	
	}

}

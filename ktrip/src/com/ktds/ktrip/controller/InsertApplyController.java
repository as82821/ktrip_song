package com.ktds.ktrip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ktds.ktrip.dao.ApplyDAO;
import com.ktds.ktrip.dao.ReviewDAO;
import com.ktds.ktrip.domain.ApplyVO;
import com.ktds.ktrip.domain.ReviewVO;

/**
 * Servlet implementation class InsertApplyController
 */
@WebServlet("/insertApply")
public class InsertApplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertApplyController() {
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
		
		System.out.println("insert apply");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int user_id = (int)session.getAttribute("user_id");
		int item_id = Integer.parseInt(request.getParameter("item_id"));
		String startDate = request.getParameter("start_date");
		String endDate = request.getParameter("end_date");
		String comment = request.getParameter("contact_content");
		
		System.out.println("apply comment : " + comment);
		ApplyDAO apply = new ApplyDAO();
		ApplyVO applyVo = new ApplyVO();
		applyVo.setUser_id(user_id);
		applyVo.setItem_id(item_id);
		applyVo.setComment(comment);
		applyVo.setStart_date(startDate);
		applyVo.setEnd_date(endDate);
		
		if(apply.addApply(applyVo) == 1) {
			response.getWriter().write("success");

		}
		else {
			response.getWriter().write("false");

		}
	}

}

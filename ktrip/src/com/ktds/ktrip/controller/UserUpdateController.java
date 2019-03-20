package com.ktds.ktrip.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ktds.ktrip.dao.UserDAO;


@WebServlet("/updateCheck")
public class UserUpdateController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		UserDAO dao=new UserDAO();
		int id=Integer.parseInt(request.getParameter("user_id"));
		String pwd=request.getParameter("pwd");
		String phone_num=request.getParameter("phone_num");
		String residential_country=request.getParameter("residential_country");
		
		dao.updateUser(id,pwd,phone_num,residential_country);
		
		resp.sendRedirect("/ktrip/mypage.jsp");
	}

}

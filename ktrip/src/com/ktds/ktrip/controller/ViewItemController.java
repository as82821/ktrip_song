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
import com.ktds.ktrip.domain.ItemVO;

/**
 * Servlet implementation class ViewItemController
 */
@WebServlet("/viewItem")
public class ViewItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewItemController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		int item_id = Integer.parseInt(request.getParameter("item_id"));

		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");

		ItemDAO dao = new ItemDAO();
		ItemVO item = dao.viewItem(item_id);

		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");

		Gson gson = new Gson();
		String jsonList = gson.toJson(item);
		PrintWriter out = response.getWriter();
		out.write(jsonList);
		out.flush();
		out.close();

		System.out.println("view item : " + jsonList);
//		result.append("[{\"value\": \"" + item.getThumbnail() + "\"},");
//		result.append("{\"value\": \"" + item.getTitle() + "\"},");
//		result.append("{\"value\": \"" + item.getConcept() + "\"},");
//		result.append("{\"value\": \"" + item.getContents() + "\"},");
//		result.append("{\"value\": \"" + item.getGuide_photo() + "\"},");
//		result.append("{\"value\": \"" + item.getGuide_intro() + "\"},");
//		result.append("{\"value\": \"" + item.getGuide_name() + "\"}],");
//
//		result.append("]}");
//
//		System.out.println("vie item : " + result.toString());
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html;charset=UTF-8");
//		response.getWriter().write(result.toString());

	}

}

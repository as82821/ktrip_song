package com.ktds.ktrip.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.ktds.ktrip.dao.ItemDAO;
import com.ktds.ktrip.domain.ItemVO;

/**
 * Servlet implementation class SearchProductController3
 */
@WebServlet("/listOld")
public class ListOldItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListOldItemController() {
        super();
        // TODO Auto-generated constructor stub  
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	
    	response.setCharacterEncoding("utf-8");
	    response.setContentType("application/json");
	      
    	HttpSession session = request.getSession();

    	int user_id = (int)session.getAttribute("user_id");
		
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ItemDAO item = new ItemDAO();
		ArrayList<ItemVO> itemList = item.searchcount3(user_id);
		
		Gson gson = new Gson();
		String jsonList = gson.toJson(itemList);
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
		
		ArrayList<ItemVO> itemList2 = new ArrayList<ItemVO>();

		response.setCharacterEncoding("utf-8");
	    response.setContentType("application/json");
		
		HttpSession session = request.getSession();

    	int user_id = (int)session.getAttribute("user_id");
    	
		
		int pagingnumber = Integer.parseInt(request.getParameter("pagingnumber"));
		int pageEnd = pagingnumber * 6;

		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ItemDAO item = new ItemDAO();
		ArrayList<ItemVO> itemList = item.searchcount3(user_id);
		
		if(pageEnd > itemList.size()) {
			pageEnd = itemList.size();
		}
		
		for(int i = pagingnumber*6-6; i<pageEnd; i++) {
			itemList2.add(itemList.get(i));


		}
		

		Gson gson = new Gson();
		String jsonList = gson.toJson(itemList2);
		PrintWriter out = response.getWriter();
		out.write(jsonList);
		out.flush();
		out.close();
		
		System.out.println("old post result" + jsonList);
		
	}


}

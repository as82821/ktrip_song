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
 * Servlet implementation class SearchProductController2
 */
@WebServlet("/listWait")
public class ListWaitItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListWaitItemController() {
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
		ArrayList<ItemVO> itemList = item.searchcount2(user_id);
		
		
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
		System.out.println("post request");

	
		int user_id = (int)session.getAttribute("user_id");		
		int pagingnumber = Integer.parseInt(request.getParameter("pagingnumber"));
		int pageEnd = pagingnumber * 6;

		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ItemDAO item = new ItemDAO();
		ArrayList<ItemVO> itemList = item.searchcount2(user_id);
		
		if(pageEnd > itemList.size()) {
			pageEnd = itemList.size();
		}
		

		for(int i = pagingnumber*6-6; i<pageEnd; i++) {
			itemList2.add(itemList.get(i));


		}
		
		System.out.println("wait size : " + itemList2.size());

		Gson gson = new Gson();
		String jsonList = gson.toJson(itemList2);
		PrintWriter out = response.getWriter();
		out.write(jsonList);
		out.flush();
		out.close();
		
		System.out.println("wait post result" + jsonList);

	}
	
}

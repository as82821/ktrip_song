package com.ktds.ktrip.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
 * Servlet implementation class SearchProductController1
 */
@WebServlet("/SearchItem")
public class SearchItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<ItemVO> itemList;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchItemController() {
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
	      
		String destination = request.getParameter("destination");
		String startDate = request.getParameter("start_date");
		String endDate = request.getParameter("end_date");
		
		System.out.println(startDate + " " + endDate + " " + destination);
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy/MM/dd");
		long diffDays = 0;
		
		try {
			
			
			Date start = transFormat.parse(startDate);
			Date end = transFormat.parse(endDate);
			
			long diff = end.getTime() - start.getTime();
		    diffDays = diff / (24 * 60 * 60 * 1000) + 1;
		    
		    System.out.println(diffDays);
		    
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ItemDAO item = new ItemDAO();
		itemList = item.searchcount(destination, (int)diffDays);
		
		Gson gson = new Gson();
		String jsonList = gson.toJson(itemList);
		PrintWriter out = response.getWriter();
		out.write(jsonList);
		out.flush();
		out.close();

		System.out.println(jsonList);
		
//		for(int i = 0; i<itemList.size(); ++i) {
//			result.append("[{\"value\": \"" + itemList.get(i).getItem_id() + "\"},");
//			result.append("{\"value\": \"" + itemList.get(i).getTitle() + "\"},");
//			result.append("{\"value\": \"" + itemList.get(i).getThumbnail() + "\"},");
//			result.append("{\"value\": \"" + itemList.get(i).getConcept() + "\"}],");
//
//		}
//		result.append("]}");
//		
//		
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html;charset=UTF-8");
//		response.getWriter().write(result.toString());
//		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		ArrayList<ItemVO> itemList2 = new ArrayList<ItemVO>();
	     
	      response.setCharacterEncoding("utf-8");
	      response.setContentType("application/json");
	      
		String destination = request.getParameter("destination");
		String startDate = request.getParameter("start_date");
		String endDate = request.getParameter("end_date");
		int pagingnumber = Integer.parseInt(request.getParameter("pagingnumber"));
		int pageEnd = pagingnumber * 6;
		
		System.out.println(startDate + " " + endDate + " " + destination);
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy/MM/dd");
		long diffDays = 0;
		
		try {
			
			
			Date start = transFormat.parse(startDate);
			Date end = transFormat.parse(endDate);
			
			long diff = end.getTime() - start.getTime();
		    diffDays = diff / (24 * 60 * 60 * 1000) + 1;
		    
		    System.out.println(diffDays);
		    
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ItemDAO item = new ItemDAO();
		itemList = item.searchcount(destination, (int)diffDays);
		
		
		if(pageEnd > itemList.size()) {
			pageEnd = itemList.size();
		}
		
		for(int i = pagingnumber*6-6; i<pageEnd; i++) {
			itemList2.add(itemList.get(i));


		}
		
		System.out.println("itemList2 size : " + itemList2.size());

		Gson gson = new Gson();
		String jsonList = gson.toJson(itemList2);
		PrintWriter out = response.getWriter();
		out.write(jsonList);
		out.flush();
		out.close();
		
		System.out.println("post result" + jsonList);
		
	}

}

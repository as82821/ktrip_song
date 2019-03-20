<%@page import="com.ktds.ktrip.domain.ApplyVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ktds.ktrip.domain.ItemVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- guide_data.jsp --%>    
<%
   	ItemVO vo = (ItemVO)request.getAttribute("item");
	ArrayList<ApplyVO> applyList = (ArrayList)request.getAttribute("applyList");
	for(int i = 0; i<applyList.size();i++){
		System.out.println("--신청라 리스트--");
		System.out.println("Applyid : "+applyList.get(i).getApply_id());
		System.out.println("userid : "+applyList.get(i).getUser_id());
		System.out.println("name : "+applyList.get(i).getName());
		System.out.println("comment : "+applyList.get(i).getComment());
		System.out.println("start_date : "+applyList.get(i).getStart_date());
		System.out.println("end_date : "+applyList.get(i).getEnd_date());
		System.out.println("entry : "+applyList.get(i).getEntry());
		System.out.println("status : "+applyList.get(i).getItem_status());
		System.out.println("status : "+applyList.get(i).getStatusToString());
		System.out.println("----------");
		}

%>

{
"title":"<%=vo.getTitle() %>",
"num_min":"<%=vo.getNum_min() %>",
"num_max":"<%=vo.getNum_max() %>",
"duration":"<%=vo.getDuration() %>",
"price":"<%=vo.getPrice() %>",
"concept":"<%=vo.getConcept() %>",
"thumbnail":"<%=vo.getThumbnail() %>",
"contents":"<%=vo.getContents()%>"
}

package com.ktds.ktrip.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ktds.ktrip.domain.ItemVO;
import com.ktds.ktrip.domain.ReviewVO;
import com.ktds.ktrip.jdbc.DBCon;



public class ReviewDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private DBCon db = new DBCon();
	private ResultSet rs = null;
	
	public ReviewDAO(){
		try {
			
			String DB_URL = "jdbc:mysql://ktrip-mysql.crl10pgh3bye.ap-northeast-2.rds.amazonaws.com:3306/ktripdb";
			String DB_USER = "ktrip";
			String DB_PASSWORD = "123456789";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int addReview(ReviewVO review) {
		int res = 0;

		try {

			String insertSql = "Insert into item_review (item_id, user_id, score, review_contents, title, register_time) "
					+"values (?, ?, ?, ?, ?, now())";

			pstmt = conn.prepareStatement(insertSql);

			pstmt.setInt(1, review.getItem_id());
			pstmt.setInt(2, review.getUser_id());
			pstmt.setInt(3, review.getScore());
			pstmt.setString(4, review.getReview_contents());
			pstmt.setString(5, review.getTitle());
		
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {

			e.printStackTrace();
			return res;
		}

		return res;
	}

	public ArrayList<ReviewVO> reviewList(int item_id) {
		
		// TODO Auto-generated method stub
		String SQL = "SELECT * FROM  item_review r "
				+ "JOIN user u "
				+ "ON u.user_id = r.user_id "
				+ "WHERE item_id =  ? ";
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, item_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {

				ReviewVO review = new ReviewVO();
				review.setTitle(rs.getString("title"));
				review.setReview_contents(rs.getString("review_contents"));
				review.setRegister_time(rs.getString("register_time"));
				review.setUser_id(rs.getInt("user_id"));
				review.setUser_name(rs.getString("name"));
				list.add(review);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
}

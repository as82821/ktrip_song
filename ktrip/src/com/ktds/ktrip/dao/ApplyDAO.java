package com.ktds.ktrip.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ktds.ktrip.domain.ApplyVO;
import com.ktds.ktrip.jdbc.DBCon;


public class ApplyDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private DBCon db = new DBCon();
	private ResultSet rs = null;
	private int delRs = 0;
	
	public ApplyDAO(){
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
	
	public int addApply(ApplyVO apply) {

		int res = 0;

		try {

			String insertSql = "Insert into item_apply (user_id, item_id, comment, start_date, end_date, item_status, entry) "
					+"values (?, ?, ?, ?, ?, 1, 1)";

			pstmt = conn.prepareStatement(insertSql);

			pstmt.setInt(1, apply.getUser_id());
			pstmt.setInt(2, apply.getItem_id());
			pstmt.setString(3, apply.getComment());
			pstmt.setString(4, apply.getStart_date());
			pstmt.setString(5, apply.getEnd_date());
			
			
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {

			e.printStackTrace();
			return res;
		}

		return res;
	}
	
	public int viewApply(int appy_id) {

		int res = 0;

		try {

			String SQL = "SELECT * FROM item_apply WHERE APPLY_ID = ?";

			pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, appy_id);
			
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {

			e.printStackTrace();
			return 1;
		}

		return res;
	}
	public int delItem(int apply_id) {
		String SQL = "DELETE FROM item_apply WHERE apply_id = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, apply_id);
			delRs = pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return delRs;
			
		}
		
		return delRs;
	}
	
}

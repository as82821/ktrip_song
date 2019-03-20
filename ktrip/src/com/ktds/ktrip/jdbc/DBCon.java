package com.ktds.ktrip.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBCon {
	public static Connection connect() throws Exception {

		String DB_URL = "jdbc:mysql://ktrip-mysql.crl10pgh3bye.ap-northeast-2.rds.amazonaws.com:3306/ktripdb";
		String DB_USER = "ktrip";
		String DB_PASSWORD = "123456789";

		Connection conn = null;

		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

		return conn;
	}

	public static void close(Connection conn) {
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void close(PreparedStatement pstmt, Connection conn) {
		try {
			if (pstmt != null) {
				pstmt.close();
			}
		} catch (SQLException se) {
			se.printStackTrace();
		}
		close(conn);
	}

	public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if (rs != null) {
				pstmt.close();
			}
		} catch (SQLException se) {
			se.printStackTrace();
		}
		close(pstmt, conn);
	}

}

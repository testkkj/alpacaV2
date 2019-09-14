package com.alpaca.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DatabaseConnection {

	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/alpaca?characterEncoding=UTF8", "root", "1234");
			System.out.println("getConnection()에서 con값을 반환합니다.");
			return con;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getConnection()에서 에러 발생 확인해 주세요.");
		}
		return null;
	}

	public static void close(PreparedStatement ps, Connection con) {
		try {
			if (ps != null) {
				ps.close();
				System.out.println("close(ps,con)에서 ps값을 닫았습니다.");
			} else if (con != null) {
				con.close();
				System.out.println("close(ps,con)에서 con값을 닫았습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("close(ps,con)에서 에러 발생 확인해 주시요.");
		}
	}

	public static void close(ResultSet rs, PreparedStatement ps, Connection con) {
		try {
			if (rs != null) {
				rs.close();
				System.out.println("close(rs,ps,con)에서 rs값을 닫았습니다.");
			} else if (ps != null) {
				ps.close();
				System.out.println("close(rs,ps,con)에서 ps값을 닫았습니다.");
			} else if (con != null) {
				con.close();
				System.out.println("close(rs,ps,con)에서 con값을 닫았습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("close(rs,ps,con)에서 에러 발생 확인해 주시요.");
		}
	}
}

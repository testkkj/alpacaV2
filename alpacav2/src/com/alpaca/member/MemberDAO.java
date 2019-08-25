package com.alpaca.member;

import com.alpaca.database.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	DatabaseConnection dc = new DatabaseConnection();

	public void memberInsert(MemberVO vo) {
		try {
			String sql = "insert into member (memberid, memberpassword, membername, membergender, memberbirthday, memberemail, membertel) values(?,?,?,?,?,?,?)";
			con = dc.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getMemberID());
			ps.setString(2, vo.getMemberPassword());
			ps.setString(3, vo.getMemberName());
			ps.setString(4, vo.getMemberGender());
			ps.setString(5, vo.getMemberBirthday());
			ps.setString(6, vo.getMemberEmail());
			ps.setString(7, vo.getMemberTel());
			ps.executeUpdate();
			System.out.println("memberInsert() 쿼리 실행");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberInsert() 에러 발생");
		} finally {
			dc.close(ps, con);
			System.out.println("memberInsert()에서 데이터베이스 접속 종료");
		}
	}

}

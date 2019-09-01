package com.alpaca.member;

import com.alpaca.database.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	DatabaseConnection dc = new DatabaseConnection();

	public boolean memberInsert(MemberVO vo) {
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
			System.out.println("memberInsert()에서 쿼리 실행");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberInsert()에서 에러 발생");
		} finally {
			dc.close(ps, con);
			System.out.println("memberInsert()에서 데이터베이스 접속 종료");
		}
		return false;
	}
	
	public boolean memberUpdate(MemberVO vo) {
		try {
			String sql = "update member set memberpassword=?, memberemail=?, membertel=? where memberid=?";
			con = dc.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getMemberPassword());
			ps.setString(2, vo.getMemberEmail());
			ps.setString(3, vo.getMemberTel());
			ps.setString(4, vo.getMemberID());
			ps.executeUpdate();
			System.out.println("memberUpdate()에서 쿼리 실행");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("memberUpdate()에서 에러 발생");			
		} finally {
			dc.close(ps, con);
			System.out.println("memberUpdate()에서 데이터베이스 접속 종료");
		}
		return false;
	}
	
	public MemberVO memberInformation(String id) {
		try {
			String sql = "select * from member where memberid=?";
			con = dc.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setMemberID(rs.getString(1));
				vo.setMemberPassword(rs.getString(2));
				vo.setMemberName(rs.getString(3));
				vo.setMemberGender(rs.getString(4));
				vo.setMemberBirthday(rs.getString(5));
				vo.setMemberEmail(rs.getString(6));
				vo.setMemberTel(rs.getString(7));
				System.out.println("memberInformation()에서 쿼리 실행");
				return vo;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberInformation()에서 에러 발생");
		}finally {
			dc.close(rs, ps, con);
			System.out.println("memberInformation()에서 데이터베이스 접속 종료");
		}
		return null;
	}

	public boolean memberLogin(MemberVO vo) {
		try {
			String sql = "select memberid from member where memberid=? and memberpassword=?";
			con = dc.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getMemberID());
			ps.setString(2, vo.getMemberPassword());
			rs = ps.executeQuery();
			if (rs.next()) {
				System.out.println("memberLogin()에서 쿼리 실행");
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberLogin()에서 에러 발생");
		} finally {
			dc.close(rs, ps, con);
			System.out.println("memberLogin()에서 데이터베이스 접속 종료");
		}
		return false;
	}

}

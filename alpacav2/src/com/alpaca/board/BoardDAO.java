package com.alpaca.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.alpaca.database.DatabaseConnection;

public class BoardDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public boolean boardWrite(BoardVo vo) {
		try {
			String sql = "insert into board (boardtitle, boardcontents, boardwriter) values(?,?,?)";
			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getBoardTitle());
			ps.setString(2, vo.getBoardContents());
			ps.setString(3, vo.getBoardWriter());
			int result = ps.executeUpdate();
			if (result == 1) {
				System.out.println("boardWrite()에서 쿼리 실행");
				return true;
			} else if (result == 0) {
				System.out.println("boardWrite()에서 쿼리 결과 없음");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("boardWrite()에서 에러 발생");
		} finally {
			DatabaseConnection.close(ps, con);
			System.out.println("boardWrite()에서 데이터베이스 접속 종료");
		}
		return false;
	}
}

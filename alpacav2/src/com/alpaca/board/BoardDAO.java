package com.alpaca.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.alpaca.database.DatabaseConnection;

public class BoardDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public ArrayList<BoardVo> boardList() {
		try {
			String sql = "select * from board order by boardnumber desc";
			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<BoardVo> arrayList = new ArrayList<BoardVo>();
			if (rs.next()) {
				while (rs.next()) {
					BoardVo vo = new BoardVo();
					vo.setBoardNumber(rs.getInt(1));
					vo.setBoardTitle(rs.getString(2));
					vo.setBoardContents(rs.getString(3));
					vo.setBoardWriter(rs.getString(4));
					vo.setBoardRegister(rs.getString(5));
					vo.setBoardHits(rs.getInt(6));
					vo.setBoardRecommend(rs.getInt(7));

					arrayList.add(vo);
				}
				System.out.println("boardList()에서 쿼리 실행");
				return arrayList;
			}
			System.out.println("boardView()에서 쿼리 결과 없음");
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("boardList()에서 에러 발생");
		} finally {
			DatabaseConnection.close(rs, ps, con);
			System.out.println("boardList()에서 데이터베이스 접속 종료");
		}
		return null;
	}

	public BoardVo boardView(int boardNumber) {
		try {
			String sql = "select * from board where boardnumber = ?";
			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, boardNumber);
			rs = ps.executeQuery();
			if (rs.next()) {
				BoardVo vo = new BoardVo();
				vo.setBoardNumber(rs.getInt(1));
				vo.setBoardTitle(rs.getString(2));
				vo.setBoardContents(rs.getString(3));
				vo.setBoardWriter(rs.getString(4));
				vo.setBoardRegister(rs.getString(5));
				vo.setBoardHits(rs.getInt(6));
				vo.setBoardRecommend(rs.getInt(7));
				System.out.println("boardView()에서 쿼리 실행");
				return vo;
			}
			System.out.println("boardView()에서 쿼리 결과 없음");
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("boardView()에서 에러 발생");
		} finally {
			DatabaseConnection.close(rs, ps, con);
			System.out.println("boardView()에서 데이터베이스 접속 종료");
		}
		return null;
	}

	public boolean boardHits(int boardNumber) {
		try {
			String sql = "update board set boardhits = (boardhits+1) where boardnumber = ?";
			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, boardNumber);
			int result = ps.executeUpdate();
			if (result == 1) {
				System.out.println("boardHits()에서 쿼리 실행");
				return true;
			} else if (result == 0) {
				System.out.println("boardHits()에서 쿼리 결과 없음");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("boardHits()에서 에러 발생");
		} finally {
			DatabaseConnection.close(rs, ps, con);
			System.out.println("boardHits()에서 데이터베이스 접속 종료");
		}
		return false;
	}

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

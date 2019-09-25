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

	public ArrayList<BoardVO> boardList(int pageNumber) {
		int range = boardNextNumber()-(pageNumber-1)*10;
		try {
			String sql = "select * from board where boardnumber < ? order by boardnumber desc limit 10";
			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, range);
			rs = ps.executeQuery();
			ArrayList<BoardVO> arrayList = new ArrayList<BoardVO>();
			while (rs.next()) {
				BoardVO vo = new BoardVO();
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
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("boardList()에서 에러 발생");
		} finally {
			DatabaseConnection.close(rs, ps, con);
			System.out.println("boardList()에서 데이터베이스 접속 종료");
		}
		return null;
	}

	public int boardNextNumber() {
		try {
			String sql = "select boardnumber from board order by boardnumber desc";
			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DatabaseConnection.close(rs, ps, con);
		}
		return -1;
	}
	
	public boolean boardNextPage(int pageNumber) {
		int range = boardNextNumber()-(pageNumber-1)*10;
		try {
			String sql = "select * from board where boardnumber < ? order by boardnumber desc limit 10";
			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, range);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("boardList()에서 에러 발생");
		} finally {
			DatabaseConnection.close(rs, ps, con);
			System.out.println("boardList()에서 데이터베이스 접속 종료");
		}
		return false;
	}

	public BoardVO boardView(int boardNumber) {
		try {
			String sql = "select * from board where boardnumber = ?";
			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, boardNumber);
			rs = ps.executeQuery();
			if (rs.next()) {
				BoardVO vo = new BoardVO();
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

	public boolean boardWrite(BoardVO vo) {
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

	public boolean boardUpdate(String boardTitle, String boardContents, int boardNumber) {
		try {
			String sql = "update board set boardtitle = ?, boardcontents = ? where boardnumber = ?";
			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, boardTitle);
			ps.setString(2, boardContents);
			ps.setInt(3, boardNumber);
			int result = ps.executeUpdate();
			if (result == 1) {
				System.out.println("boardUpdate()에서 쿼리 실행");
				return true;
			} else if (result == 0) {
				System.out.println("boardUpdate()에서 쿼리 결과 없음");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("boardUpdate()에서 에러 발생");
		} finally {
			DatabaseConnection.close(rs, ps, con);
			System.out.println("boardUpdate()에서 데이터베이스 접속 종료");
		}
		return false;
	}

	public boolean boardDelete(int boardNumber) {
		try {
			String sql = "delete from board where boardnumber = ?";
			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, boardNumber);
			int result = ps.executeUpdate();
			if (result == 1) {
				System.out.println("boardDelete()에서 쿼리 실행");
				return true;
			} else if (result == 0) {
				System.out.println("boardDelete()에서 쿼리 결과 없음");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("boardDelete()에서 에러 발생");
		} finally {
			DatabaseConnection.close(rs, ps, con);
			System.out.println("boardDelete()에서 데이터베이스 접속 종료");
		}
		return false;
	}
}

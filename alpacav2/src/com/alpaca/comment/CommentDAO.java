package com.alpaca.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.alpaca.database.DatabaseConnection;

public class CommentDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public ArrayList<CommentVO> commentList(int boardNumber) {
		try {
			String sql = "select * from comment where boardnumber = ? order by commentchild desc";
			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, boardNumber);
			rs = ps.executeQuery();
			ArrayList<CommentVO> arrayList = new ArrayList<CommentVO>();
			while(rs.next()) {
				CommentVO vo = new CommentVO();
				vo.setBoardNumber(rs.getInt(1));
				vo.setCommentNumber(rs.getInt(2));
				vo.setCommentParent(rs.getInt(3));
				vo.setCommentChild(rs.getInt(4));
				vo.setCommentContents(rs.getString(5));
				vo.setCommentWriter(rs.getString(6));
				vo.setCommentRegister(rs.getString(7));
				
				arrayList.add(vo);
			}
			return arrayList;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return null;
	}
	
	public CommentVO commentView(int commentNumber) {
		try {
			String sql = "select * from comment where commentnumber = ?";
			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, commentNumber);
			rs = ps.executeQuery();
			if(rs.next()) {
				CommentVO vo = new CommentVO();
				vo.setBoardNumber(rs.getInt(1));
				vo.setCommentNumber(rs.getInt(2));
				vo.setCommentParent(rs.getInt(3));
				vo.setCommentChild(rs.getInt(4));
				vo.setCommentContents(rs.getString(5));
				vo.setCommentWriter(rs.getString(6));
				vo.setCommentRegister(rs.getString(7));
				return vo;				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean commentChildUpdate(int boardNumber) {
		try {
			String sql = "update comment set commentchild = (commentchild+1) where boardnumber = ?";
			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, boardNumber);
			int result = ps.executeUpdate();
			if (result == 1) {
				System.out.println("commentChildUpdate()에서 쿼리 실행");
				return true;
			} else if (result == 0) {
				System.out.println("commentChildUpdate()에서 쿼리 결과 없음");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("commentChildUpdate()에서 에러 발생");
		} finally {
			DatabaseConnection.close(rs, ps, con);
			System.out.println("commentChildUpdate()에서 데이터베이스 접속 종료");
		}
		return false;
	}

	public boolean commentWrite(CommentVO vo) {
		try {
			String sql = "insert into comment (boardnumber, commentcontents, commentwriter) values (?,?,?)";
			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getBoardNumber());
			ps.setString(2, vo.getCommentContents());
			ps.setString(3, vo.getCommentWriter());
			int result = ps.executeUpdate();
			if (result == 1) {
				System.out.println("commentWrite()에서 쿼리 실행");
				return true;
			} else if (result == 0) {
				System.out.println("commentWrite()에서 쿼리 결과 없음");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("commentWrite()에서 에러 발생");
		} finally {
			DatabaseConnection.close(rs, ps, con);
			System.out.println("commentWrite()에서 데이터베이스 접속 종료");
		}
		return false;
	}
	
	public boolean commentUpdate(int commentNumber, String commentContents) {
		try {
			String sql = "update comment set commentcontents = ? where commentnumber = ?";
			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, commentContents);
			ps.setInt(2, commentNumber);
			int result = ps.executeUpdate();
			if (result == 1) {
				System.out.println("commentUpdate()에서 쿼리 실행");
				return true;
			} else if (result == 0) {
				System.out.println("commentUpdate()에서 쿼리 결과 없음");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("commentUpdate()에서 에러 발생");
		} finally {
			DatabaseConnection.close(rs, ps, con);
			System.out.println("commentUpdate()에서 데이터베이스 접속 종료");
		}
		return false;
	}

	public boolean commentDelete(int commentNumber) {
		try {
			String sql = "delete from comment where commentNumber = ?";
			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, commentNumber);
			int result = ps.executeUpdate();
			if (result == 1) {
				System.out.println("commentDelete()에서 쿼리 실행");
				return true;
			} else if (result == 0) {
				System.out.println("commentDelete()에서 쿼리 결과 없음");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("commentDelete()에서 에러 발생");
		} finally {
			DatabaseConnection.close(rs, ps, con);
			System.out.println("commentDelete()에서 데이터베이스 접속 종료");
		}
		return false;
	}
	
	public int commentNumberFind(int commentNumber) {
		try {
			String sql = "select commentchild from comment where commentnumber=?";
			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, commentNumber);
			rs = ps.executeQuery();
			if (rs.next()) {
				System.out.println("commentNumberFind()에서 쿼리 실행");
				return rs.getInt(1);
			} else {
				System.out.println("commentNumberFind()에서 쿼리 결과 없음");
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("commentNumberFind()에서 에러 발생");
		} finally {
			DatabaseConnection.close(rs, ps, con);
			System.out.println("commentNumberFind()에서 데이터베이스 접속 종료");
		}
		return 0;
	}
	
	public boolean commentChildReplace(int commentNumber) {
		int replace = commentNumberFind(commentNumber);
		try {
			String sql = "update comment set commentchild = (commentchild+1) where commentchild >=?";
			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, replace);
			int result = ps.executeUpdate();
			if (result == 1) {
				System.out.println("commentChildReplace()에서 쿼리 실행");
				return true;
			} else if (result == 0) {
				System.out.println("commentChildReplace()에서 쿼리 결과 없음");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("commentChildReplace()에서 에러 발생");
		} finally {
			DatabaseConnection.close(rs, ps, con);
			System.out.println("commentChildReplace()에서 데이터베이스 접속 종료");
		}
		return false;
	}
	
	public boolean commentReplyWrite(CommentVO vo) {
		try {
			String sql = "insert into comment (boardnumber, commentparent, commentchild, commentcontents, commentwriter) values (?,?,?,?,?)";
			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getBoardNumber());
			ps.setInt(2, vo.getCommentParent());
			ps.setInt(3, vo.getCommentChild());
			ps.setString(4, vo.getCommentContents());
			ps.setString(5, vo.getCommentWriter());
			int result = ps.executeUpdate();
			if (result == 1) {
				System.out.println("commentReplyWrite()에서 쿼리 실행");
				return true;
			} else if (result == 0) {
				System.out.println("commentReplyWrite()에서 쿼리 결과 없음");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("commentReplyWrite()에서 에러 발생");
		} finally {
			DatabaseConnection.close(rs, ps, con);
			System.out.println("commentReplyWrite()에서 데이터베이스 접속 종료");
		}
		return false;
	}
}

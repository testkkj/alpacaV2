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
			String sql = "select * from comment where boardnumber = ?";
			con = DatabaseConnection.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, boardNumber);
			rs = ps.executeQuery();
			ArrayList<CommentVO> arrayList = new ArrayList<CommentVO>();
			while(rs.next()) {
				CommentVO vo = new CommentVO();
				vo.setCommentNumber(rs.getInt(1));
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

}

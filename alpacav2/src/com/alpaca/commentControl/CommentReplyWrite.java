package com.alpaca.commentControl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alpaca.comment.CommentDAO;
import com.alpaca.comment.CommentVO;

/**
 * Servlet implementation class CommentWrite
 */
@WebServlet("/CommentReplyWrite")
public class CommentReplyWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommentReplyWrite() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		int commentNumber = Integer.parseInt(request.getParameter("commentNumber"));

		String id = (String) request.getSession().getAttribute("idFromServlet");
		String contents = request.getParameter("commentContents");

		CommentVO vo = new CommentVO();
		CommentDAO dao = new CommentDAO();
		
		int commentChild = dao.commentNumberFind(commentNumber);
		
		vo.setBoardNumber(boardNumber);
		vo.setCommentParent(commentNumber);
		vo.setCommentChild(commentChild);
		vo.setCommentWriter(id);
		vo.setCommentContents(contents);

		dao.commentChildReplace(commentNumber);
		dao.commentReplyWrite(vo);

		RequestDispatcher rd = request.getRequestDispatcher("BoardView?number=" + boardNumber);
		rd.forward(request, response);
	}

}

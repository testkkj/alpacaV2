package com.alpaca.commentControl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alpaca.board.BoardDAO;
import com.alpaca.comment.CommentDAO;

/**
 * Servlet implementation class CommentDelete
 */
@WebServlet("/CommentDelete")
public class CommentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommentDelete() {
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

		CommentDAO dao = new CommentDAO();
		dao.commentDelete(commentNumber);

		RequestDispatcher rd = request.getRequestDispatcher("BoardView?boardNumber=" + boardNumber);
		rd.forward(request, response);
	}

}

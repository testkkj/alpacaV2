package com.alpaca.boardControl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alpaca.board.BoardDAO;

/**
 * Servlet implementation class BoardUpdate
 */
@WebServlet("/BoardUpdate")
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardUpdate() {
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

		String boardTitle = request.getParameter("boardTitle");
		String boardContents = request.getParameter("boardContents");
		int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));

		BoardDAO dao = new BoardDAO();
		dao.boardUpdate(boardTitle, boardContents, boardNumber);

		RequestDispatcher rd = request.getRequestDispatcher("BoardView?number=" + boardNumber);
		rd.forward(request, response);
	}

}

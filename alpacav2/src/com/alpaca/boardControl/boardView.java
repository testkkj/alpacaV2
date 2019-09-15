package com.alpaca.boardControl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alpaca.board.BoardDAO;
import com.alpaca.board.BoardVo;

/**
 * Servlet implementation class boardView
 */
@WebServlet("/boardView")
public class boardView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public boardView() {
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

		int boardNumber = Integer.parseInt(request.getParameter("number"));

		BoardDAO dao = new BoardDAO();
		dao.boardHits(boardNumber);
		BoardVo vo = dao.boardView(boardNumber);
		request.setAttribute("boardView", vo);

		RequestDispatcher rd = request.getRequestDispatcher("boardView.jsp");
		rd.forward(request, response);

	}

}

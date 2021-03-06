package com.alpaca.boardControl;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alpaca.board.BoardDAO;
import com.alpaca.board.BoardVO;

/**
 * Servlet implementation class BoardList
 */
@WebServlet("/BoardList")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardList() {
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
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> arrayList = dao.boardList(pageNumber);

		request.setAttribute("List", arrayList);
		request.setAttribute("pageNumber", pageNumber);

		int tpage = dao.boardNextNumber();
		if (tpage % 10 == 0) {
			tpage = tpage / 10;
		} else {
			tpage = (tpage / 10) + 1;
		}

		request.setAttribute("tpage", tpage);

		if (arrayList != null) {
			RequestDispatcher rd = request.getRequestDispatcher("boardList.jsp");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("boardListError.jsp");
			rd.forward(request, response);
		}
	}

}

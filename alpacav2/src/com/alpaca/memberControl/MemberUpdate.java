package com.alpaca.memberControl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alpaca.member.MemberDAO;
import com.alpaca.member.MemberVO;

/**
 * Servlet implementation class MemberUpdate
 */
@WebServlet("/MemberUpdate")
public class MemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		String id = (String) request.getSession().getAttribute("idFromServlet");
		String password = request.getParameter("memberPassword");
		String email = request.getParameter("memberEmail");
		String tel = request.getParameter("memberTel");
		
		MemberVO vo = new MemberVO();
		vo.setMemberID(id);
		vo.setMemberPassword(password);
		vo.setMemberEmail(email);
		vo.setMemberTel(tel);
		
		MemberDAO dao = new MemberDAO();
		if (dao.memberUpdate(vo)) {
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("memberPageError.jsp");
			rd.forward(request, response);
		}
	}

}

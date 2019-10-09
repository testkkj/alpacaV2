<%@page import="com.alpaca.board.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.alpaca.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Alpaca</title>
</head>
<body>
	<%
		/*
		servlet에서 arraylist<e>를 받아올때 형변환 경고 무시용
		*/
		String idFromServlet = (String) session.getAttribute("idFromServlet");
		int pageNumber = (int) request.getAttribute("pageNumber");
		int tpage = (int) request.getAttribute("tpage");
		BoardDAO dao = new BoardDAO();
		@SuppressWarnings("unchecked")
		ArrayList<BoardVO> arrayList = (ArrayList<BoardVO>) request.getAttribute("List");
	%>
	<ul class="nav nav-tabs nav-justified">
	<li class="nav-item">
	<a class="nav-link" href="index.jsp">홈으로</a>
	</li>
	<li class="nav-item">
	<a class="nav-link active" href="BoardList">게시판</a>
	</li>
	<li class="nav-item dropdown">
	<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"><%=idFromServlet%>님 환영합니다.</a>
	<div class="dropdown-menu">
	<a class="dropdown-item" href="memberPage.jsp">회원정보 수정</a>
	<a class="dropdown-item" href="memberDelete.jsp">회원 탈퇴</a>
	<a class="dropdown-item" href="MemberLogout">로그아웃</a>
	</div>
	</li>
	</ul>
	<div class="container">
	<table class="table table-hover">
		<tr>
			<th>글 번호</th>
			<th>글 제목</th>
			<th>글 작성자</th>
			<th>글 작성일</th>
			<th>글 조회수</th>
		</tr>
		<%
			for (int i = 0; i < arrayList.size(); i++) {
		%>
		<tr>
			<td><%=arrayList.get(i).getBoardNumber()%></td>
			<td><a
				href="BoardView?boardNumber=<%=arrayList.get(i).getBoardNumber()%>"><%=arrayList.get(i).getBoardTitle()%></a></td>
			<td><%=arrayList.get(i).getBoardWriter()%></td>
			<td><%=arrayList.get(i).getBoardRegister()%></td>
			<td><%=arrayList.get(i).getBoardHits()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<ul class="pagination">
	<li class="page-item">
	<%
		if (pageNumber != 1) {
	%>
	<a class="page-link" href="BoardList?pageNumber=<%=pageNumber - 1%>">이전</a>
	<%
		}
	%>
	</li>
	<li class="page-item">
	<%
		if (dao.boardNextPage(pageNumber + 1)) {
	%>
	<a class="page-link" href="BoardList?pageNumber=<%=pageNumber + 1%>">다음</a>
	<%
		}
	%>
	</li>
	<%
		for (int i = 1; i <= tpage; i++) {
	%>
	<li class="page-item">
	<a class="page-link" href="BoardList?pageNumber=<%=i%>"><%=i%></a>
	</li>
	<%
		}
	%>
	</ul>
	<a class="btn btn-primary" href="boardWrite.jsp">글작성</a>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>
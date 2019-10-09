<%@page import="java.util.ArrayList"%>
<%@page import="com.alpaca.comment.CommentDAO"%>
<%@page import="com.alpaca.comment.CommentVO"%>
<%@page import="com.alpaca.board.BoardVO"%>
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
		String idFromServlet = (String) session.getAttribute("idFromServlet");
		BoardVO vo = (BoardVO) request.getAttribute("boardView");
		CommentDAO cdao = new CommentDAO();
		ArrayList<CommentVO> arrayList = cdao.commentList(vo.getBoardNumber());
	%>
	<ul class="nav nav-tabs nav-justified">
		<li class="nav-item"><a class="nav-link" href="index.jsp">홈으로</a>
		</li>
		<li class="nav-item"><a class="nav-link active" href="BoardList">게시판</a>
		</li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			data-toggle="dropdown" href="#"><%=idFromServlet%>님 환영합니다.</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="memberPage.jsp">회원정보 수정</a> <a
					class="dropdown-item" href="memberDelete.jsp">회원 탈퇴</a> <a
					class="dropdown-item" href="MemberLogout">로그아웃</a>
			</div></li>
	</ul>
	<div class="container">
		<table class="table table-hover">
				<tr>
				<td>
				글 작성자&nbsp;
				<%=vo.getBoardWriter()%>&nbsp;
				글 작성일&nbsp;
				<%=vo.getBoardRegister()%>&nbsp;
				글 조회수&nbsp;
				<%=vo.getBoardHits()%></td>
			</tr>
			<tr>
				<td>글 제목&nbsp;
				<%=vo.getBoardTitle()%></td>
				</tr>
			<tr>
				<td>글 내용&nbsp;
				<%=vo.getBoardContents()%></td>
			</tr>
		</table><br>
		<%
			if (vo.getBoardWriter().equals(idFromServlet)) {
		%>
		<a class="btn btn-primary"
			href="boardUpdate.jsp?boardNumber=<%=vo.getBoardNumber()%>">글수정</a> <a
			class="btn btn-primary"
			href="BoardDelete?boardNumber=<%=vo.getBoardNumber()%>">글삭제</a>
		<%
			}
		%>
		<a class="btn btn-primary"
			href="commentWrite.jsp?boardNumber=<%=vo.getBoardNumber()%>">댓글
			작성</a><br><br>
		<%
			for (int i = 0; i < arrayList.size(); i++) {
		%>
		<table class="table table-hover">
			<tr>
				<td><%=arrayList.get(i).getCommentContents()%></td>
			</tr>
			<tr>
				<td><%=arrayList.get(i).getCommentWriter()%>&nbsp;&nbsp;&nbsp;&nbsp;
				<%=arrayList.get(i).getCommentRegister()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="btn btn-primary"
					href="commentReplyWrite.jsp?boardNumber=<%=vo.getBoardNumber()%>&commentNumber=<%=arrayList.get(i).getCommentNumber()%>">답글
						작성</a>&nbsp; <%
 	if (vo.getBoardWriter().equals(idFromServlet)) {
 %> <a class="btn btn-primary"
					href="commentUpdate.jsp?boardNumber=<%=vo.getBoardNumber()%>&commentNumber=<%=arrayList.get(i).getCommentNumber()%>">댓글
						수정</a>&nbsp; <a class="btn btn-primary"
					href="CommentDelete?boardNumber=<%=vo.getBoardNumber()%>&commentNumber=<%=arrayList.get(i).getCommentNumber()%>">댓글
						삭제</a></td>
				<%
					}
				%>
			</tr>
		</table>
		<%
			}
		%>
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
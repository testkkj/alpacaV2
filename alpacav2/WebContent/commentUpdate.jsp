<%@page import="com.alpaca.comment.CommentVO"%>
<%@page import="com.alpaca.comment.CommentDAO"%>
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
		int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		int commentNumber = Integer.parseInt(request.getParameter("commentNumber"));
		CommentDAO dao = new CommentDAO();
		CommentVO vo = dao.commentView(commentNumber);
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
	<form action="CommentUpdate?boardNumber=<%=boardNumber%>&commentNumber=<%=commentNumber%>"
		method="post">
		<div class="form-group">
		<label for="commentContents">댓글 내용</label>
		<textarea class="form-control" name="commentContents" id="commentContents" rows="10" cols="50" maxlength="500"></textarea>
		</div>
		<input class="btn btn-primary" type="submit" value="댓글 쓰기">
	</form>
	</div>
</body>
</html>
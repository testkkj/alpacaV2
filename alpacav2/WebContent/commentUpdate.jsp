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
<title>Document</title>
</head>
<body>
	<%
		int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		int commentNumber = Integer.parseInt(request.getParameter("commentNumber"));
		CommentDAO dao = new CommentDAO();
		CommentVO vo = dao.commentView(commentNumber);
		out.print(boardNumber+"asdf");
		out.print(commentNumber);
	%>
	<form
		action="CommentUpdate?boardNumber=<%=boardNumber%>&commentNumber=<%=commentNumber%>"
		method="post">
		<label for="commentContents">댓글 내용</label>
		<textarea name="commentContents" id="commentContents" rows="10" cols="50" maxlength="500"></textarea>
		<input type="submit" value="댓글 쓰기">
	</form>
</body>
</html>
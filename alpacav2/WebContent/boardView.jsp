<%@page import="java.util.ArrayList"%>
<%@page import="com.alpaca.comment.CommentDAO"%>
<%@page import="com.alpaca.comment.CommentVO"%>
<%@page import="com.alpaca.board.BoardVo"%>
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
		BoardVo vo = (BoardVo) request.getAttribute("boardView");
	%>
	<table>
		<tr>
			<td>글 제목</td>
			<td><%=vo.getBoardTitle()%></td>
		</tr>
		<tr>
			<td>글 작성자</td>
			<td><%=vo.getBoardWriter()%></td>
			<td>글 작성일</td>
			<td><%=vo.getBoardRegister()%></td>
			<td>글 조회수</td>
			<td><%=vo.getBoardHits()%></td>
		</tr>
		<tr>
			<td>글 내용</td>
			<td><%=vo.getBoardContents()%></td>
		</tr>
	</table>
	<%
		if (vo.getBoardWriter() == request.getAttribute("idFromServlet")) {
	%>
	<a href="boardUpdate.jsp?boardNumber=<%=vo.getBoardNumber()%>">글수정</a>
	<a href="BoardDelete?boardNumber=<%=vo.getBoardNumber()%>">글삭제</a>
	<%
		}
	%>
	<form action="CommentWrite?boardNumber=<%=vo.getBoardNumber()%>"
		method="post">
		<textarea id="commentContents" name="commentContents" rows="5"
			cols="50"></textarea>
		<input type="submit" value="댓글쓰기">
	</form>
	<%
		CommentDAO cdao = new CommentDAO();
		ArrayList<CommentVO> arrayList = cdao.commentList(vo.getBoardNumber());
		for (int i = 0; i < arrayList.size(); i++) {
	%>
	<table>
		<tr>
			<td>댓글번호</td>
			<td><%=arrayList.get(i).getCommentNumber()%></td>
			<td>댓글내용</td>
			<td><%=arrayList.get(i).getCommentContents()%></td>
			<td>댓글작성자</td>
			<td><%=arrayList.get(i).getCommentWriter()%></td>
			<td>댓글작성일</td>
			<td><%=arrayList.get(i).getCommentRegister()%></td>
		</tr>
	</table>
	<%
		}
	%>
</body>
</html>
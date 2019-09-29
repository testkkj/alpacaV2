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
<title>Document</title>
</head>
<body>
	<%
		BoardVO vo = (BoardVO) request.getAttribute("boardView");
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
	<a href="commentWrite.jsp?boardNumber=<%=vo.getBoardNumber()%>">댓글
		작성</a>
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
			<td><a href="commentReplyWrite.jsp?boardNumber=<%=vo.getBoardNumber()%>&commentnumber=<%=arrayList.get(i).getCommentNumber()%>">답글 작성</a></td>
			<%
				if(vo.getBoardWriter().equals(session.getAttribute("idFromServlet"))){
			%>
			<td><a href="commentUpdate.jsp?boardNumber=<%=vo.getBoardNumber()%>&commentNumber=<%=arrayList.get(i).getCommentNumber()%>">댓글 수정</a></td>
			<td><a href="CommentDelete?boardNumber=<%=vo.getBoardNumber()%>&commentNumber=<%=arrayList.get(i).getCommentNumber()%>">댓글 삭제</a></td>
			<%
				}
			%>
		</tr>
	</table>
	<%
		}
	%>
</body>
</html>
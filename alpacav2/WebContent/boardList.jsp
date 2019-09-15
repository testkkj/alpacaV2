<%@page import="com.alpaca.board.BoardVo"%>
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
<title>Document</title>
</head>
<body>
	<%
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVo> arrayList = dao.boardList();
	%>
	<table>
		<tr>
			<th>글 번호</th>
			<th>글 제목</th>
			<th>글 작성자</th>
			<th>글 작성일</th>
			<th>글 조회수</th>
		</tr>
		<% for(int i = 0; i < arrayList.size(); i++) { %>
		<tr>
			<td><%=arrayList.get(i).getBoardNumber() %></td>
			<td><a href="boardView?number=<%=arrayList.get(i).getBoardNumber()%>"><%=arrayList.get(i).getBoardTitle() %></a></td>
			<td><%=arrayList.get(i).getBoardWriter() %></td>
			<td><%=arrayList.get(i).getBoardRegister() %></td>
			<td><%=arrayList.get(i).getBoardHits() %></td>
		</tr>
		<% } %>
	</table>
	<a href="boardWrite.jsp">글쓰기</a>
</body>
</html>
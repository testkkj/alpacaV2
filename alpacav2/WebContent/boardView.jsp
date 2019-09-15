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
</body>
</html>
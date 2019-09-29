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
<title>Document</title>
</head>
<body>
	<%
		/*
		servlet에서 arraylist<e>를 받아올때 형변환 경고 무시용
		*/
		int pageNumber = (int) request.getAttribute("pageNumber");
		int tpage = (int) request.getAttribute("tpage");
		BoardDAO dao = new BoardDAO();
		@SuppressWarnings("unchecked")
		ArrayList<BoardVO> arrayList = (ArrayList<BoardVO>) request.getAttribute("List");
	%>
	<table>
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
	<%
		if (pageNumber != 1) {
	%>
	<a href="BoardList?pageNumber=<%=pageNumber - 1%>">이전</a>
	<%
		}
		if (dao.boardNextPage(pageNumber + 1)) {
	%>
	<a href="BoardList?pageNumber=<%=pageNumber + 1%>">다음</a>
	<%
		}
	%>
	<%
		for (int i = 1; i <= tpage; i++) {
	%>
	<a href="BoardList?pageNumber=<%=i%>"><%=i%></a>
	<%
		}
	%>
	<a href="boardWrite.jsp">글작성</a>
</body>
</html>
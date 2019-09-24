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
		@SuppressWarnings("unchecked")
		servlet에서 arraylist<e>를 받아올때 형변환 경고 무시용
		*/
		int pageNumber = 1;
		if(request.getParameter("pageNumber")!=null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> arrayList = dao.boardList(pageNumber);
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
				href="BoardView?number=<%=arrayList.get(i).getBoardNumber()%>"><%=arrayList.get(i).getBoardTitle()%></a></td>
			<td><%=arrayList.get(i).getBoardWriter()%></td>
			<td><%=arrayList.get(i).getBoardRegister()%></td>
			<td><%=arrayList.get(i).getBoardHits()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<%=dao.boardNextNumber() %>
	<%
	int tpage = dao.boardNextNumber()/10;%>
	<%for(int i=0;i<tpage;i++){
		%>
		<a href="boardList.jsp?pageNumber=<%=i%>"><%=i %></a>
		<%
	} %>
	<a href="boardWrite.jsp">글작성</a>
</body>
</html>
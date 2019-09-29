<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
	%>
	<form action="CommentWrite?boardNumber=<%=boardNumber%>" method="post">
		<textarea id="commentContents" name="commentContents" rows="5"
			cols="50"></textarea>
		<input type="submit" value="댓글쓰기">
	</form>
</body>
</html>
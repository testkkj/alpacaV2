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
	<form action="BoardWrite" method="post">
		<label for="boardTitle">글 제목</label>
		<input type="text" name="boardTitle" id="boardTitle" maxlength="50">
		<label for="boardContents">글 내용</label>
		<textarea name="boardContents" id="boardContents" rows="10" cols="50" maxlength="500"></textarea>
		<input type="submit" value="글쓰기">
	</form>
</body>

</html>
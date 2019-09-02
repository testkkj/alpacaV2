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
정말 탈퇴 하시겠습니까?
<form action="MemberDelete" method="post">
        <label for="memberPassword">비밀번호</label>
        <input type="password" name="memberPassword" id="memberPassword"><br>
        <input type="submit" value="회원탈퇴">
    </form>
</body>
</html>
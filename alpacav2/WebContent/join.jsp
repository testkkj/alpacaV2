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
    <form action="MemberJoin" method="post">
        <label for="memberID">아이디</label>
        <input type="text" name="memberID" id="memberID"><br>
        <label for="memberPassword">비밀번호</label>
        <input type="password" name="memberPassword" id="memberPassword"><br>
        <label for="memberName">이름</label>
        <input type="text" name="memberName" id="memberName"><br>
        <label for="memberGender">남성</label>
        <input type="radio" name="memberGender" id="memberGender" value="남성">
        <label for="memberGender">여성</label>
        <input type="radio" name="memberGender" id="memberGender" value="여성"><br>
        <label for="memberBirthday">생일</label>
        <input type="date" name="memberBirthday" id="memberBirthday"><br>
        <label for="memberEmail">이메일</label>
        <input type="email" name="memberEmail" id="memberEmail"><br>
        <label for="memberTel">전화번호</label>
        <input type="tel" name="memberTel" id="memberTel"><br>
        <input type="submit" value="회원가입">
    </form>
</body>

</html>
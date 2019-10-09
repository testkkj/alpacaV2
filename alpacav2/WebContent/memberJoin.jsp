<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Alpaca</title>
</head>

<body>
<div class="container">
    <form action="MemberJoin" method="post">
    <div class="form-group">
        <label for="memberID">아이디</label>
        <input class="form-control" type="text" name="memberID" id="memberID" placeholder="ID를 입력하세요">
        </div>
        <div class="form-group">
        <label for="memberPassword">비밀번호</label>
        <input class="form-control" type="password" name="memberPassword" id="memberPassword" placeholder="비밀번호를 입력하세요">
        </div>
        <div class="form-group">
        <label for="memberName">이름</label>
        <input class="form-control" type="text" name="memberName" id="memberName" placeholder="이름을 입력하세요">
        </div>
        <div class="form-group">
        <label for="memberGender">남성</label>
        <input class="form-control" type="radio" name="memberGender" id="memberGender" value="남성">
        </div>
        <div class="form-group">
        <label for="memberGender">여성</label>
        <input class="form-control" type="radio" name="memberGender" id="memberGender" value="여성">
        </div>
        <div class="form-group">
        <label for="memberBirthday">생일</label>
        <input class="form-control" type="date" name="memberBirthday" id="memberBirthday" placeholder="엣지,파이어폭스,크롬에선 팝업이 나타납니다.">
        </div>
        <div class="form-group">
        <label for="memberEmail">이메일</label>
        <input class="form-control" type="email" name="memberEmail" id="memberEmail" placeholder="test@mail.com">
        </div>
        <div class="form-group">
        <label for="memberTel">전화번호</label>
        <input class="form-control" type="tel" name="memberTel" id="memberTel" placeholder="01012345678">
        </div>
        <input class="btn btn-primary" type="submit" value="회원가입">
    </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>

</html>
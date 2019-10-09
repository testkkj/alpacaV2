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
<%
		String idFromServlet = (String) session.getAttribute("idFromServlet");
	%>
	<ul class="nav nav-tabs nav-justified">
	<li class="nav-item">
	<a class="nav-link" href="index.jsp">홈으로</a>
	</li>
	<li class="nav-item">
	<a class="nav-link" href="BoardList">게시판</a>
	</li>
	<li class="nav-item dropdown">
	<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"><%=idFromServlet%>님 환영합니다.</a>
	<div class="dropdown-menu">
	<a class="dropdown-item" href="memberPage.jsp">회원정보 수정</a>
	<a class="dropdown-item active" href="memberDelete.jsp">회원 탈퇴</a>
	<a class="dropdown-item" href="MemberLogout">로그아웃</a>
	</div>
	</li>
	</ul>
	<div class="container">
정말 탈퇴 하시겠습니까?<br><br>
<form action="MemberDelete" method="post">
<div class="form-group">
        <label for="memberPassword">비밀번호</label>
        <input class="form-control" type="password" name="memberPassword" id="memberPassword"><br>
        </div>
        <input class="btn btn-primary type="submit" value="회원탈퇴">
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
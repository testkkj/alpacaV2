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
		if (session.getAttribute("idFromServlet") == null) {
	%>
	<div class="container">
	방문을 환영합니다.<br>
	회원가입과 로그인 그리고 게시판 기능을 가진 간단한 페이지 입니다.<br><br>
	
	회원가입을 하시면 더 둘러 보실수 있습니다.<br><br>
	<a class="btn btn-primary" href="memberJoin.jsp" role="button">가입하기</a>
	&nbsp;&nbsp;&nbsp;또는&nbsp;&nbsp;&nbsp;
	<a class="btn btn-primary" href="memberLogin.jsp" role="button">로그인</a>
	</div>
	<%
		} else if (session.getAttribute("idFromServlet") != null) {
			String idFromServlet = (String) session.getAttribute("idFromServlet");
	%>
	<ul class="nav nav-tabs nav-justified">
	<li class="nav-item">
	<a class="nav-link active" href="index.jsp">홈으로</a>
	</li>
	<li class="nav-item">
	<a class="nav-link" href="BoardList">게시판</a>
	</li>
	<li class="nav-item dropdown">
	<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"><%=idFromServlet%>님 환영합니다.</a>
	<div class="dropdown-menu">
	<a class="dropdown-item" href="memberPage.jsp">회원정보 수정</a>
	<a class="dropdown-item" href="memberDelete.jsp">회원 탈퇴</a>
	<a class="dropdown-item" href="MemberLogout">로그아웃</a>
	</div>
	</li>
	</ul>
	<div class="container">
	방문을 환영합니다.<br>
	회원가입과 로그인 그리고 게시판 기능을 가진 간단한 페이지 입니다.<br><br>
	향후 추가할 항목은
	<ul>
	<li>모든 종류의 파일 업로드 작성</li>
	<li>제작과정을 정리한 글목록</li>
	</ul>
	등을 우선 계획중입니다.<br><br>
	작업중인 사항은
	<ul>
	<li>코드 최적화 / 정리</li>
	<li>게시판에서 글 추천 기능(구상중)</li>
	<li>폼입력값 검사에 JS추가</li>
	</ul>
	등이 현재 작업 및 구상중입니다.<br><br>
	</div>
	<%
		}
	%>
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
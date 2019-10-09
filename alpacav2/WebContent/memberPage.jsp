<%@page import="com.alpaca.member.MemberVO"%>
<%@page import="com.alpaca.member.MemberDAO"%>
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
request.setCharacterEncoding("UTF-8");
String idFromServlet = (String) session.getAttribute("idFromServlet");
MemberDAO dao = new MemberDAO();
MemberVO vo = dao.memberInformation(idFromServlet);
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
	<a class="dropdown-item active" href="memberPage.jsp">회원정보 수정</a>
	<a class="dropdown-item" href="memberDelete.jsp">회원 탈퇴</a>
	<a class="dropdown-item" href="MemberLogout">로그아웃</a>
	</div>
	</li>
	</ul>
	<div class="container">
<form action="MemberUpdate" method="post">
<div class="form-group">
        <label for="memberID">아이디</label>
        <input class="form-control" type="text" name="memberID" id="memberID" disabled="disabled" value="<%=vo.getMemberID()%>">
        </div>
        <div class="form-group">
        <label for="memberPassword">비밀번호</label>
        <input class="form-control" type="password" name="memberPassword" id="memberPassword" value="<%=vo.getMemberPassword()%>">
        </div>
        <div class="form-group">
        <label for="memberName">이름</label>
        <input class="form-control" type="text" name="memberName" id="memberName" disabled="disabled" value="<%=vo.getMemberName()%>">
        </div>
        <div class="form-group">
        <label for="memberGender"><%=vo.getMemberGender() %></label>
        <input class="form-control" type="radio" name="memberGender" id="memberGender" checked="checked" value="<%=vo.getMemberGender()%>">
        </div>
        <div class="form-group">
        <label for="memberBirthday">생일</label>
        <input class="form-control" type="date" name="memberBirthday" id="memberBirthday" disabled="disabled" value="<%=vo.getMemberBirthday()%>">
        </div>
        <div class="form-group">
        <label for="memberEmail">이메일</label>
        <input class="form-control" type="email" name="memberEmail" id="memberEmail" value="<%=vo.getMemberEmail()%>">
        </div>
        <div class="form-group">
        <label for="memberTel">전화번호</label>
        <input class="form-control" type="tel" name="memberTel" id="memberTel" value="<%=vo.getMemberTel()%>">
        </div>
        <input class="btn btn-primary" type="submit" value="회원정보 수정">
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
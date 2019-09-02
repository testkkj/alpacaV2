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
		if (session.getAttribute("id") == null) {
	%>
	첫페이지입니다.
	<a href="join.jsp">가입하기</a>
	<a href="login.jsp">로그인</a>
	<%
		} else if (session.getAttribute("id") != null) {
			String id = (String) session.getAttribute("id");
	%>
	<%=id%>님 환영합니다.
	<a href="mypage.jsp">회원정보 수정</a>
	<a href="delete.jsp">회원 탈퇴</a>
	<a href="MemberLogout">로그아웃</a>
	<%
		}
	%>
</body>
</html>
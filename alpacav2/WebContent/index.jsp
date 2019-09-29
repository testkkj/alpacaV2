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
		if (session.getAttribute("idFromServlet") == null) {
	%>
	첫페이지입니다.
	<a href="memberJoin.jsp">가입하기</a>
	<a href="memberLogin.jsp">로그인</a>
	<%
		} else if (session.getAttribute("idFromServlet") != null) {
			String idFromServlet = (String) session.getAttribute("idFromServlet");
	%>
	<%=idFromServlet%>님 환영합니다.
	<a href="memberPage.jsp">회원정보 수정</a>
	<a href="memberDelete.jsp">회원 탈퇴</a>
	<a href="MemberLogout">로그아웃</a>
	<a href="BoardList">게시판</a>
	<%
		}
	%>
</body>
</html>
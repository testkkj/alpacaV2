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
<title>Document</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
MemberDAO dao = new MemberDAO();
MemberVO vo = dao.memberInformation(id);
%>
<form action="MemberUpdate" method="post">
        <label for="memberID">아이디</label>
        <input type="text" name="memberID" id="memberID" readonly="readonly" value="<%=vo.getMemberID()%>"><br>
        <label for="memberPassword">비밀번호</label>
        <input type="password" name="memberPassword" id="memberPassword" value="<%=vo.getMemberPassword()%>"><br>
        <label for="memberName">이름</label>
        <input type="text" name="memberName" id="memberName" disabled="disabled" value="<%=vo.getMemberName()%>"><br>
        <label for="memberGender"><%=vo.getMemberGender() %></label>
        <input type="radio" name="memberGender" id="memberGender" checked="checked" value="<%=vo.getMemberGender()%>"><br>
        <label for="memberBirthday">생일</label>
        <input type="date" name="memberBirthday" id="memberBirthday" disabled="disabled" value="<%=vo.getMemberBirthday()%>"><br>
        <label for="memberEmail">이메일</label>
        <input type="email" name="memberEmail" id="memberEmail" value="<%=vo.getMemberEmail()%>"><br>
        <label for="memberTel">전화번호</label>
        <input type="tel" name="memberTel" id="memberTel" value="<%=vo.getMemberTel()%>"><br>
        <input type="submit" value="회원가입">
    </form>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> 회원제 게시판 (Main) </title>
</head>
<body>
<form action="/login" method="get">
    <input type="text" name="memberEmail" placeholder="이메일 입력">
    <input type="text" name="memberPassword" placeholder="비밀번호 입력">
    <input type="submit" value="로그인">
</form>
<a href="/member/save">회원가입</a>
</body>
</html>

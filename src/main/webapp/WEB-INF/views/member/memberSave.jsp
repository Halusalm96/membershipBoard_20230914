<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> 회원가입 </title>
</head>
<body>
    <form action="/member/save/date" method="post">
        <input type="text" name="memberEmail" placeholder="이메일 입력">
        <input type="text" name="memberPassword" placeholder="비밀번호 입력">
        <input type="text" name="memberName" placeholder="이름 입력">
        <input type="text" name="memberMobile" placeholder="전화번호 입력">
        <input>
        <input type="submit" value="회원가입">
    </form>
</body>
</html>
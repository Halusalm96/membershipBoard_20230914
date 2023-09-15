<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> 회원가입 </title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
    <form action="/member/save/date" method="post">
        <input type="text" name="memberEmail" id="memberEmail" onkeyup="Email_fn()" placeholder="이메일 입력">
        <p id="email-check-result"></p>
        <input type="text" name="memberPassword" placeholder="비밀번호 입력">
        <input type="text" name="memberName" placeholder="이름 입력">
        <input type="text" name="memberMobile" placeholder="전화번호 입력">
        <input>
        <input type="submit" value="회원가입">
    </form>
</body>
<script>
    const Email_fn = () =>{
        const memberEmail = document.getElementById("memberEmail").value;
        const result = document.getElementById("email-check-result");
        $.ajax({
            type : "post",
            url : "/email-check",
            data : {
                memberEmail
            },
            success : function () {
                result.innerHTML = "사용가능한 이메일입니다."
            },
            error : function () {
                result.innerHTML = "이미 사용중인 이메일입니다."
            }
        });

    }
</script>
</html>
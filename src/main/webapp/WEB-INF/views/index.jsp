<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> 회원제 게시판 (Main) </title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>

</head>
<body>
<form action="/login" method="get">
    <input type="text" name="memberEmail" placeholder="이메일 입력">
    <div class="row g-3 align-items-center">
        <div class="col-3 input-group">
            <span class="input-group-text"> 비 밀 번 호 </span>
            <input type="password"  name="memberPassword" id="inputPassword6" class="form-control" aria-describedby="passwordHelpInline">
        </div>
    </div>
    <input type="submit" value="로그인">
</form>
<a href="/member/save">회원가입</a>
</body>
<script>

</script>
</html>

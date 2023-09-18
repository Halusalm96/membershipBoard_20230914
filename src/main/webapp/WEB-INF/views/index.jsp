<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> 회원제 게시판 (Main) </title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <!--브트스트립-->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>
    <!--    한글 패치-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
<div class="row justify-content-center">
    <form action="/login" method="get" class="card m-5 col-4">
        <div class="row">
            <div class="col">
                <div class="row g-3 align-items-center m-3 justify-content-center">
                    <div class="col ms-5 me-5">
                        <div class="input-group">
                            <input type="email" name="memberEmail" id="memberEmail" class="form-control"
                                   aria-describedby="passwordHelpInline" placeholder="아 이 디">
                        </div>
                    </div>
                </div>
                <div class="row g-3 align-items-center m-3 justify-content-center">
                    <div class="col ms-5 me-5">
                        <div class="input-group">
                            <input type="password" name="memberPassword" id="memberPassword" class="form-control"
                                   aria-describedby="passwordHelpInline" placeholder="비 밀 번 호">
                        </div>
                    </div>
                </div>
                <div class="text-center mb-6">
                    <input type="button" value="로그인" class="btn btn-secondary" onclick="memberCoke_fn()"
                           style="width: 250px;">
                    <input type="button" value="회원가입" class="btn btn-dark" onclick="memberSave_fn()"
                           style="width: 250px">
                </div>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    const memberSave_fn = () => {
        location.href = "/member/save";
    }
    const memberCoke_fn = () => {
        const memberEmail = document.getElementById("memberEmail").value;
        const memberPassword = document.getElementById("memberPassword").value;
        $.ajax({
            type: "get",
            url: "/login",
            data: {
                memberPassword,
                memberEmail
            },
            success: function () {
                console.log("로그인 성공");
                location.href="/member/memberLogin";
            },
            error: function () {
                alert("아이디 및 비밀번호를 다시 확인해주세요.");
                document.getElementById("memberEmail").value = "";
                document.getElementById("memberPassword").value = "";
                }
        });
    }
</script>
</html>

<!--향후 적용 바람-->
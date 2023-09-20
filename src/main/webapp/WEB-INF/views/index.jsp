<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원제 게시판</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <style>
        body {
            background-color: gray;
        }

        .card {
            background-color: lightgray;
            width: 66%;
            margin: 0 auto;
            padding: 20px; /* 카드 내부 패딩 추가 */
        }

        .form-control {
            background-color: black;
            color: white;
            margin-bottom: 10px; /* 입력란 아래 간격 추가 */
        }

        ::placeholder {
            color: white !important;
        }

        .btn-block {
            margin-top: 10px; /* 버튼 위 간격 추가 */
            width: 100%; /* 버튼의 너비를 100%로 설정하여 옆으로 늘립니다. */
        }

        .header {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px; /* 헤더 아래 간격 추가 */
        }
    </style>
</head>
<body>
<div class="row justify-content-center" style="height: 100vh; align-items: center;">
    <div class="col-md-6">
        <form action="/login" method="get" class="card p-4">
            <!-- 헤더 추가 -->
            <div class="header">회원제 게시판</div>
            <div class="form-group">
                <input type="email" name="memberEmail" id="memberEmail" class="form-control"
                       aria-describedby="emailHelp" placeholder="아이디">
            </div>
            <div class="form-group">
                <input type="password" name="memberPassword" id="memberPassword" class="form-control"
                       aria-describedby="passwordHelp" placeholder="비밀번호">
            </div>
            <div class="row justify-content-between">
                <div class="col-md-6">
                    <input type="button" value="로그인" class="btn btn-secondary btn-block"
                           onclick="memberCoke_fn()">
                </div>
                <div class="col-md-6">
                    <input type="button" value="회원가입" class="btn btn-dark btn-block"
                           onclick="memberSave_fn()">
                </div>
            </div>
        </form>
    </div>
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
                location.href = "/member/memberLogin";
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

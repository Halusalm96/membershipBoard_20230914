<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> 회원제 게시판 (Main) </title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <!-- 브트스트립 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>
    <!-- 한글 패치 -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <style>
        body {
            background-color: gray; /* 배경색 변경 */
        }
        .card {
            background-color: lightgray; /* 카드 배경색 변경 */
            width: 66%; /* 카드가 화면의 3분의 2를 차지하도록 수정 */
            margin: 0 auto; /* 가운데 정렬 */
        }
        .form-control {
            background-color: black; /* 입력란 배경색 변경 */
            color: white; /* 입력란 텍스트 색상 변경 */
        }
        ::placeholder {
            color: white !important; /* placeholder 텍스트 색상 변경 */
        }
    </style>
</head>
<body>
<div class="row justify-content-center" style="height: 100vh; align-items: center;">
    <div class="col-md-6">
        <form action="/login" method="get" class="card p-4">
            <div class="form-group">
                <input type="email" name="memberEmail" id="memberEmail" class="form-control"
                       aria-describedby="emailHelp" placeholder="아 이 디">
            </div>
            <div class="form-group">
                <input type="password" name="memberPassword" id="memberPassword" class="form-control"
                       aria-describedby="passwordHelp" placeholder="비 밀 번 호">
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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 페이지</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- Bootstrap CDN 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* 추가적인 CSS 스타일 */
        body {
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;

        }

        .custom-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form {
            margin-top: 20px;
        }

        input[type="email"],
        input[type="text"] {
            margin: 10px 0;
            padding: 10px;
            width: 100%;
            border: none;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 5px;
        }

        input[type="button"] {
            background-color: #333333;
            color: #FFFFFF;
            font-size: 18px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        input[type="button"]:hover {
            background-color: #555555;
        }
    </style>
</head>
<body>
<%@include file="component/nav.jsp" %>
<div class="custom-container">
    <h2>회원 페이지</h2>
    <form action="/member/save/update" method="post" name="updateForm">
        <input type="hidden" id="id" name="id" value="${memberDTO.id}">
        <div class="form-group">
            <label for="memberEmail">이메일</label>
            <input type="email" class="form-control" id="memberEmail" name="memberEmail" value="${memberDTO.memberEmail}" readonly>
        </div>
        <div class="form-group">
            <label for="board-pass">비밀번호</label>
            <input type="password" class="form-control" id="board-pass" name="memberPassword" placeholder="비밀번호를 입력하세요">
        </div>
        <div class="form-group">
            <label for="memberName">이름</label>
            <input type="text" class="form-control" id="memberName" name="memberName" value="${memberDTO.memberName}">
        </div>
        <div class="form-group">
            <label for="memberMobile">전화번호</label>
            <input type="text" class="form-control" id="memberMobile" name="memberMobile" value="${memberDTO.memberMobile}">
        </div>
        <input type="button" class="btn btn-primary" value="탈퇴" onclick="member_delete()">
        <input type="button" class="btn btn-success" value="완료" onclick="member_update()">
    </form>
</div>
</body>
<script>
    const member_update = () => {
        const pass = '${memberDTO.memberPassword}';
        const inputPass = document.getElementById("board-pass").value;

        if (pass === inputPass) {
            document.updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다!");
        }
    }
    const member_delete = () => {
        const pass = '${memberDTO.memberPassword}';
        const inputPass = document.getElementById("board-pass").value;
        if (pass === inputPass) {
            location.href = "/member/delete?id=${memberDTO.id}";
        } else {
            alert("비밀번호가 일치하지 않습니다!");
        }
    }
</script>
</html>

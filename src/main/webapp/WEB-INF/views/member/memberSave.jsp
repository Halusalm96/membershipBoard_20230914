<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- Bootstrap CDN 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* 추가적인 CSS 스타일 */
        body {
            background-color: #f0f0f0;
            padding: 20px;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form {
            margin-top: 20px;
        }

        input[type="email"],
        input[type="text"],
        textarea {
            margin: 10px 0;
            padding: 10px;
            width: 100%;
            border: none;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 5px;
        }

        input[type="file"] {
            margin-top: 10px;
        }

        input[type="submit"] {
            background-color: #333333;
            color: #FFFFFF;
            font-size: 18px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background-color: #555555;
        }

        #email-check-result {
            color: #007bff;
            font-weight: bold;
        }
    </style>
</head>
<body>
<%@include file="component/nav.jsp" %>
<div class="container">
    <h2>회원가입</h2>
    <form action="/member/save/date" method="post">
        <div class="form-group">
            <label for="memberEmail">이메일</label>
            <input type="email" class="form-control" id="memberEmail" name="memberEmail" onkeyup="checkEmail()" placeholder="이메일 입력">
        </div>
        <p id="email-check-result"></p>
        <div class="form-group">
            <label for="memberPassword">비밀번호</label>
            <input type="password" class="form-control" id="memberPassword" name="memberPassword" placeholder="비밀번호 입력">
        </div>
        <div class="form-group">
            <label for="memberName">이름</label>
            <input type="text" class="form-control" id="memberName" name="memberName" placeholder="이름 입력">
        </div>
        <div class="form-group">
            <label for="memberMobile">전화번호</label>
            <input type="text" class="form-control" id="memberMobile" name="memberMobile" placeholder="전화번호 입력">
        </div>
        <div class="form-group">
            <label for="boardContents">추가 정보</label>
            <textarea class="form-control" id="boardContents" name="boardContents" cols="30" rows="10"></textarea>
        </div>
        <div class="form-group">
            <label for="boardFile">파일 업로드</label>
            <input type="file" class="form-control-file" id="boardFile" name="boardFile" multiple>
        </div>
        <input type="submit" class="btn btn-primary" value="회원가입">
    </form>
</div>
</body>
<script>
    const checkEmail = () => {
        const memberEmail = document.getElementById("memberEmail").value;
        const result = document.getElementById("email-check-result");
        $.ajax({
            type: "post",
            url: "/email-check",
            data: {
                memberEmail: memberEmail
            },
            success: function () {
                result.innerHTML = "사용 가능한 이메일입니다.";
            },
            error: function () {
                result.innerHTML = "이미 사용 중인 이메일입니다.";
            }
        });
    }
    <%@include file="component/footer.jsp" %>
</script>
</html>

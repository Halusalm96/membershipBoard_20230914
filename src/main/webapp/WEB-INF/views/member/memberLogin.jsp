<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원제 게시판</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        h2 {
            color: #333333;
        }

        .welcome-message {
            margin-top: 20px;
            font-size: 18px;
        }

        .footer {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<%@include file="component/nav.jsp" %>
<div class="container">
    <h2>회원제 게시판에 오신 걸 환영합니다.</h2>
    <p class="welcome-message">로그인이 완료되어 안전하게 이용하실 수 있습니다.</p>
</div>
<div class="container footer">
    <%@include file="component/footer.jsp" %>
</div>
</body>
</html>

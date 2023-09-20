<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회원 상세 조회</title>
    <!-- Bootstrap CSS 추가 -->
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

        .table {
            margin-top: 20px;
        }

        .btn {
            padding: 5px 10px;
        }
    </style>
</head>
<body>
<%@include file="component/nav.jsp" %>
<div class="container">
    <h2>회원 상세 조회</h2>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>번호</th>
            <th>이메일</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>동작</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${memberList}" var="member">
            <tr>
                <td>${member.id}</td>
                <td>${member.memberEmail}</td>
                <td>${member.memberPassword}</td>
                <td>${member.memberName}</td>
                <td>${member.memberMobile}</td>
                <td>
                    <button class="btn btn-info" onclick="delete_fn('${member.id}')">탈퇴</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
<script>
    const delete_fn = (id) => {
        location.href = "/member/delete?id=" + id;
    }
</script>
</html>

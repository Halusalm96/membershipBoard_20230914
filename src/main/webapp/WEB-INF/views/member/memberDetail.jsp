<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> 회원 상세 조회 </title>
</head>
<body>
<table class="table table-bordered">
    <tr>
        <td>번호</td>
        <td>이메일</td>
        <td>비밀번호</td>
        <td>이름</td>
        <td>전화번호</td>
        <%--        <td>이미지</td>--%>
    </tr>
    <c:forEach items="${memberList}" var="member">
        <tr>
            <td>${member.id}</td>
            <td>${member.memberEmail}</td>
            <td>${member.memberPassword}</td>
            <td>${member.memberName}</td>
            <td>${member.memberMobile}</td>
                <%--        <td>${board.fileAttachde}</td>--%>
            <td>
                <button class="btn btn-info" onclick="delete_fn('${member.id}')">탈퇴</button>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
<script>
    const delete_fn = () => {
        location.href = "/member/delete?id=${member.id}";
    }
</script>
</html>

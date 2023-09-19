<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 페이지</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<%@include file="component/nav.jsp" %>

<form action="/member/save/update" method="post" name="updateForm">
    <input type="hidden" id="id" name="id" value="${memberDTO.id}">
    <input type="email" name="memberEmail" id="memberEmail" value="${memberDTO.memberEmail}" readonly>
    <input type="text" name="memberPassword" id="board-pass" placeholder="비밀번호를 입력하세요">
    <input type="text" name="memberName" value="${memberDTO.memberName}">
    <input type="text" name="memberMobile" value="${memberDTO.memberMobile}">
    <%--    <textarea name="boardContents" cols="30" rows="10"></textarea> <br>--%>
    <%--    <input type="file" name="memberFile" multiple value="${memberDTO.memberFile}"> <br>--%>
    <input type="button" value="탈퇴" onclick="member_delete()">
    <input type="button" value="완료" onclick="member_update()">
</form>
</body>
<script>
    const member_update = () => {
        const pass = '${memberDTO.memberPassword}';
        const inputPass = document.getElementById("board-pass").value;
        if (pass == inputPass) {
            document.updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다!");
        }
    }
    const member_delete = () => {
        const pass = '${memberDTO.memberPassword}';
        const inputPass = document.getElementById("board-pass").value;
        if (pass == inputPass) {
            location.href = "/member/delete?id=${memberDTO.id}";
        } else {
            alert("비밀번호가 일치하지 않습니다!");
        }
    }
    <%@include file="component/footer.jsp" %>
</script>
</html>

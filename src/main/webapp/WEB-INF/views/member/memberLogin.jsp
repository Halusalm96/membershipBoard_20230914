<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> 회원제 게시판 </title>
</head>
<body>
<h2> ${loginMemberEmail}님 환영합니다. </h2>

<a href="/board/save">글작성</a>
<a href="/board/list">글목록</a>
<a href="/member/main?memberEmail=${loginMemberEmail}">마이페이지</a>
<a href="/logout">로그아웃</a>
</body>
<script>
    const delete_fn = () =>{

    }
</script>
</html>

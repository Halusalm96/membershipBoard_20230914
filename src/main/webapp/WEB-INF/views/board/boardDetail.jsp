<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title> 글 정보 상세 조회 </title>
</head>
<body>
<table class="table table-bordered">
    <tr>
        <td>번호</td>
        <td>제목</td>
        <td>작성자</td>
        <td>내용</td>
        <td>조회수</td>
        <td>작성일자</td>
        <%--        <td>이미지</td>--%>
    </tr>
    <tr>
        <td>${board.id}</td>
        <td>${board.boardTitle}</td>
        <td>${board.boardWriter}</td>
        <td>${board.boardContents}</td>
        <td>${board.boardHits}</td>
        <td>${board.createdAt}</td>
        <%--        <td>${board.fileAttachde}</td>--%>
    </tr>
</table>
<table class="table table-bordered">
    <tr>
        <td>번호</td>
        <td>작성자</td>
        <td>내용</td>
        <td>작성일자</td>
        <%--        <td>이미지</td>--%>
    </tr>
    <c:forEach items="${commentList}" var="commentList">
        <tr>
            <td>${commentList.id}</td>
            <td>${commentList.commentWriter}</td>
            <td>${commentList.commentContents}</td>
            <td>${commentList.creatdeAt}</td>
        </tr>
    </c:forEach>
</table>
<form action="/comment/save" method="post">
    <input type="text" name="commentWriter" value="${board.boardWriter}" readonly> <br>
    <textarea name="commentContents" cols="30" rows="10" placeholder="내용"></textarea> <br>
    <input type="hidden" name="boardId" value="${board.id}">
    <input type="submit" value="등록" onclick="comment_fn('${board.id}')">
</form>
</body>
<script>
    const comment_fn = (id) =>{
        location.href = "/board/detail?id=" + id;
    }
</script>
</html>

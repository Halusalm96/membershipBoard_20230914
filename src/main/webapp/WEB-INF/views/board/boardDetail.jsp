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
    <c:forEach items="${boardList}" var="board">
    <tr>
        <td>${board.id}</td>
        <td>${board.boardTitle}</td>
        <td>${board.boardWriter}</td>
        <td>${board.boardContents}</td>
        <td>${board.boardHits}</td>
        <td>${board.createdAt}</td>
            <%--        <td>${board.fileAttachde}</td>--%>
        <td>
            <button class="btn btn-info" onclick="detail_fn('${board.id}')">조회</button>
        </td>
    </tr>
    </c:forEach>
</body>
</html>

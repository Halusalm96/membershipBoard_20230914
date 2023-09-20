<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>글 정보 상세 조회</title>
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

        table {
            margin-top: 20px;
        }

        form {
            margin-top: 20px;
        }

        textarea {
            resize: none;
        }
    </style>
</head>
<body>
<%@include file="component/nav.jsp" %>
<div class="container">
    <h2>글 정보 상세 조회</h2>
    <table class="table table-bordered">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>내용</th>
            <th>조회수</th>
            <th>작성일자</th>
        </tr>
        <tr>
            <td>${board.id}</td>
            <td>${board.boardTitle}</td>
            <td>${board.boardWriter}</td>
            <td>${board.boardContents}</td>
            <td>${board.boardHits}</td>
            <td>${board.createdAt}</td>
        </tr>
    </table>
    <h3>댓글 목록</h3>
    <table class="table table-bordered">
        <tr>
            <th>번호</th>
            <th>작성자</th>
            <th>내용</th>
            <th>작성일자</th>
        </tr>
        <c:forEach items="${commentList}" var="comment">
            <tr>
                <td>${comment.id}</td>
                <td>${comment.commentWriter}</td>
                <td>${comment.commentContents}</td>
                <td>${comment.createdAt}</td>
            </tr>
        </c:forEach>
    </table>
    <h3>댓글 작성</h3>
    <form action="/comment/save" method="post">
        <div class="form-group">
            <label for="commentWriter">작성자</label>
            <input type="text" class="form-control" id="commentWriter" name="commentWriter" value="${loginMemberEmail}" readonly>
        </div>
        <div class="form-group">
            <label for="commentContents">내용</label>
            <textarea class="form-control" id="commentContents" name="commentContents" cols="30" rows="10" placeholder="내용"></textarea>
        </div>
        <input type="hidden" name="boardId" value="${board.id}">
        <button type="submit" class="btn btn-primary">등록</button>
    </form>
</div>
</body>
</html>

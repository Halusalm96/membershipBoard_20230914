<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시판 글 목록</title>
    <!-- Bootstrap CDN 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* 추가적인 CSS 스타일 */
        body {
            background-color: #f0f0f0;
            margin: 0; /* body 요소의 margin을 0으로 설정 */
            padding: 20px 0; /* 위 아래 여백만 남기고 좌우 여백 없음 */
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 0 auto; /* 수평 가운데 정렬을 위해 추가 */
            max-width: 100%; /* 화면 크기에 따라 최대 너비 설정 */
            margin-top: 0; /* container 요소의 위쪽 margin을 0으로 설정 */
        }

        table {
            margin-top: 20px;
        }

        form {
            margin-top: 20px;
        }

        #search-area {
            padding: 20px;
            background-color: #e0e0e0;
            border-radius: 5px;
        }

        .pagination {
            margin-top: 20px;
        }

        .btn-info {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-info:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
<%@include file="component/nav.jsp" %>
<div class="container">
    <h2>게시판 글 목록</h2>
    <!-- 검색 창 -->
    <div class="container" id="search-area">
        <form action="/board/check" method="get">
            <div class="form-group">
                <select class="form-control" name="type">
                    <option value="boardTitle">제목</option>
                    <option value="boardWriter">작성자</option>
                </select>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="q" placeholder="검색어를 입력하세요">
            </div>
            <button type="submit" class="btn btn-primary">검색</button>
        </form>
    </div>
    <table class="table table-bordered">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>내용</th>
            <th>조회수</th>
            <th>작성일자</th>
            <th>조회</th>
        </tr>
        <c:forEach items="${boardList}" var="board">
            <tr>
                <td>${board.id}</td>
                <td><a href="/board?id=${board.id}&page=${paging.page}&q=${q}&type=${type}">${board.boardTitle}</a></td>
                <td>${board.boardWriter}</td>
                <td>${board.boardContents}</td>
                <td>${board.boardHits}</td>
                <td>${board.createdAt}</td>
                <td>
                    <button class="btn btn-info" onclick="detail_fn('${board.id}')">조회</button>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="container">
        <ul class="pagination justify-content-center">
            <c:choose>
                <c:when test="${paging.page<=1}">
                    <li class="page-item disabled">
                        <a class="page-link">이전</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/list?page=${paging.page-1}&q=${q}&type=${type}">이전</a>
                    </li>
                </c:otherwise>
            </c:choose>

            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                <c:choose>
                    <c:when test="${i eq paging.page}">
                        <li class="page-item active">
                            <a class="page-link">${i}</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="/board/list?page=${i}&q=${q}&type=${type}">${i}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:choose>
                <c:when test="${paging.page>=paging.maxPage}">
                    <li class="page-item disabled">
                        <a class="page-link">다음</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/list?page=${paging.page+1}&q=${q}&type=${type}">다음</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>
</body>
<script>
    const detail_fn = (id) => {
        location.href = "/board/detail?id=" + id;
    }
</script>
</html>

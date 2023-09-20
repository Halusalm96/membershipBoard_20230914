<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>
    <style>
        #header {
            text-align: center;
            background-color: black;
            height: 200px;
        }

        h1 {
            font-size: 48px; /* 글자 크기를 더 크게 조절 (48px는 예시입니다) */
            color: white;
            line-height: 1.5; /* 글자 위아래 간격을 조절 (1.5는 예시입니다) */
        }

        #main-content {
            text-align: center; /* 텍스트 중앙 정렬 */
            background-color: black; /* 배경색을 검은색으로 변경 */
            color: white; /* 글자색을 흰색으로 변경 */
            padding: 20px; /* 내용과 경계 사이의 간격 추가 */
        }

        .navbar {
            background-color: gray !important; /* 파랑색 부분을 회색으로 변경 */
        }

        .navbar-dark .navbar-toggler-icon {
            background-color: white !important; /* 네비게이션 아이콘의 배경색을 흰색으로 변경 */
        }

        .navbar-dark .navbar-toggler-icon:focus {
            outline: none; /* 네비게이션 아이콘 클릭 시 포커스 효과 제거 */
        }

        .navbar-dark .navbar-toggler {
            border-color: white !important; /* 네비게이션 토글 버튼의 테두리 색상을 흰색으로 변경 */
        }

        .navbar-nav .nav-link {
            color: white !important; /* 네비게이션 링크 글자색을 흰색으로 변경 */
        }

        .navbar-nav .nav-link.active {
            background-color: gray !important; /* 활성화된 네비게이션 링크 배경색을 회색으로 변경 */
            border-radius: 5px; /* 활성화된 링크의 모서리를 둥글게 만듭니다. */
        }
    </style>
</head>
<body>
<div class="row">
    <div class="col">
        <div id="header">
            <h1 class="mb-5">회원제 게시판</h1>
        </div>
    </div>
</div>
<div class="row">
    <div class="col" id="main-content">
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="/member/memberLogin" id="home">Home</a>
                <button class="navbar-toggler" type="button"
                        data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/board/save">글작성</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/board/list">글목록</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page"
                               href="/member/main?memberEmail=${loginMemberEmail}"> 마이페이지</a>
                        </li>
                        <c:if test="${loginMemberEmail=='admin@icia.com'}">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="/member/list">회원관리</a>
                            </li>
                        </c:if>
                    </ul>
                    <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/logout">로그아웃</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>
<script>

</script>
</body>
</html>

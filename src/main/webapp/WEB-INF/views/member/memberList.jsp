<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title> 게시판 글 목록 </title>
</head>
<body>
<div id="section">
  <%-- 검색 창 --%>
  <div class="container" id="search-area">
<%--    이부분 아직 안했으니깐 해야돼 --%>
    <form action="/member/check" method="get">
      <select name="type">
        <option value="boardTitle">제목</option>
        <option value="boardWriter">작성자</option>
      </select>
      <input type="text" name="q" placeholder="검색어를 입력하세요">
      <input type="submit" value="검색">
    </form>
  </div>
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
          <button class="btn btn-info" onclick="detail_fn('${member.id}')">조회</button>
        </td>
      </tr>
    </c:forEach>
  </table>
  <div class="container">
    <ul class="pagination justify-content-center">
      <c:choose>
        <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌 --%>
        <c:when test="${paging.page<=1}">
          <li class="page-item disabled">
            <a class="page-link">[이전]</a>
          </li>
        </c:when>
        <%-- 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
        <c:otherwise>
          <li class="page-item">
            <a class="page-link" href="/board/list?page=${paging.page-1}&q=${q}&type=${type}">[이전]</a>
          </li>
        </c:otherwise>
      </c:choose>

      <%--  for(int i=startPage; i<=endPage; i++)      --%>
      <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
        <c:choose>
          <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 --%>
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
            <a class="page-link">[다음]</a>
          </li>
        </c:when>
        <c:otherwise>
          <li class="page-item">
            <a class="page-link" href="/board/list?page=${paging.page+1}&q=${q}&type=${type}">[다음]</a>
          </li>
        </c:otherwise>
      </c:choose>
    </ul>
  </div>
</body>
<script>
  const detail_fn = (id) => {
    location.href = "/member/detail?id=" + id;
  }
</script>
</html>

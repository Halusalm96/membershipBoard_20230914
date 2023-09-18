<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="nav">
  <ul class="menu">
    <li class="menu-item">
      <a href="/board/save">글작성</a>
    </li>
    <li class="menu-item">
      <a href="/board/list">글목록</a>
    </li>
    <!-- 로그인 여부에 따라 로그인했으면 oo님 환영합니다. 로그아웃링크 보이고
         로그인 하지 않았으면 로그인 이 보이도록
    -->
    <li class="menu-item" id="abmin@icia.com">
    </li>
    <li class="menu-item">
      <a href="/member/main?memberEmail=${loginMemberEmail}">마이페이지</a>
    </li>
    <li class="menu-item">
      <a href="/logout">로그아웃</a>
    </li>
  </ul>
</div>
<script>
  const loginArea = document.getElementById("abmin@icia.com");
  const loginEmail = "abmin@icia.com";
  console.log(loginEmail.length);
  if (loginArea=="abmin@icia.com") {
    // 로그인 했음
    loginArea.innerHTML = "<a href='/mypage'>" + "관리자님 환영해요!</a>" +
            "<a href='/member/list'>회원목록</a>";
  }

</script>
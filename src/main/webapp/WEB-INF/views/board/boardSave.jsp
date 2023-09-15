<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> 게시판 글 작성 </title>
</head>
<body>
    <form action="/board/save/date" method="post">
        <input type="text" name="boardTitle" placeholder="제목">
        <input type="text" name="boardWriter" value="${loginMemberEmail}" readonly>
        <textarea name="boardContents" cols="30" rows="10" placeholder="내용"></textarea> <br>
        <input type="file" name="boardFile" multiple> <br>
        <input type="submit" value="등록">
    </form>
</body>
</html>

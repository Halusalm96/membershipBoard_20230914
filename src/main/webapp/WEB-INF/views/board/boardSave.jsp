<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시판 글 작성</title>
    <style>

        form {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        input[type="text"],
        textarea {
            color: #333333;
            margin: 10px 0;
            padding: 10px;
            font-size: 20px;
            width: 100%;
            border: none;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 5px;
        }

        input[type="file"] {
            margin-top: 10px;
        }

        input[type="submit"] {
            background-color: #333333;
            color: #FFFFFF;
            font-size: 20px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%@include file="component/nav.jsp" %>
<form action="/board/save/date" method="post" style="background-color: black;">
    <input type="text" name="boardTitle" placeholder="제목">
    <input type="text" name="boardWriter" value="${loginMemberEmail}" readonly>
    <textarea name="boardContents" cols="30" rows="10" placeholder="내용"></textarea>
    <input type="file" name="boardFile" multiple>
    <input type="submit" value="등록">
</form>
</body>
</html>

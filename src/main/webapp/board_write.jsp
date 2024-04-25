<%@ page contentType="text/html; charset=utf-8" %>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.0.0/dist/minty/bootstrap.min.css">
    <title>글쓰기</title>
</head>
<body>
    <div class="container">
        <h1>글쓰기</h1>

        <form action="board_save.jsp" method="post" accept-charset="UTF-8">
            <div class="form-group">
                <label for="title">제목:</label>
                <input type="text" class="form-control" id="title" name="title">
            </div>
            <div class="form-group">
                <label for="author">작성자:</label>
                <input type="text" class="form-control" id="author" name="author">
            </div>
            <div class="form-group">
                <label for="content">내용:</label>
                <textarea class="form-control" id="content" name="content"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">저장</button>
        </form>
    </div>
</body>
</html>

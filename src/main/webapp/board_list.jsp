<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.0.0/dist/minty/bootstrap.min.css">
    <title>게시판</title>
</head>
<body>
    <div class="container">
        <h1>게시판 목록</h1>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성일</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        // 데이터베이스 연결 설정
                        Class.forName("com.mysql.jdbc.Driver");
                        String url = "jdbc:mysql://localhost:3306/GrowCropsDB";
                        String username = "root";
                        String password = "1234";
                        Connection conn = DriverManager.getConnection(url, username, password);

                        // SQL 문 실행
                        String sql = "SELECT * FROM board ORDER BY board_id DESC";
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            int boardId = rs.getInt("board_id");
                            String title = rs.getString("title");
                            String author = rs.getString("author");
                            Timestamp createdAt = rs.getTimestamp("created_at");

                            // 게시물 테이블에 추가
                            %>
                            <tr>
                                <th scope="row"><%=boardId%></th>
                                <td><a href="board_view.jsp?board_id=<%=boardId%>"><%=title%></a></td>
                                <td><%=author%></td>
                                <td><%=createdAt%></td>
                            </tr>
                            <%
                        }

                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>

        <a href="board_write.jsp" class="btn btn-primary">글쓰기</a>
    </div>
</body>
</html>

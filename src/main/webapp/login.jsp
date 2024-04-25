<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page import="java.sql.DriverManager" %>

<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.0.0/dist/minty/bootstrap.min.css">
<title>로그인</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>				
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				}

				String userid = request.getParameter("id");
				String password = request.getParameter("password");

				if (userid != null && password != null) {
					try {
						Connection conn = null;
						PreparedStatement pstmt = null;
						ResultSet rs = null;

						try {
							// 데이터베이스 연결 설정
							conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GrowCropsDB", "root", "1234");

							String query = "SELECT * FROM users WHERE userid = ? AND password = ?";
							pstmt = conn.prepareStatement(query);
							pstmt.setString(1, userid);
							pstmt.setString(2, password);
							rs = pstmt.executeQuery();

							if (rs.next()) {
								session.setAttribute("userid", rs.getString("userid"));
								session.setAttribute("cropname", rs.getString("cropname"));
								session.setAttribute("croptype", rs.getString("croptype"));

								if (rs.wasNull()) {
									String redirectURL = "newCrop.jsp";
									response.sendRedirect(redirectURL);
								} else {
									String redirectURL = "main.jsp";
									response.sendRedirect(redirectURL);
								}
							} else {
								response.sendRedirect("login.jsp?error=true");
							}
						} finally {
							if (rs != null) {
								rs.close();
							}
							if (pstmt != null) {
								pstmt.close();
							}
							if (conn != null) {
								conn.close();
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			%>

			<form class="form-signin" action="" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">UserId</label>
					<input type="text" class="form-control" placeholder="ID" name='id' required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password" name='password' required>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>
			
			<a href="signup.jsp" class="btn btn-lg btn-primary btn-block">회원가입하기</a>
		</div>
	</div>
</body>
</html>

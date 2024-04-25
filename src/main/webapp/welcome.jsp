<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.0.0/dist/minty/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>	
	<%
    String greeting = "! Grow Crops !";
    String tagline = "!-Grow Crops에 오신 것을 환영합니다-!";
	%>

<div style="text-align: center;">
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">
				<%=greeting%>
			</h1>
		</div>
	</div>
	<main role="main">
	<div class="container">
		<div class="text-center">
			<h3>
				<%=tagline%>
			</h3>		
			<a href="./signup.jsp" class="btn btn-secondary">회원가입</a>
			<a href="./login.jsp" class="btn btn-secondary">로그인</a>
		</div>
		<hr>
	</div>
	</main>
</div>
</body>
</html>

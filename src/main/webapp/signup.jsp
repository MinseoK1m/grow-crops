<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.0.0/dist/minty/bootstrap.min.css">
	<script type="text/javascript">
		function checkForm() {
			if (!document.signup.user.value) {
				alert("아이디를 입력하세요.");
				return false;
			}

			if (!document.signup.password.value) {
				alert("비밀번호를 입력하세요.");
				return false;
			}

			if (document.signup.password.value !== document.signup.password_confirm.value) {
				alert("비밀번호를 동일하게 입력하세요.");
				return false;
			}
		}
	</script>
	<title>회원 가입</title>
</head>
<body>
	<div class="container" align="center">
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">회원 가입</h1>
			</div>
		</div>
		<div class="container">
			<form name="signup" class="form-horizontal" action="signup_process.jsp" method="post" onsubmit="return checkForm()">
				<div class="form-group row">
					<label class="col-sm-2">아이디</label>
					<div class="col-sm-3">
						<input name="userid" type="text" class="form-control" placeholder="userid">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-3">
						<input name="password" type="password" class="form-control" placeholder="password">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">비밀번호 확인</label>
					<div class="col-sm-3">
						<input name="password_confirm" type="password" class="form-control" placeholder="password confirm">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">성명</label>
					<div class="col-sm-3">
						<input name="username" type="text" class="form-control" placeholder="username">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">전화번호</label>
					<div class="col-sm-3">
						<input name="phone" type="text" class="form-control" placeholder="phone">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">주소</label>
					<div class="col-sm-5">
						<input name="address" type="text" class="form-control" placeholder="address">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-primary" value="가입하기">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>

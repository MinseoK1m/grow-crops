<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.0.0/dist/minty/bootstrap.min.css">
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/GrowCropsDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM users WHERE userid=?
   <sql:param value="<%=sessionId%>" />
</sql:query>


	
	<title>정보 수정</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">정보 수정</h1>
		</div>
	</div>
	
	<div class="container">
		<form name="newUser" class="form-horizontal"
			action="editUser_process.jsp" method="post"
			onsubmit="return checkForm()">
			<div class="form-group  row">
  				<label class="col-sm-2 ">아이디</label>
 					 <div class="col-sm-3">
   					 <c:if test="${not empty resultSet}">
     					 <input name="userid" type="text" class="form-control" placeholder="id" value="<c:out value='${row.userid }'/>" />
    				</c:if>
  					</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="password" type="text" class="form-control"
						placeholder="password" value="<c:out value='${row.password }'/>" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호확인</label>
				<div class="col-sm-3">
					<input name="password_confirm" type="text" class="form-control"
						placeholder="password_confirm" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="username" type="text" class="form-control"
						placeholder="name" value="<c:out value='${row.username }'/>" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control" placeholder="phone" value="<c:out value='${row.phone}'/>">

				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 ">주소</label>
				<div class="col-sm-5">
					<input name="address" type="text" class="form-control" placeholder="address" value="<c:out value='${row.address}'/>">
				</div>
			</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="회원수정 "> 
					<a href="deleteuser.jsp" class="btn btn-primary">회원탈퇴</a>
				</div>
			</div>
		</form>	
	</div>
</body>
</html>
<script type="text/javascript">
	
	function checkForm() {
		if (!document.newUser.userid.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		if (!document.newUser.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (document.newUser.password.value != document.newUser.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
</script>

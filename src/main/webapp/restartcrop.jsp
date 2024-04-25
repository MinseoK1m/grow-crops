<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.0.0/dist/minty/bootstrap.min.css">
<%
String sessionId = (String) session.getAttribute("userid");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/GrowCropsDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM users WHERE userid=?
   <sql:param value="<%=sessionId%>" />
</sql:query>
<style>
h2 {
	font-size: 16px;
}
h3{
	font-size: 16px;
}
h4{
	font-size: 16px;
}
</style>

	
	<title>새 작물 생성</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">새로운 작물 생성</h1>
			<h2>이전의 작물은 사라지며 작물에 관한 모든 요소는 초기화 됩니다.</h2>
			<h3>작물의 종류는 총 4가지로 (고구마, 감자, 양파, 옥수수)에서만 선택 가능합니다.</h3>
			<h4>새로 생성 후, 다시 로그인을 하고 들어와야 함.</h4>
		</div>
	</div>
	
	<div class="container">
		<form name="newUser" class="form-horizontal"
			action="restartcrop_process.jsp" method="post">
			<div class="form-group  row">
  				<label class="col-sm-2 ">작물 종류</label>
 					 <div class="col-sm-3">
   					 <c:if test="${not empty resultSet}">
						<input name="croptype" type="text" class="form-control" placeholder="작물 종류" value="<c:out value='${row.croptype}'/>" />
					</c:if>

  					</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">작물 이름</label>
				<div class="col-sm-3">
					<input name="cropname" type="text" class="form-control"
						placeholder="cropname" value="<c:out value='${row.cropname }'/>" >
				</div>
			</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="hidden" name="userid" value="<%=sessionId%>">
					<input type="submit" class="btn btn-primary" value="새로 생성 "> 
				</div>
			</div>
		</form>	
	</div>
</body>
</html>

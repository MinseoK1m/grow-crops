<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	String sessionId = (String) session.getAttribute("userid");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/GrowCropsDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:update dataSource="${dataSource}" var="resultSet">
   DELETE FROM users WHERE userid = ?
   <sql:param value="<%=sessionId%>" />
</sql:update>

<c:choose>
	<c:when test="${resultSet >= 1}">
		<c:import url="logout.jsp" />
		<c:redirect url="login.jsp" />
	</c:when>
	<c:otherwise>
		<p>회원 탈퇴에 실패했습니다.</p>
	</c:otherwise>
</c:choose>

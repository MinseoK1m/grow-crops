<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	request.setCharacterEncoding("UTF-8");

	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	String username = request.getParameter("username"); 
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");

%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/GrowCropsDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:update dataSource="${dataSource}" var="updateCount">
   INSERT INTO users (userid, password, username, phone, address) VALUES (?, ?, ?, ?, ?)
   <sql:param value="<%=userid%>" />
   <sql:param value="<%=password%>" />
   <sql:param value="<%=username%>" />
   <sql:param value="<%=phone%>" />
   <sql:param value="<%=address%>" />
</sql:update>

<c:if test="${updateCount >= 1}">
	<c:redirect url="signup_success.jsp" />
</c:if>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String userid = request.getParameter("userid");
	String croptype = request.getParameter("croptype");
	String cropname = request.getParameter("cropname");
	String cropcondStr = request.getParameter("cropcond");
	int cropcond;
	if (cropcondStr != null && !cropcondStr.isEmpty()) {
		cropcond = Integer.parseInt(cropcondStr);
	} else {
		cropcond = 0; 
	}
	
	Date currentDatetime = new Date(System.currentTimeMillis());
	java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
	java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/GrowCropsDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:update dataSource="${dataSource}" var="resultSet">
   UPDATE users SET croptype=?, cropname=?, cropcond=? WHERE userid=?
	<sql:param value="<%=croptype%>" />
	<sql:param value="<%=cropname%>" />
	<sql:param value="<%=cropcond%>" />
	<sql:param value="<%=userid%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="login.jsp?msg=0" />
</c:if>

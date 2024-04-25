<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
    request.setCharacterEncoding("utf-8");

    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String content = request.getParameter("content");
    
%>

<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/GrowCropsDB"
    driver="com.mysql.jdbc.Driver" user="root" password="1234" />

  <sql:update dataSource="${dataSource}" var="insertCount">
    INSERT INTO board (title, author, content) VALUES (?, ?, ?)
    <sql:param value="<%=title%>" />
    <sql:param value="<%=author%>" />
    <sql:param value="<%=content%>" />
</sql:update>
   

<% 
   response.sendRedirect("main.jsp");
%>



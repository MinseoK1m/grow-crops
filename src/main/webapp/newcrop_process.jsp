<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
    request.setCharacterEncoding("utf-8");

    String cropName = request.getParameter("cropName");
    String selectedCropType = request.getParameter("selectedCropType");

    String selectedCropId = request.getParameter("selectedCropId");
    
    if ("crop1".equals(selectedCropId)) {
        selectedCropId = "고구마";
    } else if ("crop2".equals(selectedCropId)) {
        selectedCropId = "감자";
    } else if ("crop3".equals(selectedCropId)) {
        selectedCropId = "양파";
    } else if ("crop4".equals(selectedCropId)) {
        selectedCropId = "옥수수";
    }
    
    String userid = (String) session.getAttribute("userid");
    String cropname = (String) session.getAttribute("cropname");
    String croptype = (String) session.getAttribute("croptype");


    session.setAttribute("croptype", selectedCropType);
    session.setAttribute("cropname", cropName);
%>

<%
   int insertCount = 0;
   int updateCount = 0;
%>
<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/GrowCropsDB"
    driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<c:choose>
    <c:when test="${not empty cropName and not empty selectedCropId}">
        <sql:update dataSource="${dataSource}" var="insertCount">
            INSERT INTO users (cropname, croptype) VALUES (?, ?)
            <sql:param value="<%=cropName%>" />
            <sql:param value="<%=selectedCropId%>" />
        </sql:update>
    </c:when>
    <c:otherwise>
        <c:set var="insertCount" value="0" />
    </c:otherwise>
</c:choose>

<sql:update dataSource="${dataSource}" var="updateCount">
    UPDATE users SET cropname = ?, croptype = ? WHERE userid = ?
    <sql:param value="<%=cropName%>" />
    <sql:param value="<%=selectedCropId%>" />
    <sql:param value="<%=userid%>" />
</sql:update>
<% 
   response.sendRedirect("main.jsp");
%>

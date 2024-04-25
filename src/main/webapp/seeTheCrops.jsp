<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<html>
<head>
<title>작물 구경가기</title>
<style>
  .container {
    display: flex;
    align-items: center;
  }

  .image {
    width: 10%;
    height: 15%;
  }

  .cropsImage {
    display: flex;
    align-items: center;
  }
  
  .cropsInfo {
    display: flex;
    align-items: center;
    margin-left: 20px;
  }
  
  .image-buttons-left {
	margin-left: 200px;
  }
</style>
</head>
<body>
  <div class="container">
    <img class="image" src="./resources/img/구경.jpg" alt="구경">
    <h1>작물 구경</h1>
  </div>

  <div class="image-buttons-left">
    <% 
      try {
        // JDBC 연결 설정
        Class.forName("com.mysql.jdbc.Driver"); 
        String url = "jdbc:mysql://localhost:3306/GrowCropsDB"; 
        String dbUsername = "root"; 
        String dbPassword = "1234"; 

        Connection connection = DriverManager.getConnection(url, dbUsername, dbPassword);

        String query = "SELECT username, cropname, croptype, cropcond FROM users";
        PreparedStatement statement = connection.prepareStatement(query);
        ResultSet resultSet = statement.executeQuery();

        
        while (resultSet.next()) {
          String usernameFromDB = resultSet.getString("username");
          String cropname = resultSet.getString("cropname");
          String croptype = resultSet.getString("croptype");
          int cropcond = resultSet.getInt("cropcond");

          
          %>
          <div class="cropsImage">
            <img class="image" src="./resources/img/<%= croptype %>.jpg" alt="구경">
            <div class="cropsInfo">
              <h2>[<%= usernameFromDB %>]님의 "<%= cropname %>"</h2>
              <p>(작물 상태: <%= cropcond %>/100)</p>
            </div>
          </div>
          <%
        }

        resultSet.close();
        statement.close();
        connection.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    %>
  </div>
</body>
</html>

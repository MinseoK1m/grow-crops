<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.0.0/dist/minty/bootstrap.min.css">
<title>Main</title>
<style>
  body {
    margin: 0;
  }
  .name {
    display: flex;
    justify-content: center;
    width: 100%;
    font-size: 24px;
    margin-top: 20px;
  }
  .background-image {
    background-image: url('./resources/img/배경.jpg');
    background-position: center;
    background-size: cover;
    flex-wrap: wrap;
    width: 100%;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: row;
  }
  
  .centered-image {
    width: 400px;
    height: 500px;
  }
  
  .image-buttons-left {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    margin-right: 200px;
  }
  
  .image-buttons-right {
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    margin-left: 200px;
  }
  
  .image-button {
    width: 100px;
    height: 100px;
    margin-bottom: 10px;
  }

  .gauge-bar {
    display: flex;
    justify-content: center;
    width: 100%;
  }
  
  .gauge {
    width: 30%; 
    height: 50px;
    appearance: none;
    border: none;
    background-color: #dcf6f6;
    border-radius: 10px;
    overflow: hidden;
    margin: 0 10px;
  }
  
  .gauge::-webkit-progress-bar {
    background-color: #dcf6f6;
    border-radius: 10px;
  }
  
  .gauge::-webkit-progress-value {
    background-color: #00cccc;
    border-radius: 10px;
  }
  
  .gauge::-moz-progress-bar {
    background-color: #00cccc;
    border-radius: 10px;
  }
  
  .watering-button {
    background-color: #00cccc;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
  }
  
  .user-info-container {
    margin-bottom: 30px;
  }
  
  .user-info {
    background-color: rgba(0, 0, 0, 0.6);
    padding: 20px;
    color: white;
    font-size: 16px;
    text-align: center;
    border-radius: 5px;
  }
</style>
<script>
  var gaugeValue = 0;
  
  function watering() {
    gaugeValue += 5;
    document.getElementById('waterGauge').value = gaugeValue;
    
    if (gaugeValue >= 100) {
      document.getElementById('wateringButton').disabled = true;
      alert("축하합니다! 작물을 모두 성장시켰습니다!");
    }
  }
</script>
</head>
<body>
<%
	int cropcond = 0; 
	String userid = (String) session.getAttribute("userid");

	String userpoint = null;
	try {

  	Class.forName("com.mysql.jdbc.Driver"); 
  	String url = "jdbc:mysql://localhost:3306/GrowCropsDB"; 
  	String username = "root"; 
 	String password = "1234"; 
  
  	Connection connection = DriverManager.getConnection(url, username, password);
  
  	String query = "SELECT userpoint FROM users WHERE userid = ?";
  	PreparedStatement statement = connection.prepareStatement(query);
  	statement.setString(1, userid);
  	ResultSet resultSet = statement.executeQuery();
  
  	if (resultSet.next()) {
    	userpoint = resultSet.getString("userpoint");
    	cropcond = resultSet.getInt("cropcond");
  	}
  

  	resultSet.close();
  	statement.close();
  	connection.close();
	} catch (Exception e) {
  		e.printStackTrace();
	}

	String croptype = (String) session.getAttribute("croptype");
	String cropname = (String) session.getAttribute("cropname");
	
	if (croptype == null) {
  		croptype = "고구마";
	}

	if (cropname == null) {
  		cropname = "작물 이름 없음";
	}
	
	session.setAttribute("userpoint", userpoint);
%>
<script>
  var cropcond = <%= cropcond %>;

  function updateProgress(value) {
    var gauge = document.getElementById("waterGauge");
    gauge.value = value;
  }
  
  function watering() {
    cropcond += 5; // 원하는 만큼 값을 증가시키거나 감소시킬 수 있습니다.
    updateProgress(cropcond);

   
  }
</script>

<div class="container">
  <div class="user-info-container">
    <div class="user-info">
      <span>[접속중인 사용자: <%= userid %>]</span>
      <a href="logout.jsp">[로그아웃]</a>
    </div>
  </div>
</div>
<div class="container">
  <div class="background-image">
    <div class="image-buttons-left">
      <img class="image-button" src="./resources/img/룰렛아이콘.png" alt="Button 1"
      onclick="location='roulette.jsp'">룰렛돌리기
      <img class="image-button" src="./resources/img/농작물.png" alt="Button 2"
      onclick="location='seeTheCrops.jsp'">작물 구경가기
      <img class="image-button" src="./resources/img/요리법.png" alt="Button 3"
      onclick="location='cooking.jsp'">요리 비법
      <img class="image-button" src="./resources/img/게시판.png" alt="Button 4"
      onclick="location='board_list.jsp'">리뷰 게시판

    </div>
    
    <%   
    String imageName = ""; 
    if ("고구마".equals(croptype)) {
       imageName = "고구마";
    } else if ("감자".equals(croptype)) {
       imageName = "감자";
    } else if ("양파".equals(croptype)) {
       imageName = "양파";
    } else if ("옥수수".equals(croptype)) {
       imageName = "옥수수";
    }
    %>

    <img class="centered-image" src="./resources/img/<%= imageName %>_누끼.png" alt="<%= imageName %>">

    <div class="image-buttons-right">
      <img class="image-button" src="./resources/img/수정.png" alt="Button 5"
      onclick="location='editUser.jsp'">정보 수정
      <img class="image-button" src="./resources/img/새싹.png" alt="Button 6"
      onclick="location='restartcrop.jsp'">작물 새로 생성
    </div>
    <div class="name"><%= cropname %></div>
    <div class="gauge-bar">
      <progress value="<%= cropcond %>" max="100" id="waterGauge" class="gauge"></progress>

      <button onclick="watering()" id="wateringButton"> 물주기 </button>
    </div>
  </div>
</div>
</body>
</html>
</body>
</html>

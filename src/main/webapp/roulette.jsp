<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.0.0/dist/minty/bootstrap.min.css">
<title>Roulette</title>
<style>
  body {
    margin: 0;
  }
  .roulette-container {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100vh;
  }
  .roulette {
    width: 400px;
    height: 400px;
    background-color: #f0f0f0;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
  }
  .roulette-btn {
    position: absolute;
    bottom: 20px;
    left: calc(50% - 50px);
  }
</style>
<script>
  function spinRoulette() {
    var options = [
      '꽝',
      '5P',
      '10P',
      '20P',
      '30P',
      '50P'
    ];
    var result = document.getElementById('result');
    var rouletteBtn = document.getElementById('rouletteBtn');
    
    var randomNumber = Math.floor(Math.random() * options.length);
    var selectedOption = options[randomNumber];
    
    result.innerHTML = '축하합니다! 당첨 결과: ' + selectedOption;
    
    }
  }
</script>
</head>
<body>
<div class="roulette-container">
  <div class="roulette">
    <h2 id="result">룰렛을 돌려주세요!</h2>
    <button id="rouletteBtn" onclick="spinRoulette()" class="btn btn-primary roulette-btn">룰렛 돌리기</button>
  </div>
  <button onclick="location.href='main.jsp'" class="btn btn-secondary">돌아가기</button>

</div>



</body>
</html>

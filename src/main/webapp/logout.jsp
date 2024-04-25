<%@ page contentType="text/html; charset=utf-8" %>

<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.0.0/dist/minty/bootstrap.min.css">
<style>
    .btn-logout {
        background-color: #88ACA6;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
    }
    
    .btn-back {
        background-color: #88ACA6;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        margin-left: 10px;
    }
</style>
<title>Logout</title>
<script>
    function confirmLogout() {
        var confirmMsg = "로그아웃하시겠습니까?\n로그아웃 후엔 로그인 창으로 이동합니다.";
        if (confirm(confirmMsg)) {
            location.href = "logout_process.jsp";
        }
    }
</script>
</head>
<body>
    <div style="text-align: center; margin-top: 100px;">
        <h3>로그아웃</h3>
        <p>로그아웃하시겠습니까?<br>로그아웃 후엔 로그인 창으로 이동합니다.</p>
        <button class="btn-logout" onclick="confirmLogout()">Logout</button>
        <button class="btn-back" onclick="location.href='main.jsp'">Back</button>
    </div>
</body>
</html>

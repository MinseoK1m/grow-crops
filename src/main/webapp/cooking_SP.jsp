<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>고구마 요리 비법</title>
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
	width: 60%;
	height: 50%;
	margin-left: 30px;
}

.cropsName {
	width: 80%;
	margin-left: 30px;
}

.recipeButton {
	width: 40%;
	margin-left: 50px;
}


.image-buttons-left {
	display: flex;
	flex-direction: row;
	margin-left: 0px;
	margin-top: 80px;
}
</style>
<script type="text/javascript">
  function openPopup(recipe) {
    var width = 500;
    var height = 400;
    var left = (screen.width - width) / 2;
    var top = (screen.height - height) / 2;

    var popupWindow = window.open("", "popup", "width=" + width + ", height=" + height + ", top=" + top + ", left=" + left);

    var content = "<html><head><title>상세 정보</title></head><body>";
    content += "<h2>" + recipe.title + "</h2>";
    content += "<img src='" + recipe.image + "' alt='recipe image' style='width: 200px; height: auto;' />";
    content += "<p>" + recipe.description + "</p>";
    content += "</body></html>";

    popupWindow.document.open();
    popupWindow.document.write(content);
    popupWindow.document.close();
  }
</script>
</head>
<body>
	<div class="container">
		<img class="image" src="./resources/img/요리.jpg" alt="요리">
		<h1>고구마 요리 비법</h1>
	</div>

	<div class="image-buttons-left">
		<div class="cropsName">
			<img class="cropsImage" src="./resources/img/군고구마.png" alt="image 1">
			<h2 class="cropsName">1. 군고구마</h2>
			<button class="recipeButton" onclick="openPopup({ title: '군고구마', image: './resources/img/군고구마.png', description: '1.고구마를 잘 씻어서 프라이팬에 잘 깔아주세요.\n 2.그리고 뚜껑을 닫고 약한 불에 구워주세요.\n 3.약 25분 지나서 뚜껑을 열고 고구마를 뒤집어주세요.그리고 다시 뚜껑을 닫고 약한 불에 구워주세요.\n 4.20분 후에 다시 뚜껑을 열고 젓가락으로 찔러보세요.푹푹 잘 들어가면 다 익은 거에요.잘 안들가면 조금 더 구워주세요.팬에서 고구마 굽기 완성.' })">상세보기</button>
		</div>
		<div class="cropsName">
			<img class="cropsImage" src="./resources/img/맛탕.jpeg" alt="image 2">
			<h2 class="cropsName">2. 고구마맛탕</h2>
			<button class="recipeButton" onclick="openPopup({ title: '고구마맛탕', image: './resources/img/맛탕.jpeg', description: '고구마맛탕의 상세 정보입니다.' })">상세보기</button>
		</div>
		<div class="cropsName">
			<img class="cropsImage" src="./resources/img/고구마샐러드 샌드위치.png" alt="image 3">
			<h2 class="cropsName">3. 고구마샐러드 샌드위치</h2>
			<button class="recipeButton" onclick="openPopup({ title: '고구마샐러드 샌드위치', image: './resources/img/고구마샐러드 샌드위치.png', description: '고구마샐러드 샌드위치의 상세 정보입니다.' })">상세보기</button>
		</div>
	</div>
</body>
</html>

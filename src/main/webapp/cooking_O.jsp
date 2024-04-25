<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>양파 요리 비법</title>
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
		<h1>양파 요리 비법</h1>
	</div>

	<div class="image-buttons-left">
		<div class="cropsName">
			<img class="cropsImage" src="./resources/img/블루밍 어니언.png" alt="image 1">
			<h2 class="cropsName">1. 블루밍 어니언</h2>
			<button class="recipeButton" onclick="openPopup({ title: '블루밍 어니언', image: './resources/img/블루밍 어니언.png', description: '알감자의 상세 정보입니다.' })">상세보기</button>
		</div>
		<div class="cropsName">
			<img class="cropsImage" src="./resources/img/양파 장아찌.png" alt="image 2">
			<h2 class="cropsName">2. 양파 장아찌</h2>
			<button class="recipeButton" onclick="openPopup({ title: '양파 장아찌', image: './resources/img/양파 장아찌.png', description: '감자전의 상세 정보입니다.' })">상세보기</button>
		</div>
		<div class="cropsName">
			<img class="cropsImage" src="./resources/img/양파 달걀 볶음.png" alt="image 3">
			<h2 class="cropsName">3. 양파 달걀 볶음</h2>
			<button class="recipeButton" onclick="openPopup({ title: '양파 달걀 볶음', image: './resources/img/양파 달걀 볶음.png', description: '감자튀김의 상세 정보입니다.' })">상세보기</button>
		</div>
	</div>
</body>
</html>

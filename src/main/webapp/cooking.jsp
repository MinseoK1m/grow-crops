<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>요리 비법</title>
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
	margin-left: 80px;
	margin-top: 80px;
}
</style>
</head>
<body>
	<div class="container">
		<img class="image" src="./resources/img/요리.jpg" alt="요리">
		<h1>요리 비법</h1>
	</div>

	<div class="image-buttons-left">
		<div class="cropsName">
			<img class="cropsImage" src="./resources/img/고구마.jpg" alt="image 1">
			<h2 class="cropsName">고구마레시피</h2>
			<button class="recipeButton" onclick="location='cooking_SP.jsp'">상세보기</button>
		</div>
		<div class="cropsName">
			<img class="cropsImage" src="./resources/img/감자.jpg" alt="image 2">
			<h2 class="cropsName">감자레시피</h2>
			<button class="recipeButton" onclick="location='cooking_P.jsp'">상세보기</button>
		</div>
		<div class="cropsName">
			<img class="cropsImage" src="./resources/img/양파.jpg" alt="image 3">
			<h2 class="cropsName">양파레시피</h2>
			<button class="recipeButton" onclick="location='cooking_O.jsp'">상세보기</button>
		</div>
		<div class="cropsName">
			<img class="cropsImage" src="./resources/img/옥수수.jpg" alt="image 4">
			<h2 class="cropsName">옥수수레시피</h2>
			<button class="recipeButton" onclick="location='cooking_C.jsp'">상세보기</button>
		</div>
	</div>
</body>
</html>

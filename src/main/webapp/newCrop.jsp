<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<title> 작물 선택 </title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.0.0/dist/minty/bootstrap.min.css">

<style>
.card.selected {
  border-color: #cad9c3;
  border-width: 3px;
}
</style>
</head>
<body>
<div class="container">
  <h1> 작물 선택 </h1>
  <div class="row">
    <div class="col-md-3">
      <div class="card" id="crop1" onclick="selectCrop('고구마', 'crop1')">
        <img class="card-img-top" src="./resources/img/고구마.jpg" alt="고구마">
        <div class="card-body">
          <h5 class="card-title">고구마</h5>
          <button class="btn btn-primary" onclick="selectCrop('고구마', 'crop1')">선택</button>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card" id="crop2" onclick="selectCrop('감자', 'crop2')">
        <img class="card-img-top" src="./resources/img/감자.jpg" alt="감자">
        <div class="card-body">
          <h5 class="card-title">감자</h5>
          <button class="btn btn-primary" onclick="selectCrop('감자', '감자')">선택</button>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card" id="crop3" onclick="selectCrop('양파', 'crop3')">
        <img class="card-img-top" src="./resources/img/양파.jpg" alt="양파">
        <div class="card-body">
          <h5 class="card-title">양파</h5>
          <button class="btn btn-primary" onclick="selectCrop('양파', 'crop3')">선택</button>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card" id="crop4" onclick="selectCrop('옥수수', 'crop4')">
        <img class="card-img-top" src="./resources/img/옥수수.jpg" alt="옥수수">
        <div class="card-body">
          <h5 class="card-title">옥수수</h5>
          <button class="btn btn-primary" onclick="selectCrop('옥수수', 'crop4')">선택</button>
        </div>
      </div>
    </div>
  </div>
  <div class="row mt-3">
    <div class="col-md-12 text-center">
      <form method="post" action="newcrop_process.jsp">
        <label for="cropName">작물 이름:</label>
        <input type="text" id="cropName" name="cropName" class="form-control">
        <input type="hidden" id="selectedCropType" name="selectedCropType" value="">
        <input type="hidden" id="selectedCropId" name="selectedCropId" value="">
        <button type="submit" class="btn btn-success">설정 완료</button>
      </form>
    </div>
</div>

</div>


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
let selectedCropId;
let selectedCropType;

function selectCrop(cropType, cropId) {

  if (selectedCropId) {
    const prevCrop = document.getElementById(selectedCropId);
    prevCrop.classList.remove('selected');
  }
  

  const crop = document.getElementById(cropId);
  crop.classList.add('selected');
  
  selectedCropId = cropId;
  selectedCropType = cropType;
  
  console.log('선택한 작물 종류:', selectedCropType);
  console.log('선택한 작물 ID:', selectedCropId);

  document.getElementById("selectedCropType").value = selectedCropType;

  document.getElementById("selectedCropId").value = selectedCropId;
}
</script>

</body>
</html>

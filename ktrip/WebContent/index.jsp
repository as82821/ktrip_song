<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/smoothscroll/1.4.1/SmoothScroll.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>KTrip: 나만을 위한 여행 가이드</title>
	<!-- jQuery and moment.js and rome.js-->
	<script src="./bower_components/jquery/dist/jquery.min.js"></script>
	<script src="./bower_components/moment/min/moment.min.js"></script>
	<!-- Bootstrap -->
	<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<link href="./bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom fonts for this template -->
	<link href="./vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="./index_files/css" rel="stylesheet" type="text/css">
	<link href="./index_files/css(1)" rel="stylesheet" type="text/css">
	<link href="./index_files/icon" rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="./css/clean-blog.min.css" rel="stylesheet">
	<!-- Bootstrap material datetimepicker -->
	<script src="./bower_components/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
	<link href="./bower_components/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet" type="text/css">
	<!-- index.css, index.js -->
	<link href="./css/index.css?after" rel="stylesheet" type="text/css">
	<script src="./js/index.js"></script>
	<!-- common.css, common.js clean-blog.min.js -->
	<link href="./css/common.css" rel="stylesheet" type="text/css">
	<script src="./js/common.js"></script>
	<script src="js/clean-blog.min.js"></script>
</head>
<body>
	<%@ include file="./header.jsp"%>
	<!-- Page Header -->
  <header class="masthead header-blocks scroll" id="index-header-img">
    <div class="index-overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading" id="main-heading">
            <img src="./img/logo2.png" id="main-heading-logo" alt="KTrip">
            <span class="subheading"></span>
            </div>
          </div>
          <div class="form-group search-group">
            <label class="date-label" for="start-date"></label>
            <input type="text" class="date-input form-control" id="start-date" placeholder="출발">
            <label class="date-label" for="start-date"></label>
            <input type="text" class="date-input form-control" id="end-date" placeholder="도착">
            <label class="date-label" for="destination"></label>
            <input type="text" class="date-input form-control" id="destination" placeholder="목적지">
          </div>
        </div>
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="search-heading">
            <button type="button" class="btn search-btn btn-md" id="search" onclick="search_item();">SEARCH</button>
          </div>
          </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container scroll">
    <div class="row">
      <div class="col-lg-9 col-md-10 mx-auto">
        <div class="post-preview">
          <a href="./index.jsp">
            <h2 class="post-title" style="margin-top: 10px">
              Service
            </h2>
            <h3 class="post-subtitle">
              나만을 위한 여행 가이드
            </h3>
          </a>
          <br>
        </div>
      </div>
      <div class="col-sm-6 text-center">
            <div class="mt-5" style="margin-top: 10px!important">
              <i class="fas fa-4x text-primary mb-4 service-contents"><img src="./img/Special.png" class="index-icon" /></i>
              <h3 class="h3 mb-2">Special</h3>
              <p class="text-muted mb-3">현지인만이 경험할 수 있는 <br>최고의 품질과 차별화된 여행 서비스</p>
            </div>
          </div>
          <div class="col-sm-6 text-center">
            <div class="mt-5" style="margin-top: 10px!important">
              <i class="fas fa-4x text-primary mb-4 service-contents"><img src="./img/Optimum.png" class="index-icon" /></i>
              <h3 class="h3 mb-2">Optimum</h3>
              <p class="text-muted mb-3">원치않은 쇼핑과 바가지 구매 등<br>단체 여행 속 불쾌함 제거</p>
            </div>
          </div>
          <div class="col-sm-6 text-center">
            <div class="mt-5" style="margin-top: 10px!important">
              <i class="fas fa-4x text-primary mb-4 service-contents"><img src="./img/Together.png" class="index-icon" /></i>
              <h3 class="h3 mb-2">Together</h3>
              <p class="text-muted mb-3">KT 임직원에 한정된 팔로워로<br>KT 그룹 내 소통 채널 제공</p>
            </div>
          </div>
          <div class="col-sm-6 text-center">
            <div class="mt-5" style="margin-top: 10px!important">
              <i class="fas fa-4x text-primary mb-4 service-contents"><img src="./img/Trust.png" class="index-icon" /></i>
              <h3 class="h3 mb-2">Trust</h3>
              <p class="text-muted mb-3">믿을 수 있는 가이드 선별을 통해<br>안전한 매칭 서비스 제공</p>
            </div>
          </div>
    </div>
  </div>
  
  <!-- Main Content -->
  <div class="container scroll">
    <div class="row">
      <div class="col-lg-9 col-md-10 mx-auto">
        <div class="post-preview">
          <a href="./index.jsp">
            <h2 class="post-title" style="margin-top: 10px">
              Business Model
            </h2>
            <h3 class="post-subtitle">
   
            </h3>
          </a>
          <img class="img-fluid" src="./img/business-model.png">
          <br><br>
        </div>
      </div>
    </div>
  </div>

  <hr>
	<%@ include file="./footer.jsp"%>
</body>
</html>
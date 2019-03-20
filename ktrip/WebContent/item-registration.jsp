<!DOCTYPE html>
<!--사이드 상품 등록 pageNo.9 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Item Registration</title>
  <!-- jQuery and moment.js and rome.js-->
  <script src="./bower_components/jquery/dist/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
  <link href="./bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template -->
  <link href="./vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link src="./index_files/css" rel="stylesheet" type="text/css">
  <link src="./index_files/css(1)" rel="stylesheet" type="text/css">
  <link src="./index_files/icon" rel="stylesheet">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="./css/clean-blog.min.css" rel="stylesheet">
  <!-- faq.css -->
  <link href="./css/item-registration.css" rel="stylesheet" type="text/css">
  <!-- common.css, common.js clean-blog.min.js -->
  <link href="./css/common.css" rel="stylesheet" type="text/css">
  <script src="./js/common.js"></script>
  <script src="js/clean-blog.min.js"></script>
  <script src="./js/item-registration.js"></script>
</head>
<body>
  <%@ include file="./header.jsp"%>
  <!-- Page Header -->
  <header class="masthead header-block" id="item-registration-header-img">
      <div class="overlay"></div>
      <div class="container">
          <div class="row">
              <div class="col-lg-8 col-md-10 mx-auto">
                    <div class="page-heading">
                        <h1>ITEM REGISTRATION</h1>
                        <!--span class="subheading">자주 묻는 질문</span-->
                    </div>
              </div>
          </div>
      </div>
  </header>

  <div class="container">
    <div class="row">
      <div class="col-lg-9 col-md-10 mx-auto">
          <!--Sub Header-->
          <nav class="navbar navbar-expand-lg">
              <div class="container-fluid">
                  <div class="navbar-collapse collapse show" id="navbarResponsive">
                      <ul class="navbar-nav mr-auto">
                          <li class="nav-item">
                              <a class="nav-link" href="./itemServlet?actionMode=LIST">등록한 여행</a>
                          </li>
                          <li class="nav-item">
                              <a class="nav-link" href="./item-registration.jsp">여행 상품 등록</a>
                          </li>
                      </ul>
                  </div>
              </div>
          </nav>
          <hr>
      </div>
      <div class="col-lg-8 col-md-10 mx-auto">
        <!-- Contact Form -->
        <form method="POST" action="/ktrip/itemServlet?actionMode=INS" name="form_item_reg" 
        id="trip_item" onsubmit="return trip_item_check()" novalidate="" enctype="multipart/form-data">
          <!--아이디 확인.-->
          <div class="control-group">
            <h5 class=text-info>상품명</h5>
            <input type="text" class="form-control" placeholder="상품명" id="title" name="title" required
              data-validation-required-message="상품명을 입력해주세요." >
            <p class="help-block text-danger"></p>
          </div>
          <div class="control-group">
            <h5 class=text-info>목적지</h5>
            <input type="text" class="form-control" placeholder="목적지" id="destination" name="destination" required
              data-validation-required-message="목적지를 입력해주세요.">
            <p class="help-block text-danger"></p>
          </div>

          <div class="control-group">
            <h5 class=text-info>최소인원</h5>
            <input type="text" class="form-control" placeholder="최소인원" id="num_min" name="num_min" required
              data-validation-required-message="최소인원을 입력해주세요.">
            <p class="help-block text-danger"></p>
          </div>

          <div class="control-group">
            <h5 class=text-info>최대인원</h5>
            <input type="text" class="form-control" placeholder="최대인원" id="num_max" name="num_max" required
              data-validation-required-message="최대인원을 입력해주세요.">
            <p class="help-block text-danger"></p>
          </div>

          <div class="control-group">
            <h5 class=text-info>기간</h5>
            <input type="text" class="form-control" placeholder="기간" id="duration" name="duration" required
              data-validation-required-message="기간을 입력해주세요.">
            <p class="help-block text-danger"></p>
          </div>
          <div class="control-group">
            <h5 class=text-info>가격(1인당)</h5>
            <input type="text" class="form-control" placeholder="가격(1인당)" id="price" name="price" required
              data-validation-required-message="가격(1인당)을 입력해주세요.">
            <p class="help-block text-danger"></p>
          </div>

          <div class="control-group">
            <h5 class=text-info>상품 컨셉</h5>
            <input type="text" class="form-control" placeholder="상품 컨셉" id="concept" name="concept" required
              data-validation-required-message="상품 컨셉을 입력해주세요.">
            <p class="help-block text-danger"></p>
          </div>

          <div class="control-group">
            <h5 class=text-info>썸네일</h5>
            <input type="file" class="form-control-file" placeholder="썸네일" id="thumbnail" name="thumbnail" required
              data-validation-required-message="썸네일 이미지를 입력해주세요.">
            <p class="help-block text-danger"></p>
          </div>

          <div class="control-group">
            <h5 class=text-info>상품 소개</h5>
            <textarea rows="5" class="form-control" placeholder="상품 소개" id="contents" name="contents" required
              data-validation-required-message="상품 소개를 입력해주세요."></textarea>
            <p class="help-block text-danger"></p>

          </div>
          <div id="success"></div>
          <div class="form-group">
            <button type="submit" class="btn btn-primary" id="signIn">REGISTER</button>
            <button type="button" class="btn btn-primary" id="cancel" onclick=" location.href='./guide.jsp' ">CANCEL</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <hr>

  <%@ include file="./footer.jsp"%>
</body>
</html>

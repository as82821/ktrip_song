<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Guide Registration</title>

    <!-- jQuery and moment.js and rome.js-->
    <script src="./bower_components/jquery/dist/jquery.min.js"></script>
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
    <!-- faq.css -->
    <link href="./css/guide-registration.css" rel="stylesheet" type="text/css">
    <!-- common.css, common.js clean-blog.min.js -->
    <link href="./css/common.css" rel="stylesheet" type="text/css">
    <script src="./js/common.js"></script>
    <script src="js/clean-blog.min.js"></script>
</head>
<body>
	<%@ include file="./header.jsp"%>
    <!-- Page Header -->
    <header class="masthead header-block" id="guide-registration-header-img">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                        <div class="page-heading">
                            <h1>GUIDE REGISTRATION</h1>
                            <!--span class="subheading">자주 묻는 질문</span-->
                        </div>
                </div>
            </div>
        </div>
    </header>
	<!-- Main Content -->
	<div class="container">
	    <div class="row">
	        <div class="col-lg-9 col-md-10 mx-auto">
	            <!--Sub Header-->
	            <nav class="navbar navbar-expand-lg">
	                <div class="container-fluid">
	                    <div class="navbar-collapse collapse show" id="navbarResponsive">
	                        <ul class="navbar-nav mr-auto">
	                            <li class="nav-item">
	                                <a class="nav-link" href="./mypage.jsp">마이페이지</a>
	                            </li>
	                            <li class="nav-item">
	                                <a class="nav-link" href="./userupdate.jsp">회원정보변경</a>
	                            </li>
	                            <li class="nav-item">
	                                <a class="nav-link" href="./guide-registration.jsp">가이드 등록</a>
	                            </li>
	                        </ul>
	                    </div>
	                </div>
	            </nav>
	            <hr>
	        </div>
	        <div class="col-lg-8 col-md-10 mx-auto">
	            <!-- Contact Form - Enter your email address on line 19 of the mail/contact_me.php file to make this form work. -->
	            <!-- WARNING: Some web hosts do not allow emails to be sent through forms to common mail hosts like Gmail or Yahoo. It's recommended that you use a private domain email address! -->
	            <!-- To use the contact form, your site must be on a live web host with PHP! The form will not work locally! -->
	            <form name="guideRegisterForm" id="guideRegisterForm" action="////.jsp" method="post"
	                  autocomplete="off">
	                <div class="control-group">
	                    <h5 class=text-info>SECOND LANGUAGE</h5>
	                    <input type="text" class="form-control" placeholder="가능한 제2 외국어를 설정해 주세요"
	                           id="second_lang" name="second_lang"
	                           required data-validation-required-message="Please enter your Second Language.">
	                    <p class="help-block text-danger"></p>
	                </div>
	                <div class="control-group">
	                    <h5 class=text-info>STAY DURATION</h5>
	                    <input type="text" class="form-control" placeholder="가이드 국가의 거주 기간을 입력해 주세요" id="stay_duration"
	                           name="stay_duration"
	                           required data-validatio65n-required-message="Please enter your Second Language.">
	                    <p class="help-block text-danger"></p>
	                </div>
	                <div class="control-group">
	                    <h5 class=text-info>GUIDE PORTFOLIO</h5>
	                    <input type="file" id="portfolio" name="portfolio">
	                    <p class="help-block text-danger"></p>
	                </div>
	                <div class="control-group">
	                    <h5 class=text-info>IDENTITY DOCUMENT</h5>
	                    <input type="file" id="id_document" name="id_document">
	                    <p class="help-block text-danger"></p>
	                </div>
	                <br>
	                <div class="form-group">
	                <button type="button" form="guideRegisterForm" class="btn btn-primary" id="signIn">REGISTER</button>
	                <button type="button" class="btn btn-primary" id="cancel" onclick="location.href='./index.jsp' "> CANCEL </button>
	                </div>
	            </form>
	        </div>
	    </div>
	</div>
	<hr>
	<%@ include file="./footer.jsp"%>
</body>
</html>
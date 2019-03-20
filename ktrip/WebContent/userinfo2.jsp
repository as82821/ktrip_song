<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.ktds.ktrip.dao.UserDAO"%>
<%@ page import="com.ktds.ktrip.domain.UserVO"%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Mypage</title>
<!-- jQuery and moment.js and rome.js-->
<script src="./bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<link href="./bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom fonts for this template -->
<link href="./vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link href="./index_files/css" rel="stylesheet" type="text/css">
<link href="./index_files/css(1)" rel="stylesheet" type="text/css">
<link href="./index_files/icon" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="./css/clean-blog.min.css" rel="stylesheet">
<!-- mypage.css -->
<link href="./css/mypage.css" rel="stylesheet" type="text/css">
<!-- common.css, common.js clean-blog.min.js -->
<link href="./css/common.css" rel="stylesheet" type="text/css">
<script src="./js/common.js"></script>
<script src="js/clean-blog.min.js"></script>

</head>
<body>
	<%
		int id = (int) session.getAttribute("user_id");
		UserDAO dao = new UserDAO();
		UserVO vo = dao.userinfo(id);
	%>
	<%@ include file="./header.jsp"%>
	<!-- Page Header -->
	<header class="masthead header-block" id="mypage-header-img">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="page-heading">
						<h1>MY PAGE</h1>
						<!--span class="subheading">가이드가 되보세요!</span-->
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Main -->
	<div class="container">
		<div class="row">
			<div class="col-lg-9 col-md-10 mx-auto">
				<!--Sub Header-->
				<nav class="navbar navbar-expand-lg">
					<div class="container-fluid">
						<div class="navbar-collapse collapse show" id="navbarResponsive">
							<ul class="navbar-nav mr-auto">
								<li class="nav-item"><a class="nav-link"
									href="./userinfo2.jsp">마이페이지</a></li>
								<li class="nav-item"><a class="nav-link"
									href="./userupdate.jsp">회원정보변경</a></li>
								<li class="nav-item"><a class="nav-link"
									href="./guideRegister.jsp">가이드 등록</a></li>
							</ul>
						</div>
					</div>
				</nav>
				<hr>
			</div>
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="control-group">
					<h5 class=text-info>ID</h5>
					<%=vo.getId()%>
				</div>
				<p></p>
				<div class="control-group">
					<h5 class=text-info>PASSWORD</h5>
					<%=vo.getPwd()%>
					<p class="help-block text-danger"></p>
				</div>
				<div class="control-group">
					<h5 class=text-info>EMAIL</h5>
					<%=vo.getEmail()%>
					<p class="help-block text-danger"></p>
				</div>
				<div class="control-group">
					<h5 class=text-info>NAME</h5>
					<%=vo.getEmail()%>
					<p class="help-block text-danger"></p>
				</div>
				<div class="control-group">
					<h5 class=text-info>GENDER</h5>
					<%=vo.getEmail()%>
					<p class="help-block text-danger"></p>
				</div>
				<div class="control-group">
					<h5 class=text-info>PHONE</h5>
					<%=vo.getPhone_num()%>
					<p class="help-block text-danger"></p>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<h5 class=text-info>COUNTRY</h5>
							<%=vo.getNational()%>
							<p class="help-block text-danger"></p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<h5 class=text-info>RESIDENTIAL COUNTRY</h5>
							<%=vo.getResidential_contry()%>
							<p class="help-block text-danger"></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<%@ include file="./footer.jsp"%>
</body>
</html>

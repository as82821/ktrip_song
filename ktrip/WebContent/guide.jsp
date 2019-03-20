<!--가이드 페이지 pageNo.7 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ktds.ktrip.domain.ItemVO"%>
<%@page import="com.ktds.ktrip.domain.ApplyVO"%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>가이드</title>

<!-- jQuery and moment.js and rome.js-->
<script src="./bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<link href="./bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom fonts for this template -->
<link href="./vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link href="./index_files/css" rel="stylesheet" type="text/css" >
<link href="./index_files/css(1)" rel="stylesheet" type="text/css">
<link href="./index_files/icon" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="./css/clean-blog.min.css" rel="stylesheet">
<!-- faq.css -->
<link href="./css/guide.css" rel="stylesheet" type="text/css">
<!-- common.css, common.js clean-blog.min.js -->
<link href="./css/common.css" rel="stylesheet" type="text/css">
<script src="./js/common.js"></script>
<script src="js/clean-blog.min.js"></script>

<!--guide script  -->
<script src="./js/guide.js"></script>


<!-- 데이터테이블 처리 -->
<link rel="stylesheet" type="text/css" href="DataTables/datatables.css"/>
<script type="text/javascript" src="DataTables/datatables.js"></script>

<style>
	#item_list_filter{
		display: none 
	}
	#item_list{
    padding-bottom: 0px;
    padding-left: 0px;
    padding-top: 0px;
    padding-right: 0px;
}
</style>
  
</head>
<body>
	<%@ include file="./header.jsp"%>
	<!-- Page Header -->
	<header class="masthead header-block" id="guide-header-img">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="page-heading">
						<h1>GUIDE</h1>
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
								<li class="nav-item"><a class="nav-link"
									href="./itemServlet?actionMode=LIST">등록한 여행</a></li>
								<li class="nav-item"><a class="nav-link"
									href="./item-registration.jsp">여행 상품 등록</a></li>
							</ul>
						</div>
					</div>
				</nav>
				<hr>
			</div>
			<div class="col-lg-8 col-md-10 mx-auto">
				<!-- Contact Form -->
				<table id="item_list" class="table table-responsive{-sm|-md|-lg|-xl}">
					<thead class="thead-light">
						<tr>
							<th>상품이름</th>
							<th>기간</th>
							<th>신청인원</th>
							<th>상세보기</th>
						</tr>
					</thead>
					<tbody>
					<!-- 리스트 값 호출 처리 -->
					<%
						ArrayList<ItemVO> list = (ArrayList)request.getAttribute("list");
                   if(list != null){
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getTitle()%></td>
						<td><%=list.get(i).getDuration()%></td>
						<td><%=list.get(i).getCnt()%></td>
						<td><a data-toggle="modal" data-target="#item-modal" onclick="call_detail(<%=list.get(i).getItem_id()%>)">....</a></td>
					</tr>
					<%
						}
                      }
					%>
					</tbody>
				</table>

				<!--modal-->
				<div class="modal fade" id="item-modal" role="dialog">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<!-- Page Header -->

							<header class="item-modal-header modal-header masthead header-block">  
								<div class="overlay"></div>
								<div class="container">
									<div class="row">
										<div class="col-lg-8 col-md-10 mx-auto">
											<div class="post-heading" id="guide-modal-heading">
												<div id="detail_title"></div>
												<span class="meta">관리자 | 2019.02.28</span>
											</div>
										</div>
									</div>
								</div>
							</header>
							<!-- Main Content -->
							<article class="modal-body">
								<div class="container">
									<div class="row">
										<div class="col-lg-8 col-md-10 mx-auto">
											<!-- Contact Form -->
											<h5>신청자 목록</h5>
											<table id="apply_list_table" class="table table-sm  table-responsive{-sm|-md|-lg|-xl} text-center">
												<thead class="thead-light">
													<tr>
														<th>신청자</th>
														<th>기간</th>
														<th>승낙</th>
														<th>거절</th>
													</tr>
												</thead>
												<tbody id = "apply_list_tbody">															
												</tbody>
											</table>

											<h5>상품 정보</h5>
											<form id="item_form" method="POST" onsubmit="return trip_item_check()"
												action="/ktrip/itemServlet?actionMode=UPDATE"
												name="form_item_reg" id="trip_item" novalidate="">

												<div class="control-group">
													<h5 class=text-info>상품명</h5>
													<input type="text" class="form-control" placeholder="상품명"
														id="title" name="title" required
														data-validation-required-message="상품명을 입력해주세요.">
													<p class="help-block text-danger"></p>
												</div>

												<div class="control-group">
													<h5 class=text-info>최소인원</h5>
													<input type="text" class="form-control" placeholder="최소인원"
														id="num_min" name="num_min" required
														data-validation-required-message="최소인원을 입력해주세요.">
													<p class="help-block text-danger"></p>
												</div>

												<div class="control-group">
													<h5 class=text-info>최대인원</h5>
													<input type="text" class="form-control" placeholder="최대인원"
														id="num_max" name="num_max" required
														data-validation-required-message="최대인원을 입력해주세요.">
													<p class="help-block text-danger"></p>
												</div>

												<div class="control-group">
													<h5 class=text-info>기간</h5>
													<input type="text" class="form-control" placeholder="기간"
														id="duration" name="duration" required
														data-validation-required-message="기간을 입력해주세요.">
													<p class="help-block text-danger"></p>
												</div>

												<div class="control-group">
													<h5 class=text-info>가격(1인당)</h5>
													<input type="text" class="form-control"
														placeholder="가격(1인당)" id="price" name="price"
														required
														data-validation-required-message="가격(1인당)을 입력해주세요.">
													<p class="help-block text-danger"></p>
												</div>

												<div class="control-group">
													<h5 class=text-info>상품 컨셉</h5>
													<input type="text" class="form-control" placeholder="상품 컨셉"
														id="concept" name="concept" required
														data-validation-required-message="상품 컨셉을 입력해주세요.">
													<p class="help-block text-danger"></p>
												</div>

												<div class="control-group">
													<h5 class=text-info>썸네일</h5>
													<span id='sp'>
													<input type="button" value="파일 선택" id="fileBt">
													<input type="text" class="form-control-file" readonly
														placeholder="썸네일" id="thumbnail" name="thumbnail" required
														data-validation-required-message="썸네일 이미지를 입력해주세요.">
												    </span>
													<p class="help-block text-danger"></p>
													
												</div>

												<div class="control-group">
													<h5 class=text-info>상품 소개</h5>
													<textarea rows="5" class="form-control" placeholder="상품 소개"
														id="contents" name="contents" required
														data-validation-required-message="상품 소개를 입력해주세요."></textarea>
													<p class="help-block text-danger"></p>
												</div>

												<div id="success"></div>
												<div class="form-group">
													<button class="btn btn-primary" id="btn_cls" type="button"
														onclick="location.href='./itemServlet?actionMode=LIST'">취소</button>
													<button type="submit" class="btn btn-primary" id="btn_edit">수정</button>

													<span id="delete_btn"></span>
												</div>
												
											</form>
										</div>
										<!--basic containge form-->
									</div>
								</div>
							</article>
							<!-- Footer -->
							<footer class="modal-footer">
								<div class="container">
									<div class="row">
										<div class="col-lg-8 col-md-10 mx-auto">
											<ul class="list-inline text-center">

												<li class="list-inline-item"><a href="./index.jsp#">
														<span class="fa-stack fa-lg"> <i
															class="fas fa-circle fa-stack-2x"></i> <i
															class="fab fa-chrome fa-stack-1x fa-inverse"></i>
													</span>
												</a></li>
												<li class="list-inline-item"><a
													href="https://github.com/WonHyeongCho/ktcp-fresh-ktds#">
														<span class="fa-stack fa-lg"> <i
															class="fas fa-circle fa-stack-2x"></i> <i
															class="fab fa-github fa-stack-1x fa-inverse"></i>
													</span>
												</a></li>
												<li class="list-inline-item"><a
													href="./contactus.jsp#"> <span class="fa-stack fa-lg">
															<i class="fas fa-circle fa-stack-2x"></i> <i
															class="fas fa-envelope fa-stack-1x fa-inverse"></i>
													</span>
												</a></li>
											</ul>
											<p class="copyright text-muted">
												주소: 서울특별시 서초구 방배동 1001-1 대표 전화 : 02-523-7029 <br> <a
													href="./index.jsp#">KTrip</a> Copyright ⓒ <a
													href="https://www.ktds.com/index.jsp">KTds</a> All Rights
												Reserved.
											</p>
										</div>
									</div>
								</div>
							</footer>
							<hr>
						</div>
					</div>
				</div>

			</div>
			<!--basic containge form-->
		</div>
	</div>
	<hr>
	<%@ include file="./footer.jsp"%>
</body>
</html>

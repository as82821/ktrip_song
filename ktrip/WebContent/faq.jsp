<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>FAQ</title>

	<!-- jQuery and moment.js -->
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
	<link href="./css/faq.css" rel="stylesheet" type="text/css">
	<!-- common.css, common.js clean-blog.min.js -->
	<link href="./css/common.css" rel="stylesheet" type="text/css">
	<script src="./js/common.js"></script>
	<script src="./js/clean-blog.min.js"></script>
</head>
<body>
	<%@ include file="./header.jsp"%>
    <header class="masthead header-block" id="faq-header-img">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
					<div class="page-heading">
					    <h1>FAQ</h1>
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
                                    <a class="nav-link" href="./notice.jsp">공지사항</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="./faq.jsp">자주 묻는 질문</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="./contactus.jsp">문의하기</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <hr>
            </div>
            <div class="col-lg-8 col-md-10 mx-auto">
                <table>
                    <tr>
                        <td>예약 취소하고 싶어요.</td>
                        <td class="more" rowspan="2"><a data-toggle="modal" href="#faq-modal-1" id="faq-modal" ><img class="next-img" src="./img/next.png"></a>
                        </td>
                    </tr>
                    <tr class="even">
                        <td>관리자 | 2019.02.28</td>
                    </tr>
                    <tr>
                        <td>가이드에게 문의를 했는데 답변이 없어요.</td>
                        <td class="more" rowspan="2"><a data-toggle="modal" href="#faq-modal-2" id="faq-modal" ><img class="next-img" src="./img/next.png"></a>
                    </tr>
                    <tr class="even">
                        <td>관리자 | 2019.02.28</td>
                    </tr>
                    <tr>
                        <td>환불은 언제 되나요?</td>
                        <td class="more" rowspan="2"><a data-toggle="modal" href="#faq-modal-3" id="faq-modal" ><img class="next-img" src="./img/next.png"></a></td>
                    </tr>
                    <tr class="even">
                        <td>관리자 | 2019.02.28</td>
                    </tr>
                    <tr>
                        <td>계정 탈퇴는 어떻게 하나요?</td>
                        <td class="more" rowspan="2"><a data-toggle="modal" href="#faq-modal-4" id="faq-modal" ><img class="next-img" src="./img/next.png"></a></td>
                    </tr>
                    <tr class="even">
                        <td>관리자 | 2019.02.28</td>
                    </tr>
                    <tr>
                        <td>로그인 이메일 주소(계정)을 변경하고 싶어요.</td>
                        <td class="more" rowspan="2"><a data-toggle="modal" href="#faq-modal-5" id="faq-modal" ><img class="next-img" src="./img/next.png"></a></td>
                    </tr>
                    <tr class="even">
                        <td>관리자 | 2019.02.28</td>
                    </tr>
                </table>
                <!-- modal content -->
                <!-- modal1 -->
                <div class="modal fade" id="faq-modal-1" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <!-- Page Header -->
                            <header class="faq-modal modal-header masthead header-block">
                                <div class="overlay"></div>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-8 col-md-10 mx-auto">
                                            <div class="post-heading" id="faq-heading">
                                                <h2>예약 취소하고 싶어요.</h2>
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
                                        <div class="col-lg-10 col-md-10 mx-auto">
                                            <h5 class="text-info">제목</h5>
                                            <div class="title" id="faq_title" >예약 취소하고 싶어요.</div>
                                            <hr>
                                            <h5 class="text-info">내용</h5>
                                            <div class="content" id="faq_content">
                                                확정대기 중 취소일 경우 전액환불이 가능한, 확정 후 취소일 경우 상품 페이지에 기재된 취소/환불 규정에 따라 처리됩니다.
                                                <br><br>*일부 상품의 경우 확정 후 취소/변경/환불이 불가능한 점 참고 부탁드립니다.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                            <hr>
                        </div>
                    </div>
                </div>
               <!-- modal2 -->
                <div class="modal fade" id="faq-modal-2" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <!-- Page Header -->
                            <header class="faq-modal modal-header masthead header-block">
                                <div class="overlay"></div>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-8 col-md-10 mx-auto">
                                            <div class="post-heading" id="faq-heading">
                                                <h2>가이드에게 문의를 했는데 답변이 없어요.</h2>
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
                                        <div class="col-lg-10 col-md-10 mx-auto">
                                            <h5 class="text-info">제목</h5>
                                            <div class="title" id="faq_title" >가이드에게 문의를 했는데 답변이 없어요.</div>
                                            <hr>
                                            <h5 class="text-info">내용</h5>
                                            <div class="content" id="faq_content">
                                               문의 접수로부터 영업일 기준 1일 이내 메시지 답변을 드리며, 시차로 인해 답변이 늦어질 수 있으니 조금만 기다려주세요.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                            <hr>
                        </div>
                    </div>
                </div>
                <!-- modal3 -->
                <div class="modal fade" id="faq-modal-3" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <!-- Page Header -->
                            <header class="faq-modal modal-header masthead header-block">
                                <div class="overlay"></div>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-8 col-md-10 mx-auto">
                                            <div class="post-heading" id="faq-heading">
                                                <h2>환불은 언제 되나요?.</h2>
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
                                        <div class="col-lg-10 col-md-10 mx-auto">
                                            <h5 class="text-info">제목</h5>
                                            <div class="title" id="faq_title" >환불은 언제 되나요?.</div>
                                            <hr>
                                            <h5 class="text-info">내용</h5>
                                            <div class="content" id="faq_content">
                                              [신용카드&체크카드]<br>
                                              취소 안내 받은 날로부터 카드사 사정에 따라 영업일 기준 3~5일이내 취소내역 확인됩니다.<br><br>
                                              [실시간 계좌이체]<br>
                                              취소 안내 받은 날로부터 영업일 기준 3~5일이내에 결제했던 계좌로 입금처리됩니다.<br><br>
                                              [토스&네이버페이]<br>
                                              취소 안내 받은 날로부터 영업일 기준 3~5일이내에 취소내역 확인됩니다.<br><br>
                                              [페이팔]<br>
                                              페이팔에 등록된 계좌 혹은 카드로 즉시 환불 처리됩니다.<br><br>
                                              [무통장입금]<br>
                                              취소 안내 후 등록하신 휴대폰번호로 [환불계좌신청서] 안내 문자메시지가 발송됩니다.<br><br>
                                              환불계좌정보[계좌번호, 은행명, 예금주]를 기재해 주시면 영업일 기준 1~3일이내에 입금처리됩니다.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                            <hr>
                        </div>
                    </div>
                </div>
                <!-- modal4 -->
                <div class="modal fade" id="faq-modal-4" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <!-- Page Header -->
                            <header class="faq-modal modal-header masthead header-block">
                                <div class="overlay"></div>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-8 col-md-10 mx-auto">
                                            <div class="post-heading" id="faq-heading">
                                                <h2>계정 탈퇴는 어떻게 하나요?</h2>
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
                                        <div class="col-lg-10 col-md-10 mx-auto">
                                            <h5 class="text-info">제목</h5>
                                            <div class="title" id="faq_title" >계정 탈퇴는 어떻게 하나요?</div>
                                            <hr>
                                            <h5 class="text-info">내용</h5>
                                            <div class="content" id="faq_content">
                                           계정탈퇴를 희망하실 경우, 고객센터(contactus)로 문의주시면 탈퇴 진행해드리겠습니다.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                            <hr>
                        </div>
                    </div>
                </div>
                <!-- modal5 -->
                <div class="modal fade" id="faq-modal-5" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <!-- Page Header -->
                            <header class="faq-modal modal-header masthead header-block">
                                <div class="overlay"></div>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-8 col-md-10 mx-auto">
                                            <div class="post-heading" id="faq-heading">
                                                <h2>로그인 이메일 주소(계정)을 변경하고 싶어요.</h2>
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
                                        <div class="col-lg-10 col-md-10 mx-auto">
                                            <h5 class="text-info">제목</h5>
                                            <div class="title" id="faq_title" >로그인 이메일 주소(계정)을 변경하고 싶어요.</div>
                                            <hr>
                                            <h5 class="text-info">내용</h5>
                                            <div class="content" id="faq_content">
                                            로그인 계정 변경을 희망하실 경우, 변경 희망하시는 이메일 주소를 고객센터(contactus)로 전달해주시면 해당 계정으로 변경해드리겠습니다.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                            <hr>
                        </div>
                    </div>
                </div>
                <div class="pagination-wrap justify-content-center">
                    <div class="pagination">
                        <a></a>
                        <a class="active">1</a>
                        <a>></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <%@ include file="./footer.jsp"%>
</body>
</html>
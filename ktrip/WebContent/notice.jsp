<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Notice</title>
	
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
	<link href="./css/notice.css" rel="stylesheet" type="text/css">
	<!-- common.css, common.js clean-blog.min.js -->
	<link href="./css/common.css" rel="stylesheet" type="text/css">
	<script src="./js/common.js"></script>
	<script src="js/clean-blog.min.js"></script>
</head>
<body>
	<%@ include file="./header.jsp"%>
	<!-- Page Header -->
    <header class="masthead header-block" id="notice-header-img">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
	                <div class="page-heading">
	                    <h1>NOTICE</h1>
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
                        <td>전화번호 변경 안내입니다.</td>
                        <td class="more" rowspan="2"><a data-toggle="modal" href="#notice-modal-1" id="notice-modal" ><img class="next-img" src="./img/next.png"></a>
                        </td>
                    </tr>
                    <tr class="even">
                        <td>관리자 | 2019.03.18</td>
                    </tr>
                    <tr>
                        <td>홈페이지 서버유지보수 작업에 따른 홈페이지 이용제한 안내</td>
                        <td class="more" rowspan="2"><a data-toggle="modal" href="#notice-modal-2" id="notice-modal" > <img class="next-img" src="./img/next.png"></a>
                    </tr>
                    <tr class="even">
                        <td>관리자 | 2019.02.28</td>
                    </tr>
                    <tr>
                        <td>비밀번호 점검 가이드</td>
                        <td class="more" rowspan="2"><a data-toggle="modal" href="#notice-modal-3" id="notice-modal" ><img class="next-img" src="./img/next.png"></a></td>
                    </tr>
                    <tr class="even">
                        <td>관리자 | 2019.01.31</td>
                    </tr>
                    <tr>
                        <td>마이페이지 시스템 점검 안내</td>
                        <td class="more" rowspan="2"><a data-toggle="modal" href="#notice-modal-4" id="notice-modal" > <img class="next-img" src="./img/next.png"></a></td>
                    </tr>
                    <tr class="even">
                        <td>관리자 | 2019.01.11</td>
                    </tr>
                    <tr>
                        <td>필리핀 보라카이 섬 재오픈</td>
                        <td class="more" rowspan="2"><a data-toggle="modal" href="#notice-modal-5" id="notice-modal" > <img class="next-img" src="./img/next.png"></a></td>
                    </tr>
                    <tr class="even">
                        <td>관리자 | 2018.10.18</td>
                    </tr>
                </table>
                <!-- modal content -->
                <!-- modal1 -->
                <div class="modal fade" id="notice-modal-1" role="dialog">
	                <div class="modal-dialog modal-lg">
	                    <div class="modal-content">
	                        <!-- Page Header -->
	                        <header class="notice-modal modal-header masthead header-block">
	                            <div class="overlay"></div>
	                            <div class="container">
	                                <div class="row">
	                                    <div class="col-lg-8 col-md-10 mx-auto">
	                                        <div class="post-heading" id="notice-heading">
	                                            <h2>전화번호 변경 안내입니다.</h2>
	                                            <span class="meta">관리자 | 2019.03.18</span>
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
	                                        <div class="title" id="notice_title">전화번호 변경 안내입니다</div>
	                                        <hr>
	                                        <h5 class="text-info">내용</h5>
	                                        <div class="content" id="notice_content">
	                                            ktrip 대표 전화번호가 02-1111-2222로 변경되었습니다.<br>
	                                            * 연결 가능 시간 9:00 ~ 18:00
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </article>
	                    </div>
	                </div>
	            </div>
	            <!-- modal2 -->
	            <div class="modal fade" id="notice-modal-2" role="dialog">
	                <div class="modal-dialog modal-lg">
	                    <div class="modal-content">
	                        <!-- Page Header -->
	                        <header class="notice-modal modal-header masthead header-block">
	                            <div class="overlay"></div>
	                            <div class="container">
	                                <div class="row">
	                                    <div class="col-lg-8 col-md-10 mx-auto">
	                                        <div class="post-heading" id="notice-heading">
	                                            <h2>홈페이지 서버유지보수 작업에 따른 홈페이지 이용제한 안내</h2>
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
	                                        <div class="title" id="notice_title">홈페이지 서버유지보수 작업에 따른 홈페이지 이용제한 안내</div>
	                                        <hr>
	                                        <h5 class="text-info">내용</h5>
	                                        <div class="content" id="notice_content">
	                                         안정적인 사이트 운영을 위해 금일 자정 이후 서버점검 작업이 진행될 예정이오니 참고 부탁 드립니다. <br><br>
	                                            * 점검일시 : 2019.3.11(화요일) 01:00 ~ 03:00 (2시간 소요 예정)<br>
	                                            * 점검내용 : 서비스 기능 및 안정성 향상을 위한 서버점검<br><br>
	                                            점검시간 중에서는 홈페이지 접속이 제한되오니 양해 부탁 드립니다. <br><br>더 나은 서비스 제공을 위해 최선을 다하겠습니다.<br><br>감사합니다.
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </article>
	                    </div>
	                </div>
	            </div>
	            <!-- modal3 -->
	            <div class="modal fade" id="notice-modal-3" role="dialog">
	                <div class="modal-dialog modal-lg">
	                    <div class="modal-content">
	                        <!-- Page Header -->
	                        <header class="notice-modal modal-header masthead header-block">
	                            <div class="overlay"></div>
	                            <div class="container">
	                                <div class="row">
	                                    <div class="col-lg-8 col-md-10 mx-auto">
	                                        <div class="post-heading" id="notice-heading">
	                                            <h2>비밀번호 점검 가이드</h2>
	                                            <span class="meta">관리자 | 2019.01.31</span>
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
	                                        <div class="title" id="notice_title">비밀번호 점검 가이드</div>
	                                        <hr>
	                                        <h5 class="text-info">내용</h5>
	                                        <div class="content" id="notice_content">
	                                            비밀번호 점검 가이드<br>: 회원님의 비밀번호는 안전하게 관리되고 있나요?<br><br>
	                                            -  타 사이트와 동일한 비밀번호를 사용하고 있다.<br>
	                                            -  오래된 비밀번호를 변경하지 않고 그대로 사용하고 있다.<br>
	                                            -  개인정보가 포함된 비밀번호를 사용하고 있다.<br>
	                                            -  기존에 사용한 비밀번호와 유사한 비밀번호를 사용하고 있다.<br>
	                                            -  다른 사람에게 카카오계정이나 이메일 비밀번호를 공유한 적이 있다.<br><br>
	                                            위 항목에 하나라도 해당되면 카카오정보가 위험해질 수 있습니다.
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </article>
	                    </div>
	                </div>
	            </div>
	            <!-- modal4 -->
	            <div class="modal fade" id="notice-modal-4" role="dialog">
	                <div class="modal-dialog modal-lg">
	                    <div class="modal-content">
	                        <!-- Page Header -->
	                        <header class="notice-modal modal-header masthead header-block">
	                            <div class="overlay"></div>
	                            <div class="container">
	                                <div class="row">
	                                    <div class="col-lg-8 col-md-10 mx-auto">
	                                        <div class="post-heading" id="notice-heading">
	                                            <h2>마이페이지 시스템 점검 안내</h2>
	                                            <span class="meta">관리자 | 2019.01.11</span>
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
	                                        <div class="title" id="notice_title">마이페이지 시스템 점검 안내</div>
	                                        <hr>
	                                        <h5 class="text-info">내용</h5>
	                                        <div class="content" id="notice_content">
	                                           보다 안정적인 서비스 제공을 위해 아래의 내용으로 시스템 점검 작업을 진행할 예정이오니 양지하시어 사용에 불편 없으시기를 바랍니다.<br><br>
	                                           ■ 작업내용 : 서비스 개선을 위한 시스템 업데이트 작업<br>
	                                           ■ 작업 일시   : 01월 12일 00:00 ~ 06:00<br><br>
	                                           최대한 빠른 시간 안에 작업을 마칠 수 있도록 최선을 다하겠사오니 고객님들의 많은 양해 부탁 드립니다.<br>
	                                           항상 보다 나은 고객서비스를 위해 최선을 다하는 kt.com이 되도록 노력하겠습니다.
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </article>
	                    </div>
	                </div>
	            </div>
	            <!-- modal5 -->
	            <div class="modal fade" id="notice-modal-5" role="dialog">
	                <div class="modal-dialog modal-lg">
	                    <div class="modal-content">
	                        <!-- Page Header -->
	                        <header class="notice-modal modal-header masthead header-block">
	                            <div class="overlay"></div>
	                            <div class="container">
	                                <div class="row">
	                                    <div class="col-lg-8 col-md-10 mx-auto">
	                                        <div class="post-heading" id="notice-heading">
	                                            <h2>필리핀 보라카이 섬 재오픈</h2>
	                                            <span class="meta">관리자 | 2018.10.18</span>
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
	                                        <div class="title" id="notice_title">필리핀 보라카이 섬 재오픈</div>
	                                        <hr>
	                                        <h5 class="text-info">내용</h5>
	                                        <div class="content" id="notice_content">
	                                            필리핀 보라카이 섬의 재오픈이 2018년 10월 28일로 결정 되었습니다.<br><br>재오픈 예정일 : 2018/10/28 ~<br>보라카이 상품 예약은 ktrip을 통해 부탁드리겠습니다.<br><br>감사합니다.
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </article>
	                    </div>
	                </div>
	            </div>
	            <!-- modal content -->
                <div class="row justify-content-center">
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
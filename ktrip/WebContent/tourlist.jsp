<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>여행 상품 검색</title>

<!-- jQuery and moment.js and rome.js-->
<script src="./bower_components/jquery/dist/jquery.min.js"></script>
<script src="./bower_components/moment/min/moment.min.js"></script>
<!-- Bootstrap -->
<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<link href="./bower_components/bootstrap/dist/css/bootstrap.min.css"
   rel="stylesheet">
<!-- Custom fonts for this template -->
<link href="./vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
   type="text/css">
<link src="./index_files/css" rel="stylesheet" type="text/css">
<link src="./index_files/css(1)" rel="stylesheet" type="text/css">
<link src="./index_files/icon" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
   rel="stylesheet">
<link href="./css/clean-blog.min.css" rel="stylesheet">
<!-- tourlist.css, tourlist.js, star.js, table.css -->
<script src="./js/star.js"></script>
<link href="./css/tourlist.css" rel="stylesheet" type="text/css">
<script src="./js/tourlist.js"></script>
<link href="./css/table.css" rel="stylesheet" type="text/css">
<!-- common.css, common.js clean-blog.min.js -->
<link href="./css/common.css" rel="stylesheet" type="text/css">
<script src="./js/common.js"></script>
<script src="js/clean-blog.min.js"></script>
<!-- Bootstrap material datetimepicker -->
<script
   src="./bower_components/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
<link
   href="./bower_components/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css"
   rel="stylesheet" type="text/css">
</head>

<%
   //index.jsp에서 start-date, end-date, destination 받아오기.
   String idx_start_date = (String) request.getParameter("start-date");
   String idx_end_date = (String) request.getParameter("end-date");
   String idx_destination = (String) request.getParameter("destination");
%>

<script>
$( document ).ready(function() {
   
   var st = '<%=idx_start_date%>';
   var ed = '<%=idx_end_date%>';
   var ds = '<%=idx_destination%>';
   
   if(st!='null' && ed!='null' && ds!='null'){
      $('#start-date').val(st);
      $('#end-date').val(ed);
      $('#destination').val(ds);
      $('.aaa').remove();//이전에 뿌렸던 리스트 제거.
      loadpagecount();
   }
   
   function loadpagecount(){
            
          var start_date = $('#start-date').val();
          var end_date = $('#end-date').val();
          var destination = $('#destination').val();
          
          $('#pg1').html('');
          
         $.ajax({
            type : "GET",
            url : "./SearchItem",
            data : {start_date:start_date,
                  end_date:end_date,
                  destination:destination
                  },
            success : function(result2) {
                
                 if(result2.length != 0){
                     
                    loadtable();//laod table;
                    
                    //총 페이지 개수.(test를 위해 6개 기준으로 분리하자.)
                    var pagecount = 0;
                    pagecount = parseInt(result2.length/6);//6개씩 뿌려주자~
                    
                    if(parseInt(result2.length%6) != 0){
                       pagecount+=1;
                    }
                    start_pagenumber = 1;//총 페이지 중 첫번째 카운트.
                    total_pagenumber = pagecount;//총 페이지 개수.
                    
                    //하단 페이지에 표시해줄 개수. 만약 10개가 넘으면 10개까지 생성. 아니면 개수만큼 숫자 생성.
                    if(pagecount>10){
                       
                       first_pagenumber = 1;//현재 줄에서 첫번째 페이지 카운트.
                       last_pagenumber = 10;//현재 줄에서 마지막 페이지 카운트.
                       
                       var str ='';
                       str+='<a><</a>';
                       for(var i = 1; i<11; ++i){
                          
                          if(i ==1){
                             str+='<a class="active">'+ i + '</a>';
                          }else{
                             str+='<a>'+ i + '</a>';
                          }
                       }
                       
                       str+='<a>></a>';
                       $('#pg1').html(str);
                    }else{
                       first_pagenumber = 1;//현재 줄에서 첫번째 페이지 카운트.
                       last_pagenumber = pagecount;//현재 줄에서 마지막 페이지 카운트.
                       var str ='';
                       str+='<a><</a>';
                       for(var i = 1; i<pagecount+1; ++i){
                          var id = 'bt' + i;
                          if(i ==1){
                             str+='<a class="active">'+ i + '</a>';
                          }else{
                             str+='<a>'+ i + '</a>';
                          }
                       }
                       
                       str+='<a>></a>';
                       $('#pg1').html(str);
                    }
                    
                    
                 }else{
                    $('#insert_product').after('<div class="col-6 col-md-4 aaa">상품이 존재하지 않습니다.</div>');
                 }
            }
         });
      }
       
       function loadtable(){
          
          $('.aaa').remove();//이전에 뿌렸던 리스트 제거.
          
          var start_date = $('#start-date').val();
          var end_date = $('#end-date').val();
          var destination = $('#destination').val();
          
         $.ajax({
            type :"POST",
            url : "./SearchItem",
            data : {start_date:start_date,
                  end_date:end_date,
                  destination:destination,
                  pagingnumber:active_pagenumber
                  },
            success : function(result2) {
               
               if(result2.length != 0){
                  var product='';
                  
                  for (var i = 0; i < result2.length; ++i) {
                     
                     product+='<div class="col-6 col-md-4 aaa">';
                        product+='<div class="card mb-4" style="height:500px">';
                        product+='<img src="'+ result2[i].thumbnail +'" style="height:230px" id="'+ result2[i].item_id +'" class="card-img-top" onclick="openPopupApply(' + result2[i].item_id +');"/">';
                        product+='<div class="card-body"><p class="card-title">[' + result2[i].concept + ']</p>';
                        product+='<p class="card-text">' + result2[i].title + '</p>';
                        product+='</div></div></div>';
                  }
                    $('#insert_product').after(product);
               }else{
                  $('#insert_product').after('<div class="col-6 col-md-4 aaa">상품이 존재하지 않습니다.</div>');
               }
            }
         });
      }
  });
</script>

<body>
   <!-- Navigation -->
   <%@ include file="./header.jsp"%>

   <!-- Page Header -->
   <header class="masthead header-block" id="tourlist-header-img">
      <div class="overlay"></div>
      <div class="container">
         <div class="row">
            <div class="col-lg-12 col-md-10 mx-auto">
               <div class="page-heading" id="tourlist-heading">
                  <h1>여행 상품 검색</h1>
                  <span class="subheading"></span>
                  <div class="form-group search-group">
                     <label class="date-label" for="start-date">출발: </label> <input
                        type="text" class="date-input form-control" id="start-date"
                        placeholder="출발"> <label class="date-label"
                        for="start-date">도착: </label> <input type="text"
                        class="date-input form-control" id="end-date" placeholder="도착">
                     <label class="date-label" for="destination">목적지: </label> <input
                        type="text" class="form-control destination-input"
                        placeholder="목적지" id="destination">
                     <div>
                        <button type="button" class="btn btn-primary btn-sm search-btn"
                           onclick="SearchProduct();">검색하기</button>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </header>

   <div class="container">
      <div class="row">
         <div class="col-lg-9 col-md-10 mx-auto" id="insert_product">
            <h1 class="my-4">검색된 상품</h1>
         </div>
         <!-- <div class="insert_product"></div> -->
         <br>
         <br>

         <div class="col-lg-9 col-md-10 mx-auto" id="insert_product2">
            <!-- pagination -->
            <div class="row justify-content-center">
               <div class="pagination" id="pg1"></div>
            </div>
            <br>


            <h1 class="my-4">대기중인 여행</h1>
         </div>

         <div class="col-lg-9 col-md-10 mx-auto" id="insert_product3">
            <!-- pagination -->
            <div class="row justify-content-center">
               <div class="pagination" id="pg2"></div>
            </div>
            <br>
            <h1 class="my-4">다녀온 여행</h1>
         </div>
         <br> <br>
         <!-- modal portfolio -->
         <div class="modal fade" id="my-modal" role="dialog">
            <div class="modal-dialog modal-lg">
               <div class="modal-content">
                  <!-- Page Header -->
                  <header
                     class="item-review-modal modal-header masthead header-block">
                     <div class="overlay"></div>
                     <div class="container">
                        <div class="row">
                           <div class="col-lg-8 col-md-10 mx-auto">
                              <div class="post-heading" id="item-review-heading">
                                 <img src="" width="200" height="200" />
                                 <h2></h2>
                                 <span class="meta"></span>
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
                              <div class="control-group">
                                 <span class="star-input"> <span class="input">
                                       <input type="radio" name="star-input" value="1" id="p1">
                                       <label for="p1">1</label> <input type="radio"
                                       name="star-input" value="2" id="p2"> <label
                                       for="p2">2</label> <input type="radio" name="star-input"
                                       value="3" id="p3"> <label for="p3">3</label> <input
                                       type="radio" name="star-input" value="4" id="p4"> <label
                                       for="p4">4</label> <input type="radio" name="star-input"
                                       value="5" id="p5"> <label for="p5">5</label>
                                 </span> <output for="star-input">
                                       <b id="item_score">0</b>점
                                    </output>
                                 </span>
                                 <script src="./js/star.js"></script>
                              </div>
                              <div class="control-group">
                                 <h5 class=text-info>제목</h5>
                                 <input type="text" class="form-control"
                                    placeholder="제목을 입력해 주세요." id="item-review-title"
                                    required="" data-validation-required-message="필수 항목입니다.">
                                 <p class="help-block text-danger"></p>
                              </div>
                              <div class="control-group">
                                 <h5 class=text-info>리뷰 내용</h5>
                                 <textarea rows="10" class="form-control"
                                    placeholder="리뷰를 입력해 주세요." id="item-review-content"></textarea>
                                 <p class="help-block text-danger"></p>
                              </div>
                              <div class="form-group">
                                 <button type="submit" class="btn btn-primary search-btn"
                                    id="sendMessageButton" onclick="InsertReview();">등록</button>
                                 <button type="cancel" class="btn btn-primary search-btn"
                                    id="closeButton" onclick="hidemodal();">취소</button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </article>
                  <hr>
                  <!-- Footer -->
                  <footer class="modal-footer">
                     <div class="container">
                        <div class="row">
                           <div class="col-lg-8 col-md-10 mx-auto">
                              <ul class="list-inline text-center">

                                 <li class="list-inline-item"><a href="./index.html#">
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
                                 <li class="list-inline-item"><a href="./contactus.html#">
                                       <span class="fa-stack fa-lg"> <i
                                          class="fas fa-circle fa-stack-2x"></i> <i
                                          class="fas fa-envelope fa-stack-1x fa-inverse"></i>
                                    </span>
                                 </a></li>
                              </ul>
                              <p class="copyright text-muted">
                                 주소: 서울특별시 서초구 방배동 1001-1 대표 전화 : 02-523-7029 <br> <a
                                    href="./index.html#">KTrip</a> Copyright © <a
                                    href="https://www.ktds.com/index.jsp">KTds</a> All Rights
                                 Reserved.
                              </p>
                           </div>
                        </div>
                     </div>
                  </footer>
               </div>
            </div>
         </div>
      </div>
      <!-- pagination -->
      <div class="row justify-content-center">
         <div class="pagination" id="pg3"></div>
      </div>
      <br>
   </div>
   <hr>
   <!-- Footer -->
   <%@ include file="./footer.jsp"%>
</body>
</html>
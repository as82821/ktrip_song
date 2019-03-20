<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>여행 상품</title>
            
    <!-- jQuery and moment.js and rome.js-->
    <script src="./bower_components/jquery/dist/jquery.min.js"></script>
    <script src="./bower_components/moment/min/moment.min.js"></script>
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
    <!-- item.css, item.js, blog-home.css, table.css -->
    <link href="./css/item.css" rel="stylesheet" type="text/css">
    <script src="./js/item.js"></script>
    <link href="./css/table.css" rel="stylesheet" type="text/css">
    <!-- common.css, common.js clean-blog.min.js -->
    <link href="./css/common.css" rel="stylesheet" type="text/css">
    <script src="./js/common.js"></script>
    <script src="js/clean-blog.min.js"></script>
    <!-- Bootstrap material datetimepicker -->
    <script src="./bower_components/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
    <link href="./bower_components/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet" type="text/css">
    
    <%
       //상품ID값 받아오기. 제발 받아와라.
       String productID = (String)request.getParameter("productID");
    %>
    
    <script>
    var active_pagenumber = 1;//현재 페이지 카운트.
    var start_pagenumber =0;//총 페이지 중 첫번째 카운트.
    var first_pagenumber = 0;//현재 줄에서 첫번째 페이지 카운트.
    var last_pagenumber = 0;//현재 줄에서 마지막 페이지 카운트.
    var total_pagenumber = 0;//총 페이지 카운트. 
	var destination = '';
    
    $(document).ready(function() {
       
        //1.받아온 상품id로 상품 사진, 상품 제목, 상품 컨셉, 상품 본문, 가이드 사진, 가이드 이름, 가이드 소개
        loadproductinfo();
        
        //상품 리뷰 가져오기 - 하단 페이징 바 계산.
        loadpagecount();
    });
   
    
    //신청 버튼 클릭 시 상품ID, 출발일자, 도착일자, 콘텐츠 전달.
    function applyItem(){
       
       var item_id = '<%=productID%>';
       var start_date = $('#start-date').val();
       var end_date = $('#end-date').val();
       var contact_content = $('#contact_content').val();
       
       $.ajax({
            type : "POST",
            url : "./insertApply",
            data : {item_id:item_id,
                  start_date:start_date,
                  end_date:end_date,
                  contact_content:contact_content
            },
            success : function(result) {
                
               if(result == "success"){
                    //리뷰 등록 완료.
                  $('#myModal').modal('show');
                 }else{
                    //리뷰 등록 실패.
                    console.log('상품 신청 실패.');
                 }
            }
        });
    }

    function loadproductinfo(){
    	
       var item_id = '<%=productID%>';
       
        $.ajax({
            type : "POST",
            url : "./viewItem",
            data : {item_id:item_id},
            success : function(object) {

                //상품 사진, 상품 제목, 상품 컨셉, 상품 본문, 가이드 사진, 가이드 이름, 가이드 소개
                $('#item-img').attr('src', object['thumbnail']);//상품 사진.
                $('#item-title').text(object['title']);//상품 제목.
                $('#item-concept').text('[' + object['concept'] + ']');//상품 컨셉.
                $('#item-main').text(object['contents']);//상품 본문.
                $('#guide-img').attr('src', object['guide_photo']);//가이드 사진.
                $('#guide-comment').text(object['guide_intro']);//가이드 소개.
                $('#guide-name').text(object['guide_name']);//가이드 이름.
                 
                destination = object['destination'];
            }
        });
    }

    function loadpagecount(){
       
       var item_id = '<%=productID%>';
       $('.pagination').html('');//페이지 네이션 초기화.
       
        $.ajax({
            type : "GET",
            url : "./viewReview",
            data : {item_id:item_id
            },
            success : function(result2) {
                
                if(result2.length != 0){
                    
                    loadtable();
                    
                    //총 페이지 개수.(test를 위해 3개 기준으로 분리하자.)
                    var pagecount = 0;
                    pagecount = parseInt(result2.length/3);//3 나누기..
                    
                    if(parseInt(result2.length%3) != 0){//3개씩 나누기..
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
                        $('.pagination').html(str);
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
                        $('.pagination').html(str);
                    }
                    
                    
                }else{
                    $('.insert_product').html("리뷰가 없습니다.");
                }
            }
        });
    }

    function loadtable(){
       
       var item_id = '<%=productID%>';
       
        $.ajax({
            type : "POST",
            url : "./viewReview",
            data : {item_id:item_id,
               pagingnumber:active_pagenumber
               },
            success : function(result2) {
               
                if(result2.length != 0){
                   var product2='';
                   
                   //제목, 본문, 게시시간, 회원번호.
                   for (var i = 0; i < result2.length; ++i) {
                      
                       product2+='<div class="card mb-4"><div class="card-body"><br>';
                       product2+='<h2 class="card-title">' + result2[i]['title'] + '</h2>';
                       product2+='<p class="card-text">' + result2[i]['review_contents'] + '</p></div>';
                       product2+='<div class="card-footer text-muted">Posted on ' + result2[i]['register_time'] + ' by '+ result2[i]['user_name'] + '</div>';
                       product2+='</div>';
                    }
                      
                    $('.insert_product').html(product2);
                }else{
                    $('.insert_product').html("리뷰가 없습니다.");
                }
            }
        });
    }

    function loadpagebarNext(){//Next 누를 경우.
        //total_pagenumber를 가지고 있다.
        
        if(active_pagenumber>last_pagenumber){
            //하단 페이지에 표시해줄 개수. 만약 10개 단위로 끊어서 생성, 10개가 안되면 10개 전으로 생성.
            if(total_pagenumber>active_pagenumber + 9){
                
                first_pagenumber = active_pagenumber;//현재 줄에서 첫번째 페이지 카운트.
                last_pagenumber = active_pagenumber+9;//현재 줄에서 마지막 페이지 카운트.
                
                var str ='';
                str+='<a><</a>';
                for(var i = active_pagenumber; i<active_pagenumber+10; ++i){
                    
                    if(i ==active_pagenumber){
                        str+='<a class="active">'+ i + '</a>';
                    }else{
                        str+='<a>'+ i + '</a>';
                    }
                }
                
                str+='<a>></a>';
                $('.pagination').html(str);
            }else{
                
                first_pagenumber = active_pagenumber;//현재 줄에서 첫번째 페이지 카운트.
                last_pagenumber = total_pagenumber;//현재 줄에서 마지막 페이지 카운트.
                
                var str ='';
                str+='<a><</a>';
                for(var i = active_pagenumber; i<total_pagenumber+1; ++i){
                    var id = 'bt' + i;
                    if(i ==active_pagenumber){
                        str+='<a class="active">'+ i + '</a>';
                    }else{
                        str+='<a>'+ i + '</a>';
                    }
                }
                
                str+='<a>></a>';
                $('.pagination').html(str);
            }
        }else{
                var str ='';
                str+='<a><</a>';
                
                for(var i = first_pagenumber; i<last_pagenumber+1; ++i){
                    
                    if(i ==active_pagenumber){
                        str+='<a class="active">'+ i + '</a>';
                    }else{
                        str+='<a>'+ i + '</a>';
                    }
                }
                
                str+='<a>></a>';
                $('.pagination').html(str);
        }
    }

    function loadpagebarCur(){//현재 라인에 있는 버튼을 누를 경우.
        var str ='';
        str+='<a><</a>';
        
        for(var i = first_pagenumber; i<last_pagenumber+1; ++i){
            
            if(i ==active_pagenumber){
                str+='<a class="active">'+ i + '</a>';
            }else{
                str+='<a>'+ i + '</a>';
            }
        }
        
        str+='<a>></a>';
        $('.pagination').html(str);
    }

    function loadpagebarPrev(){//Prev 버튼을 누를 경우.
        if(active_pagenumber < first_pagenumber){//줄이 바뀌어야함.
            if(start_pagenumber<active_pagenumber - 9){
                
                first_pagenumber = active_pagenumber-9;//현재 줄에서 첫번째 페이지 카운트.
                last_pagenumber = active_pagenumber;//현재 줄에서 마지막 페이지 카운트.
                
                var str ='';
                str+='<a><</a>';
                for(var i = active_pagenumber; i<active_pagenumber+10; ++i){
                    
                    if(i ==active_pagenumber){
                        str+='<a class="active">'+ i + '</a>';
                    }else{
                        str+='<a>'+ i + '</a>';
                    }
                }
                
                str+='<a>></a>';
                $('.pagination').html(str);
            }else{
                
                first_pagenumber = start_pagenumber;//현재 줄에서 첫번째 페이지 카운트.
                last_pagenumber = active_pagenumber;//현재 줄에서 마지막 페이지 카운트.
                
                var str ='';
                str+='<a><</a>';
                for(var i = start_pagenumber; i<active_pagenumber+1; ++i){
                    var id = 'bt' + i;
                    if(i ==active_pagenumber){
                        str+='<a class="active">'+ i + '</a>';
                    }else{
                        str+='<a>'+ i + '</a>';
                    }
                }
                
                str+='<a>></a>';
                $('.pagination').html(str);
            }
        }else{
            var str ='';
            str+='<a><</a>';
            
            for(var i = first_pagenumber; i<last_pagenumber+1; ++i){
                
                if(i ==active_pagenumber){
                    str+='<a class="active">'+ i + '</a>';
                }else{
                    str+='<a>'+ i + '</a>';
                }
            }
            
            str+='<a>></a>';
            $('.pagination').html(str);
        }
    }

    // 동적으로 여러 태그가 생성된 경우라면 이런식으로 클릭된 객체를 this 키워드를 이용해서 잡아올 수 있다.
    $(document).on("click",".pagination a",function(event){
        if($(this).text() == "<"){//prev
            if(active_pagenumber > 1){
                active_pagenumber = active_pagenumber - 1;//현재 active_pagenumber 갱신.
                loadtable();
                loadpagebarPrev();
            }
        }
        else if($(this).text() == ">"){//next
            if(active_pagenumber < total_pagenumber){
                active_pagenumber = active_pagenumber + 1;//현재 active_pagenumber 갱신.
                loadtable();
                loadpagebarNext();
            }
        }
        else{//본인이 누른 페이지.
            active_pagenumber = parseInt($(this).text());//현재 active_pagenumber 갱신.
            loadtable();
            loadpagebarCur();
        }
    });
    
    function roaming() {
    	var nation = '';
    	if(destination == '뉴욕'){
    		nation = '미국';
    	}
    	else if (destination == '런던'){
    		nation = '영국';
    	}
    	else if (destination == '파리'){
    		nation = '프랑스';
    	}
    	else if (destination == '오사카'){
    		nation = '일본';
    	}
    	else if (destination == '바르셀로나'){
    		nation = '스페인';
    	}
    	else if (destination == '프라하'){
    		nation = '체코';
    	}
    	
    	roaming_page = 'https://globalroaming.kt.com/rate/rate.asp?nation=' + nation + '&duration=1&condition=all';
    	window.open(roaming_page);
    };
    </script>
</head>
<body>
    <!-- Navigation -->
   <%@ include file="./header.jsp"%>

    <!-- Page Header -->
    <header class="masthead header-block" id="item-header-img">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                    <div class="page-heading" id="item-heading">
                        <h1>여행 상품</h1>
                        <span class="subheading"></span>
                        <div class="form-group search-group">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>

   <!-- Main Content -->
   <div class="container">
        <div class="row">
            <!-- Blog Entries Column -->
            <div class="col-md-8">
                <h1 class="my-4" id="item-title">14박 15일 프랑스 여행
                    <h3 id="item-concept">[식도락]</h3>
                </h1>
        
                <!-- Blog Post -->
                <div class="card mb-4">
                    <img class="card-img-top" src="./img/paris.jpg" alt="Card image cap" id="item-img">
                    <div class="card-body">
                        <p class="card-text" id="item-main">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
                    </div>
                </div>
            </div>
            <!-- Sidebar Widgets Column -->
            <div class="col-md-4">
                <!-- Categories Widget -->
                <div class="card my-4">
                    <h5 class="card-header">상품 구매</h5>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg">
                                <div class="form-group search-group">
                                    <div class="control-group">
                                        <h5 class=text-info>출발</h5>
                                        <input type="text" class="date-input form-control" id="start-date" placeholder="출발">
                                        <br>
                                        <h5 class=text-info>도착</h5>
                                        <input type="text" class="date-input form-control" id="end-date" placeholder="도착">
                                        <br>
                                        <h5 class=text-info>CONTENT</h5>
                                        <textarea rows="10" class="form-control" placeholder="Content"
                                                id="contact_content"></textarea>
                                        <p class="help-block text-danger"></p>
                                    </div>
                                    <div id="success"></div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary btn-left" id="sendMessageButton" onclick="applyItem();">신청 하기</button>
                                        <button type="submit" class="btn kt-roaming btn-right" id="sendMessageButton" onclick="roaming();">추천 로밍</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-10 mx-auto">
                <h2 class="post-title">여행 리뷰</h2>
                <div class="insert_product"></div>
                
                <!-- pagination -->
             <div class="pagination-wrap justify-content-center">
                    <div class="pagination">
                       
                    </div>
                </div>
                <br>
                <h2 class="post-title">가이드 소개</h2>
                <div class="card mb-4">
                    <div class="card-body">
                        <img class="card-img-top" src="./img/guide-thumbnail.jpg" alt="Card image cap" id="guide-img">
                        <br>
                        <h2 class="card-title" id="guide-name">John Green</h2>
                        <p class="card-text" id="guide-comment">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-lg">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">상품 신청</h4>
                    </div>
                    <div class="modal-body">
                        <p>상품 신청 성공</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>

    </div>
    <!-- Footer -->
    <hr>
    <%@ include file="./footer.jsp"%>
</body>
</html>
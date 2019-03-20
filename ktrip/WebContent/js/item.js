var active_pagenumber = 1;//현재 페이지 카운트.
var start_pagenumber =0;//총 페이지 중 첫번째 카운트.
var first_pagenumber = 0;//현재 줄에서 첫번째 페이지 카운트.
var last_pagenumber = 0;//현재 줄에서 마지막 페이지 카운트.
var total_pagenumber = 0;//총 페이지 카운트. 

$(document).ready(function() {
    
    //1.받아온 상품id로 상품의 이미지, 제목, 본문, 가이드 사진, 가이드이름, 상품의 리뷰 가져오기.
    //loadproductinfo();
    
    //상품 개수로 하단 페이징 바 계산.
    //loadpagecount();
});

//상품ID, 출발일자, 도착일자, 콘텐츠 전달.
function applyProduct(){
	$.ajax({
        type : "POST",
        url : "./ApplyItem",
        data : {pagingnumber:encodeURIComponent(ProductID)},
        success : function(result) {
            
            var object = eval('(' + result + ')');
            var result2 = object.result;
            
            if(result2.length != 0){
                var product2='';
                    product2+='<table id="datatable" class="display" style="width:100%"><thead><tr><th>리뷰번호</th><th>회원번호</th><th>점수</th><th>본문</th></tr></thead><tbody>';
                
                for (var i = 0; i < result2.length; ++i) {
                    product2+='<tr>';
                    for (var j = 0; j < result2[i].length; ++j) {
                        product2+= '<td>';
                        product2+= result2[i][j].value;
                        product2+= '</td>';
                    }
                    product2+='</tr>';
                }
                product2+='</tbody></table>';
                $('#tab2').html(product2)
            }else{
                $('#tab2').html("리뷰가 없습니다.");
            }
        }
    });
}

function loadproductinfo(){
    
    var ProductID = '<%=productID%>';
    
    $.ajax({
        type : "POST",
        url : "./ReviewServlet22",
        data : {pagingnumber:encodeURIComponent(ProductID)},
        success : function(result) {
            
            var object = eval('(' + result + ')');
            var result2 = object.result;
            
            if(result2.length != 0){
                var product2='';
                    product2+='<table id="datatable" class="display" style="width:100%"><thead><tr><th>리뷰번호</th><th>회원번호</th><th>점수</th><th>본문</th></tr></thead><tbody>';
                
                for (var i = 0; i < result2.length; ++i) {
                    product2+='<tr>';
                    for (var j = 0; j < result2[i].length; ++j) {
                        product2+= '<td>';
                        product2+= result2[i][j].value;
                        product2+= '</td>';
                    }
                    product2+='</tr>';
                }
                product2+='</tbody></table>';
                $('#tab2').html(product2)
            }else{
                $('#tab2').html("리뷰가 없습니다.");
            }
        }
    });
}

function loadpagecount(){
	
	$('.pagination').html('');//페이지 네이션 초기화.
	
    $.ajax({
        type : "POST",
        url : "./ReviewPagingServlet",
        data : {},
        success : function(result) {
            
            var object = eval('(' + result + ')');
            var result2 = object.result;
            
            if(result2.length != 0){
                
                loadtable();
                
                //총 페이지 개수.(test를 위해 3개 기준으로 분리하자.)
                var pagecount = 0;
                pagecount = parseInt(result2.length/3);
                
                if(parseInt(result2.length%3) != 0){
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
                $('#tab2').html("리뷰가 없습니다.");
            }
        }
    });
}

function loadtable(){
    $.ajax({
        type : "POST",
        url : "./ReviewServlet2",
        data : {pagingnumber:encodeURIComponent(active_pagenumber)},
        success : function(result) {
            
            var object = eval('(' + result + ')');
            var result2 = object.result;
            
            if(result2.length != 0){
                var product2='';
                    product2+='<table id="datatable" class="display" style="width:100%"><thead><tr><th>리뷰번호</th><th>회원번호</th><th>점수</th><th>본문</th></tr></thead><tbody>';
                
                for (var i = 0; i < result2.length; ++i) {
                    product2+='<tr>';
                    for (var j = 0; j < result2[i].length; ++j) {
                        product2+= '<td>';
                        product2+= result2[i][j].value;
                        product2+= '</td>';
                    }
                    product2+='</tr>';
                }
                product2+='</tbody></table>';
                $('#tab2').html(product2)
            }else{
                $('#tab2').html("리뷰가 없습니다.");
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

$(function() {
    $('ul.tab li').click(function() {

        var activeTab = $(this).attr('data-tab');
        $('ul.tab li').removeClass('current');
        $('.tabcontent').removeClass('current');
        $(this).addClass('current');
        $('#' + activeTab).addClass('current');
        
        //2019.03.11 tab1일경우 페이지네이션 안보여줘도 된다.
        if(activeTab == 'tab1'){
            $('.pagination').hide();
        }else{
            $('.pagination').show();
        }
    })
});

// Bootstrap Material DatePicker
$(function () {
    $('#start-date').bootstrapMaterialDatePicker({
        format: 'YYYY/MM/DD',
        time: false,
        weekend: 0,
        setDate: moment()
    })
});

$(function () {
    $('#end-date').bootstrapMaterialDatePicker({
        format: 'YYYY/MM/DD',
        time: false,
        weekend: 0,
        setDate: moment()
    })
});

function roaming() {
	roaming_page = 'https://globalroaming.kt.com/rate/rate.asp?nation=' +  + '&duration=1&condition=all'
	location.href
};
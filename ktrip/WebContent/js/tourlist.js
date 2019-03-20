var active_pagenumber = 1;//현재 페이지 카운트.
   var start_pagenumber =0;//총 페이지 중 첫번째 카운트.
   var first_pagenumber = 0;//현재 줄에서 첫번째 페이지 카운트.
   var last_pagenumber = 0;//현재 줄에서 마지막 페이지 카운트.
   var total_pagenumber = 0;//총 페이지 카운트. 
   
   var active_pagenumber2 = 1;//현재 페이지 카운트.
   var start_pagenumber2 =0;//총 페이지 중 첫번째 카운트.
   var first_pagenumber2 = 0;//현재 줄에서 첫번째 페이지 카운트.
   var last_pagenumber2 = 0;//현재 줄에서 마지막 페이지 카운트.
   var total_pagenumber2 = 0;//총 페이지 카운트.
   
   var active_pagenumber3 = 1;//현재 페이지 카운트.
   var start_pagenumber3 =0;//총 페이지 중 첫번째 카운트.
   var first_pagenumber3 = 0;//현재 줄에서 첫번째 페이지 카운트.
   var last_pagenumber3 = 0;//현재 줄에서 마지막 페이지 카운트.
   var total_pagenumber3 = 0;//총 페이지 카운트.
   
   var ReviewProduct_id ='';
   
    $( document ).ready(function() {
      //쿼리 로우 개수를 받아서 하단 페이징 바 계산.
      loadpagecount2();
      loadpagecount3();
      
         //모달 클릭 시 값 전달을 위해 활용.
         $('#my-modal').on('show.bs.modal', function (event) {
         //이미지, 컨셉, 제목을 모달로 보내자.
        
         var ReviewProduct = $(event.relatedTarget);//클릭한 아이(this)
         
         ReviewProduct = ReviewProduct.parents('div.mb-4'); //<div>
         
         ReviewProduct_id = ReviewProduct.find('img.card-img-top').attr('id');//클릭한 아이의 아이디.
         
         var ReviewProduct_src = ReviewProduct.find('img.card-img-top').attr('src');//클릭한 아이의 이미지.
         var ReviewProduct_concept=ReviewProduct.find('.card-title').text();//클릭한 아이의 컨셉.
         var ReviewProduct_comment=ReviewProduct.find('.card-text').text();//클릭한 아이의 본문
         $("#item-review-heading").children('img').attr('src', ReviewProduct_src);
         $("#item-review-heading").children('h2').text(ReviewProduct_concept);
         $("#item-review-heading").children('span').text(ReviewProduct_comment);
         });
         
         
    });
    
   //Search Button 클릭했을 경우.
   function SearchProduct(){
      $('.aaa').remove();//이전에 뿌렸던 리스트 제거.
      active_pagenumber=1;//다시 검색이니까 active pagenumber = 1;
      loadpagecount();//쿼리 로우 개수를 받아서 하단 페이징 바 계산.
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
         success : function(ob) {
            
             if(ob.length != 0){
                  
                 loadtable();
                 
                 //총 페이지 개수.(test를 위해 6개 기준으로 분리하자.)
                 var pagecount = 0;
                 pagecount = parseInt(ob.length/6);//6개씩 부려주자~
                 
                 if(parseInt(ob.length%6) != 0){
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
             $('#pg1').html(str);
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
             $('#pg1').html(str);
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
             $('#pg1').html(str);
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
      $('#pg1').html(str);
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
             $('#pg1').html(str);
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
             $('#pg1').html(str);
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
          $('#pg1').html(str);
      }
   }
    
   // 동적으로 여러 태그가 생성된 경우라면 이런식으로 클릭된 객체를 this 키워드를 이용해서 잡아올 수 있다.
   $(document).on("click","#pg1 a",function(event){
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
   
    /////////////////////////////////////두번째 하단 페이지//////////////////////////////////////////////////////
    
    function loadpagecount2(){
       
      $('#pg2').html('');
      $('.bbb').remove();//이전에 뿌렸던 리스트 제거.
      
      $.ajax({
         type : "GET",
         url : "./listWait",
         data : {},
         success : function(result2) {
              
              if(result2.length != 0){
                 
                 loadtable2();
                 
                 //총 페이지 개수.(test를 위해 5개 기준으로 분리하자.)
                 var pagecount2 = 0;
                 pagecount2 = parseInt(result2.length/6);
                 
                 if(parseInt(result2.length%6) != 0){
                    pagecount2+=1;
                 }
                 start_pagenumber2 = 1;//총 페이지 중 첫번째 카운트.
                 total_pagenumber2 = pagecount2;//총 페이지 개수.
                 
                 //하단 페이지에 표시해줄 개수. 만약 10개가 넘으면 10개까지 생성. 아니면 개수만큼 숫자 생성.
                 if(pagecount2>10){
                    
                    first_pagenumber2 = 1;//현재 줄에서 첫번째 페이지 카운트.
                    last_pagenumber2 = 10;//현재 줄에서 마지막 페이지 카운트.
                    
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
                    $('#pg2').html(str);
                 }else{
                    first_pagenumber2 = 1;//현재 줄에서 첫번째 페이지 카운트.
                    last_pagenumber2 = pagecount2;//현재 줄에서 마지막 페이지 카운트.
                    var str ='';
                    str+='<a><</a>';
                    for(var i = 1; i<pagecount2+1; ++i){
                       var id = 'bt' + i;
                       if(i ==1){
                          str+='<a class="active">'+ i + '</a>';
                       }else{
                          str+='<a>'+ i + '</a>';
                       }
                    }
                    
                    str+='<a>></a>';
                    $('#pg2').html(str);
                 }
                 
                 
              }else{
                 $('#insert_product2').after('<div class="col-6 col-md-4 bbb">상품이 존재하지 않습니다.</div>');
              }
         }
      });
   }
    
    function loadtable2(){
       
       $('.bbb').remove();//이전에 뿌렸던 리스트 제거.
       
      $.ajax({
         type : "POST",
         url : "./listWait",
         data : {pagingnumber:active_pagenumber2},
         success : function(result2) {
            
            if(result2.length != 0){
               var product='';
               
               for (var i = 0; i < result2.length; ++i) {
                  
                  product+='<div class="col-6 col-md-4 bbb">';
                  product+='<div class="card mb-4" style="height:500px">';
                  product+='<img src="'+ result2[i].thumbnail +'" style="height:230px" id="'+ result2[i].apply_id +'" class="card-img-top">';
                  product+='<div class="card-body"><p class="card-title">[' + result2[i].concept + ']</p>';
                  product+='<p class="card-text">' + result2[i].title + '</p>';
                  product+='</div></div><button class="btn btn-primary btn-sm" onclick="deleteproduct(' + result2[i].apply_id + ');">삭제</button></div>';
                  
                  
                 /*
                  product+='<div class="col-lg-3 col-md-6 text-center service-contents"><div class="mt-5">';
                  product+='<img src="'+ result2[i]['thumbnail'] +'" id="'+ result2[i]['item_id'] +'" class="item-img" width="100" height="100"/">';
                  product+='<h3 class="h4 mb-2">' + result2[i]['concept'] + '</h3>';
                  product+='<p class="text-muted mb-0">' + result2[i]['title'] + '</p>';
                  product+='<button class="btn btn-primary btn-sm search-btn" onclick="deleteproduct(' + result2[i]['thumbnail'] + ');">삭제</button>'
                  product+='</div></div>';
                  */
               }
               
                 $('#insert_product2').after(product);
            }else{
               $('#insert_product2').after('<div class="col-6 col-md-4 bbb">상품이 존재하지 않습니다.</div>');
            }
         }
      });
   }
    
    
   
   function loadpagebarNext2(){//Next 누를 경우.
      //total_pagenumber를 가지고 있다.
      
      if(active_pagenumber2>last_pagenumber2){
         //하단 페이지에 표시해줄 개수. 만약 10개 단위로 끊어서 생성, 10개가 안되면 10개 전으로 생성.
          if(total_pagenumber2>active_pagenumber2 + 9){
             
             first_pagenumber2 = active_pagenumber2;//현재 줄에서 첫번째 페이지 카운트.
              last_pagenumber2 = active_pagenumber2+9;//현재 줄에서 마지막 페이지 카운트.
              
             var str ='';
             str+='<a><</a>';
             for(var i = active_pagenumber2; i<active_pagenumber2+10; ++i){
                
                if(i ==active_pagenumber2){
                   str+='<a class="active">'+ i + '</a>';
                }else{
                   str+='<a>'+ i + '</a>';
                }
             }
             
             str+='<a>></a>';
             $('#pg2').html(str);
          }else{
             
             first_pagenumber2 = active_pagenumber2;//현재 줄에서 첫번째 페이지 카운트.
              last_pagenumber2 = total_pagenumber2;//현재 줄에서 마지막 페이지 카운트.
             
             var str ='';
             str+='<a><</a>';
             for(var i = active_pagenumber2; i<total_pagenumber2+1; ++i){
                var id = 'bt' + i;
                if(i ==active_pagenumber2){
                   str+='<a class="active">'+ i + '</a>';
                }else{
                   str+='<a>'+ i + '</a>';
                }
             }
             
             str+='<a>></a>';
             $('#pg2').html(str);
          }
      }else{
             var str ='';
             str+='<a><</a>';
             
             for(var i = first_pagenumber2; i<last_pagenumber2+1; ++i){
                
                if(i ==active_pagenumber2){
                   str+='<a class="active">'+ i + '</a>';
                }else{
                   str+='<a>'+ i + '</a>';
                }
             }
             
             str+='<a>></a>';
             $('#pg2').html(str);
      }
   }
   
   function loadpagebarCur2(){//현재 라인에 있는 버튼을 누를 경우.
      var str ='';
      str+='<a><</a>';
      
      for(var i = first_pagenumber2; i<last_pagenumber2+1; ++i){
         
         if(i ==active_pagenumber2){
            str+='<a class="active">'+ i + '</a>';
         }else{
            str+='<a>'+ i + '</a>';
         }
      }
      
      str+='<a>></a>';
      $('#pg2').html(str);
   }
   
   function loadpagebarPrev2(){//Prev 버튼을 누를 경우.
      if(active_pagenumber2 < first_pagenumber2){//줄이 바뀌어야함.
         if(start_pagenumber2<active_pagenumber2 - 9){
             
             first_pagenumber2 = active_pagenumber2-9;//현재 줄에서 첫번째 페이지 카운트.
              last_pagenumber2 = active_pagenumber2;//현재 줄에서 마지막 페이지 카운트.
              
             var str ='';
             str+='<a><</a>';
             for(var i = active_pagenumber2; i<active_pagenumber2+10; ++i){
                
                if(i ==active_pagenumber2){
                   str+='<a class="active">'+ i + '</a>';
                }else{
                   str+='<a>'+ i + '</a>';
                }
             }
             
             str+='<a>></a>';
             $('#pg2').html(str);
          }else{
             
             first_pagenumber2 = start_pagenumber2;//현재 줄에서 첫번째 페이지 카운트.
              last_pagenumber2 = active_pagenumber2;//현재 줄에서 마지막 페이지 카운트.
             
             var str ='';
             str+='<a><</a>';
             for(var i = start_pagenumber2; i<active_pagenumber2+1; ++i){
                var id = 'bt' + i;
                if(i ==active_pagenumber2){
                   str+='<a class="active">'+ i + '</a>';
                }else{
                   str+='<a>'+ i + '</a>';
                }
             }
             
             str+='<a>></a>';
             $('#pg2').html(str);
          }
      }else{
         var str ='';
          str+='<a><</a>';
          
          for(var i = first_pagenumber2; i<last_pagenumber2+1; ++i){
             
             if(i ==active_pagenumber2){
                str+='<a class="active">'+ i + '</a>';
             }else{
                str+='<a>'+ i + '</a>';
             }
          }
          
          str+='<a>></a>';
          $('#pg2').html(str);
      }
   }
   
   
   
   $(document).on("click","#pg2 a",function(event){
      if($(this).text() == "<"){//prev
         if(active_pagenumber2 > 1){
            active_pagenumber2 = active_pagenumber2 - 1;//현재 active_pagenumber 갱신.
               loadtable2();
               loadpagebarPrev2();
         }
      }
      else if($(this).text() == ">"){//next
         if(active_pagenumber2 < total_pagenumber2){
            active_pagenumber2 = active_pagenumber2 + 1;//현재 active_pagenumber 갱신.
               loadtable2();
               loadpagebarNext2();
         }
      }
      else{//본인이 누른 페이지.
         active_pagenumber2 = parseInt($(this).text());//현재 active_pagenumber 갱신.
           loadtable2();
           loadpagebarCur2();
      }
      });
   
/////////////////////////////////////세번째 하단 페이지//////////////////////////////////////////////////////
    
    function loadpagecount3(){

      $('#pg3').html('');
      $('.ccc').remove();//이전에 뿌렸던 리스트 제거.
      
      $.ajax({
         type : "GET",
         url : "./listOld",
         data : {},
         success : function(result2) {
            
              if(result2.length != 0){
                 
                 loadtable3();
                 
                 //총 페이지 개수.(test를 위해 5개 기준으로 분리하자.)
                 var pagecount3 = 0;
                 pagecount3 = parseInt(result2.length/6);
                 
                 if(parseInt(result2.length%6) != 0){
                    pagecount3+=1;
                 }
                 start_pagenumber3 = 1;//총 페이지 중 첫번째 카운트.
                 total_pagenumber3 = pagecount3;//총 페이지 개수.
                 
                 //하단 페이지에 표시해줄 개수. 만약 10개가 넘으면 10개까지 생성. 아니면 개수만큼 숫자 생성.
                 if(pagecount3>10){
                    
                    first_pagenumber3 = 1;//현재 줄에서 첫번째 페이지 카운트.
                    last_pagenumber3 = 10;//현재 줄에서 마지막 페이지 카운트.
                    
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
                    $('#pg3').html(str);
                 }else{
                    first_pagenumber3 = 1;//현재 줄에서 첫번째 페이지 카운트.
                    last_pagenumber3 = pagecount3;//현재 줄에서 마지막 페이지 카운트.
                    var str ='';
                    str+='<a><</a>';
                    for(var i = 1; i<pagecount3+1; ++i){
                       var id = 'bt' + i;
                       if(i ==1){
                          str+='<a class="active">'+ i + '</a>';
                       }else{
                          str+='<a>'+ i + '</a>';
                       }
                    }
                    
                    str+='<a>></a>';
                    $('#pg3').html(str);
                 }
                 
                 
              }else{
                 $('#insert_product3').after('<div class="col-6 col-md-4 ccc">상품이 존재하지 않습니다.</div>');
              }
         }
      });
   }
    
    function loadtable3(){
       
       $('.ccc').remove();//이전에 뿌렸던 리스트 제거.
       
      $.ajax({
         type : "POST",
         url : "./listOld",
         data : {pagingnumber:active_pagenumber3},
         success : function(result2) {
            
            if(result2.length != 0){
               var product='';
               
               for (var i = 0; i < result2.length; ++i) {
                  
                  product+='<div class="col-6 col-md-4 ccc">';
                  product+='<div class="card mb-4" style="height:500px"><a data-toggle="modal" href="#my-modal">';
                  product+='<img src="'+ result2[i].thumbnail +'" style="height:230px" id="'+ result2[i].item_id +'" class="card-img-top">';
                  product+='<div class="card-body"><p class="card-title">[' + result2[i].concept + ']</p>';
                  product+='<p class="card-text">' + result2[i].title + '</p>';
                  product+='</a></div></div></div>';
                  
                 /*
                  product+='<div class="col-lg-3 col-md-6 text-center service-contents"><div class="mt-5"><a data-toggle="modal" href="#my-modal">';
                  product+='<img src="'+ result2[i]['thumbnail'] +'" id="'+ result2[i]['item_id'] +'" class="item-img" width="100" height="100"/">';
                  product+='<h3 class="h4 mb-2">' + result2[i]['concept'] + '</h3>';
                  product+='<p class="text-muted mb-0">' + result2[i]['title'] + '</p>';
                  product+='</a></div></div>';
                  */
               }
                 $('#insert_product3').after(product);
            }else{
               $('#insert_product3').after('<div class="col-6 col-md-4 ccc">상품이 존재하지 않습니다.</div>');
            }
         }
      });
   }
    
    
   
   function loadpagebarNext3(){//Next 누를 경우.
      //total_pagenumber를 가지고 있다.
      
      if(active_pagenumber3>last_pagenumber3){
         //하단 페이지에 표시해줄 개수. 만약 10개 단위로 끊어서 생성, 10개가 안되면 10개 전으로 생성.
          if(total_pagenumber3>active_pagenumber3 + 9){
             
             first_pagenumber3 = active_pagenumber3;//현재 줄에서 첫번째 페이지 카운트.
              last_pagenumber3 = active_pagenumber3+9;//현재 줄에서 마지막 페이지 카운트.
              
             var str ='';
             str+='<a><</a>';
             for(var i = active_pagenumber3; i<active_pagenumber3+10; ++i){
                
                if(i ==active_pagenumber3){
                   str+='<a class="active">'+ i + '</a>';
                }else{
                   str+='<a>'+ i + '</a>';
                }
             }
             
             str+='<a>></a>';
             $('#pg3').html(str);
          }else{
             
             first_pagenumber3 = active_pagenumber3;//현재 줄에서 첫번째 페이지 카운트.
              last_pagenumber3 = total_pagenumber3;//현재 줄에서 마지막 페이지 카운트.
             
             var str ='';
             str+='<a><</a>';
             for(var i = active_pagenumber3; i<total_pagenumber3+1; ++i){
                var id = 'bt' + i;
                if(i ==active_pagenumber3){
                   str+='<a class="active">'+ i + '</a>';
                }else{
                   str+='<a>'+ i + '</a>';
                }
             }
             
             str+='<a>></a>';
             $('#pg3').html(str);
          }
      }else{
             var str ='';
             str+='<a><</a>';
             
             for(var i = first_pagenumber3; i<last_pagenumber3+1; ++i){
                
                if(i ==active_pagenumber3){
                   str+='<a class="active">'+ i + '</a>';
                }else{
                   str+='<a>'+ i + '</a>';
                }
             }
             
             str+='<a>></a>';
             $('#pg3').html(str);
      }
   }
   
   function loadpagebarCur3(){//현재 라인에 있는 버튼을 누를 경우.
      var str ='';
      str+='<a><</a>';
      
      for(var i = first_pagenumber3; i<last_pagenumber3+1; ++i){
         
         if(i ==active_pagenumber3){
            str+='<a class="active">'+ i + '</a>';
         }else{
            str+='<a>'+ i + '</a>';
         }
      }
      
      str+='<a>></a>';
      $('#pg3').html(str);
   }
   
   function loadpagebarPrev3(){//Prev 버튼을 누를 경우.
      if(active_pagenumber3 < first_pagenumber3){//줄이 바뀌어야함.
         if(start_pagenumber3<active_pagenumber3 - 9){
             
             first_pagenumber3 = active_pagenumber3-9;//현재 줄에서 첫번째 페이지 카운트.
              last_pagenumber3 = active_pagenumber3;//현재 줄에서 마지막 페이지 카운트.
              
             var str ='';
             str+='<a><</a>';
             for(var i = active_pagenumber3; i<active_pagenumber3+10; ++i){
                
                if(i ==active_pagenumber3){
                   str+='<a class="active">'+ i + '</a>';
                }else{
                   str+='<a>'+ i + '</a>';
                }
             }
             
             str+='<a>></a>';
             $('#pg3').html(str);
          }else{
             
             first_pagenumber3 = start_pagenumber3;//현재 줄에서 첫번째 페이지 카운트.
              last_pagenumber3 = active_pagenumber3;//현재 줄에서 마지막 페이지 카운트.
             
             var str ='';
             str+='<a><</a>';
             for(var i = start_pagenumber3; i<active_pagenumber3+1; ++i){
                var id = 'bt' + i;
                if(i ==active_pagenumber3){
                   str+='<a class="active">'+ i + '</a>';
                }else{
                   str+='<a>'+ i + '</a>';
                }
             }
             
             str+='<a>></a>';
             $('#pg3').html(str);
          }
      }else{
         var str ='';
          str+='<a><</a>';
          
          for(var i = first_pagenumber3; i<last_pagenumber3+1; ++i){
             
             if(i ==active_pagenumber3){
                str+='<a class="active">'+ i + '</a>';
             }else{
                str+='<a>'+ i + '</a>';
             }
          }
          
          str+='<a>></a>';
          $('#pg3').html(str);
      }
   }
   
   
   $(document).on("click","#pg3 a",function(event){
      if($(this).text() == "<"){//prev
         if(active_pagenumber3 > 1){
            active_pagenumber3 = active_pagenumber3 - 1;//현재 active_pagenumber 갱신.
               loadtable3();
               loadpagebarPrev3();
         }
      }
      else if($(this).text() == ">"){//next
         if(active_pagenumber3 < total_pagenumber3){
            active_pagenumber3 = active_pagenumber3 + 1;//현재 active_pagenumber 갱신.
               loadtable3();
               loadpagebarNext3();
         }
      }
      else{//본인이 누른 페이지.
         active_pagenumber3 = parseInt($(this).text());//현재 active_pagenumber 갱신.
           loadtable3();
           loadpagebarCur3();
      }
      });
    
    
   //상품리스트에 신청과 리뷰 보기 팝업
    function openPopupApply(id){
         //아이템 신청 페이지로 넘기자.
       location.href = 'item.jsp?productID=' + id;
    }
   
    //다녀온 여행 삭제 수행.
      function deleteproduct(deleteitem){
        
        $.ajax({
             type :"POST",
             url : "./deleteItem",
             data : {
            	 item_id:deleteitem
                },//값 전달.
             success : function(result) {
                 
                 if(result == "success"){
                   //삭제 완료.
                   active_pagenumber2 = 1;//현재 페이지 카운트.
                   start_pagenumber2 =0;//총 페이지 중 첫번째 카운트.
                   first_pagenumber2 = 0;//현재 줄에서 첫번째 페이지 카운트.
                   last_pagenumber2 = 0;//현재 줄에서 마지막 페이지 카운트.
                   total_pagenumber2 = 0;//총 페이지 카운트.
                   loadpagecount2();
                   
                }else{
                   //삭제 실패.
                   console.log('상품 삭제 실패.');
                }
             }
          });
      }
    
    //리뷰 등록.
    function InsertReview(){
       $.ajax({
            type :"POST",
            url : "./insertReview",
            data : {item_id:ReviewProduct_id,
                  title:$('#item-review-title').val(),
                  comment:$('#item-review-content').val(),
                  score:5
               },//값 전달.
            success : function(result) {
                
                if(result == "success"){
                   hidemodal();
               }else{
                  //삭제 실패.
                  console.log('리뷰 등록 실패.');
               }
            }
         });
    }
    
    //모달 종료.
    function hidemodal(){
       $('#my-modal').modal('hide');
    }

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
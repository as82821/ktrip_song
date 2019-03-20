	$(document).ready(function() {
		$('#item_list').DataTable({
			 "lengthMenu": [ 10, 5 ]
		});//apply_list_table
		
		$('#fileBt').click(function(){
			var htmlTxt='<input type="file" class="form-control-file"'+
				        'placeholder="썸네일" id="thumbnail" name="thumbnail" required'+
				        'data-validation-required-message="썸네일 이미지를 입력해주세요.">';
            $('#sp').html(htmlTxt);    
            $('input[id=thumbnail]').click();
		});
	});

function call_detail(item_id){
		$.ajax({
            type : "POST",
            url : "/ktrip/itemServlet",
            data:{actionMode:'SELECT',
            	  item_id:item_id},
            success : function(data){
                console.log(data);
                //data == JSON ==> {key:value}  var v={name:'길동'}   v.name ==> '길동'
                //아이템 정보
             	$('#detail_title').text(data.item.title);
                $('#title').val(data.item.title);
                $('#contents').val(data.item.contents);
                $('#num_min').val(data.item.num_min);
                $('#num_max').val(data.item.num_max);
                $('#duration').val(data.item.duration);
                $('#price').val(data.item.price);
                $('#concept').val(data.item.concept);
                var idx = data.item.thumbnail.lastIndexOf('/');
                console.log('idx>>>'+idx)
                var fileName = data.item.thumbnail.substr(idx+1);
                $('#thumbnail').val(fileName);
                $('#item_form').attr("action","/ktrip/itemServlet?actionMode=UPDATE&item_id="+item_id);
                //console.log("/ktrip/itemServlet?actionMode=UPDATE&item_id="+item_id);
                //**//alert(jss로드성공);
                var delete_btn_str = "<button class=\"btn btn-primary\"  type='button'  onclick=\"location.href='/ktrip/itemServlet?actionMode=DEL&item_id="+item_id+"'\">삭제</button>"; 
                //var delete_btn_str = "<button class=\"btn btn-primary\" href=\"./itemServlet?actionMode=DEL&item_id="+item_id+"\"\>삭제</button>"; 
                console.log(delete_btn_str);
                $('#delete_btn').html(delete_btn_str);
                $('.item-modal-header').css('background-image', 'url(' + 'http://13.125.48.37:8080/item_img/'+ fileName + ')');
                //신청자 테이블 생성.
               	console.log(data.applyList.length);
                var str = "<tr>"
               	if(data.applyList.length != 0){
                	for(var i =0;i<data.applyList.length;i++){
                		str += "<td>"+data.applyList[i].name+"</td><td>"+data.applyList[i].start_date+"~"+data.applyList[i].end_date +"</td>";    		
                		if(data.applyList[i].item_status==1){
                		str+="<td><button class=\"btn-primary btn-sm\" id=\"btn_accept\" onclick=\"accept("+data.applyList[i].apply_id+","+item_id+")\">승낙</button></td>"+
                		"<td><button class=\"btn-primary btn-sm\"id=\"btn_decline\" onclick=\"decline("+data.applyList[i].apply_id+","+item_id+")\">거절</button></td></tr>";
               	 		}else{
               	 		str+="<td colspan=2>승낙되었습니다.</td></tr>";
               	 		}
                		
                		}
                }else{
                	str += "<td colspan="+4+">신청자가 없습니다.</td></tr>"
                }
                $("#apply_list_tbody").html(str);
   
            }             
        });		
	}
	//승낙버튼 동작
	function accept(apply_id,item_id){
		 //location.href = "./itemServlet?actionMode=STATCHANGE&apply_id="+apply_id+"&item_status=2&item_id="+item_id;
		 $.ajax({
				  url:"/ktrip/itemServlet",
				  data:{
					  actionMode:'STATCHANGE',
					  apply_id:apply_id,
					  item_status:2,
					  item_id:item_id
				  },
				  success:function(){
					  $.ajax({
				            type : "POST",
				            url : "/ktrip/itemServlet",
				            data:{actionMode:'SELECT',
				            	  item_id:item_id},
				            success : function(data){
				                console.log(data);
				              
				                //신청자 테이블 생성.
				                var str = "<tr>"
				               	if(data.applyList.length!=0){
				                	for(var i =0;i<data.applyList.length;i++){
				                		str += "<td>"+data.applyList[i].name+"</td><td>"+data.applyList[i].start_date+"~"+data.applyList[i].end_date +"</td>";    		
				                		if(data.applyList[i].item_status==1){
				                		str+="<td><button class=\"btn-primary btn-sm\" id=\"btn_accept\" onclick=\"accept("+data.applyList[i].apply_id+","+item_id+")\">승낙</button></td>"+
				                		"<td><button class=\"btn-primary btn-sm\"id=\"btn_decline\" onclick=\"decline("+data.applyList[i].apply_id+","+item_id+")\">거절</button></td></tr>";
				               	 		}else{
				               	 		str+="<td colspan=2>승낙되었습니다.</td></tr>";
				               	 		}
				                		
				                		}
				                }else{
				                	str += "<td colspan="+4+">신청자가 없습니다.</td></tr>"
				                }
				                $("#apply_list_tbody").html(str);
				   
				            }             
				        });		
				  }
		       });//승낙요청		
	}//accept
	
	//거절버튼 동작
	function decline(apply_id,item_id){
		 $.ajax({
				  url:"/ktrip/itemServlet",
				  data:{
					  actionMode:'STATCHANGE',
					  apply_id:apply_id,
					  item_status:3,
					  item_id:item_id
				  },
				  success:function(){
					  $.ajax({
				            type :"POST",
				            url : "/ktrip/itemServlet",
				            data:{actionMode:'SELECT',
				            	  item_id:item_id},
				            success : function(data){
				                console.log(data);
				                //신청자 테이블 생성.
				                var str = "<tr>"
				               	if(data.applyList.length!=0){
				                	for(var i =0;i<data.applyList.length;i++){
				                		str += "<td>"+data.applyList[i].name+"</td><td>"+data.applyList[i].start_date+"~"+data.applyList[i].end_date +"</td>";    		
				                		if(data.applyList[i].item_status==1){
				                		str+="<td><button class=\"btn-primary btn-sm\" id=\"btn_accept\" onclick=\"accept("+data.applyList[i].apply_id+","+item_id+")\">승낙</button></td>"+
				                		"<td><button class=\"btn-primary btn-sm\"id=\"btn_decline\" onclick=\"decline("+data.applyList[i].apply_id+","+item_id+")\">거절</button></td></tr>";
				               	 		}else{
				               	 		str+="<td colspan=2>승낙되었습니다.</td></tr>";
				               	 		}
				                		
				                		}
				                }else{
				                	str += "<td colspan="+4+">신청자가 없습니다.</td></tr>"
				                }
				                $("#apply_list_tbody").html(str);
				            }             
				        });		
				  }
		       });//거절
	}
	
	
	
	  function trip_item_check(){
		  
		  	var form = document.form_item_reg;
		  	if (!form.title.value) {
		  		alert("상품명을 입력하세요.");
		  		return false;
		  	}
		  	
		  	if (!form.destination.value) {
		  		alert("목적지를 입력하세요.");
		  		return false;
		  	}
		  	
		  	if (!form.num_min.value) {
		  		alert("최소인원을 입력하세요.");
		  		return false;
		  	}
		  	
		  	if(form.num_min.value<=0){
		  		alert("최소인원을 1명 이상이어야 합니다.");
		  		return false;
		  	}
		  	
		  	if (!form.num_min.value) {
		  		alert("최대인원을 입력하세요.");
		  		return false;
		  	}
		  	
		  	if (form.num_min.value>form.num_max.value) {
		  		alert("최대인원을 확인하세요.");
		  		return false;
		  	}
		  	
		  	if (!form.duration.value) {
		  		alert("기간을 입력하세요.");
		  		return false;
		  	}
		  	
		  	if (!form.price.value) {
		  		alert("가격을 입력하세요.");
		  		return false;
		  	}
		  	
		  	if (form.price.value<0) {
		  		alert("가격을 확인하세요.");
		  		return false;
		  	}
		  	
		  	if (!form.concept.value) {
		  		alert("상품컨셉을 입력하세요.");
		  		return false;
		  	}
		  	
		  	if (!form.thumbnail.value) {
		  		alert("쎔네일을 입력하세요.");
		  		return false;
		  	}
		  	
		  	if (!form.contents.value) {
		  		alert("상품소개를 입력하세요.");
		  		return false;
		  	}
		  	
		  }
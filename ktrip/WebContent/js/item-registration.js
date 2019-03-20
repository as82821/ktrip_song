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
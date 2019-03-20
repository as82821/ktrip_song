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

// Modal
$(function(){
    $("#popbutton").click(function(){
        $("#modal-link").click(function(){
            $("#my-modal").modal();
        });
    })
})

// Popup 
function myFunction() {
    var popup = document.getElementById("myPopup");
    popup.classList.toggle("show");
};

$(function () {
	$(".scroll").each(function () {
		// 개별적으로 Wheel 이벤트 적용
		$(this).on("mousewheel DOMMouseScroll", function (e) {
        e.preventDefault();
        var delta = 0;
        if (!event) event = window.event;
        if (event.wheelDelta) {
            delta = event.wheelDelta / 120;
            if (window.opera) delta = -delta;
        } else if (event.detail) delta = -event.detail / 3;
        var moveTop = null;
        // 마우스휠을 위에서 아래로
        if (delta < 0) {
            if ($(this).next() != undefined) {
                moveTop = $(this).next().offset().top;
            }
        // 마우스휠을 아래에서 위로
        } else {
            if ($(this).prev() != undefined) {
                moveTop = $(this).prev().offset().top;
            }
        }
        // 화면 이동 0.8초(800)
        $("html,body").stop().animate({
            scrollTop: moveTop + 'px'
            }, {
                duration: 700, complete: function () {
                }
            });
        });
    });
})

// Search Item
function search_item(){
	var start_date = $('#start-date').val();
	var end_date = $('#end-date').val();
	var destination = $('#destination').val();
	
	location.href = 'tourlist.jsp?start-date='+start_date+'&end-date='+end_date+'&destination='+destination;
}
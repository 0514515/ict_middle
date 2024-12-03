
$(function(){
	
// 휴가 신청 내역 페이지 js


	// 휴가 신청 내역 페이지에서 휴가생성 버튼을 눌렀을 때 휴가 생성 모달창 띄우기
	$('.list_btn').click(function(e){

		//alert("리스트 휴가 신청");

		e.preventDefault();
		$('#modal').modal("show");
		
	});

	

	
});
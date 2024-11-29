
$(function(){
	
// 나의 근태 현황 페이지 js


	// 나의 근태 현황 페이지에서 휴가 생성 버튼을 눌렀을 때 휴가 생성 모달창 띄우기
	$('.fc-toolbar .btn ').click(function(e){

		//alert("휴가 신청");

		e.preventDefault();
		$('#modal').modal("show");
		
	});

	

	
});
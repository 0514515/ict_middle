
$(function(){
	
// 휴가 관리 및 신청_ 나의 일정 페이지 js


	// 휴가 관리 및 신청_나의 일정 페이지에서 휴가 생성 버튼을 눌렀을 때 휴가 생성 모달창 띄우기
	$('.fc-toolbar .btn ').click(function(e){

		//alert("휴가 신청");

		e.preventDefault();
		$('#modal').modal("show");
		
	});

	// 휴가 요청 버튼을 누르면 완료 alert 띄우기
	$('.modal-footer button:nth-child(2)').click(function(e){
		
		e.preventDefault();
		$('#modal').modal("hide");

		alert("휴가 신청이 완료되었습니다.");
	});
	
});
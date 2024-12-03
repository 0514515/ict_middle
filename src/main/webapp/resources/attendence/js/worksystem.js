
$(function(){
	
// 관리자_근무제 변경 메인 js

	$('.list_btn').click(function(e){

		//alert("휴가 신청");

		e.preventDefault();
		$('#modal').modal("show");
		
	});

	// 휴가 요청 버튼을 누르면 완료 alert 띄우기
	$('.modal-footer button:nth-child(2)').click(function(e){
		
		e.preventDefault();
		$('#modal').modal("hide");

		alert("승인이 완료되었습니다.");
	});
	
});
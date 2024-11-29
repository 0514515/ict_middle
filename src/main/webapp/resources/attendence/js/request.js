
$(function(){
	
// 관리자-근태 및 휴가 관리 페이지 js

	$('.table tr td').click(function(e){

		e.preventDefault();
		$('#modal').modal("show");
		
	});

	// 정정 요청서 모달창에서 승인 버튼 누르면 승인완료 alert창 띄우기
	$('.modal-footer button:nth-child(2)').click(function(e){
		
		e.preventDefault();
		// 현재 모달창 닫기
		$('#modal').modal("hide");
		// alert창 띄우기
		alert("승인이 완료되었습니다.");
	});
	
	

	
});

$(function(){
	
// 관리자-근태 및 휴가 관리 페이지 js

	
	//----------------------------------- 정정요청 모달 시작
/*	$('.table tr td').click(function(e){

		e.preventDefault();
		$('#modal_modify').modal("show");
		
	});

	// 정정 요청서 모달창에서 승인 버튼 누르면 승인완료 alert창 띄우기
	$('.modal-footer_modify button:nth-child(2)').click(function(e){
		
		e.preventDefault();
		// 현재 모달창 닫기
		$('#modal_modify').modal("hide");
		// alert창 띄우기
		alert("승인이 완료되었습니다.");
	});*/
	
	//----------------------------------- 정정요청 모달 끝
	
	
	
	//----------------------------------- 휴가신청 모달 시작
	
	// 휴가 요청서 모달창에서 승인 버튼 누르면 승인완료 alert창 띄우기

	$('.table tr td').click(function(e){

		e.preventDefault();
		$('#modal_holiday').modal("show");
		
	});
	
	
	
	
	$('.modal-footer_ button:nth-child(2)').click(function(e){
		
		e.preventDefault();
		// 현재 모달창 닫기
		$('#modal_holiday').modal("hide");
		// alert창 띄우기
		alert("휴가 요청이 완료되었습니다.");
	});	

	//----------------------------------- 휴가신청 모달 끝
	
});
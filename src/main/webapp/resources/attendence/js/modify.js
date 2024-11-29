
$(function(){

// 출퇴근 현황 및 정정 요청 모달창 페이지 js
	
	// 출퇴근 정정 요청 페이지에서 출퇴근 기록의 테이블 행을 클릭 했을 때 모달창 띄우기
	$('.table tr td').click(function(e){

		e.preventDefault();
		$('#modal').modal("show");
		
	});

	// 정정 요청 모달창에서 정정요청 버튼 누르면
	$('.modal-footer button:nth-child(2)').click(function(e){
		
		e.preventDefault();
		$('#modal').modal("hide");

		alert("정정요청이 완료되었습니다.");
	});
	

	
});
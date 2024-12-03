$(function(){
	
	// attendence 나의 근태 현황 _ 메인 페이지 js

	// 출근 버튼 누르면 출근 기록 찍히게 하기
	$('.btn_start').on("click", function(evt){
		
		// 버튼의 data-staff-id 속성에서 staff_id 값을 가져온다.
		let staffId = $(this).data("staff-id");
		
		// 서버로 보낼 파라메터 설정
		let param = { staff_id : staffId }; // session에서 가져온 staff_id 사용
		
		
		$.ajax({
			url : "recode"
			, type : "get"
			//, dataType : "json"
			, data : param
			, success : function(result) {
				alert("성공" + result);
	/*			$.(ajax)({
					url : "selectRecode"
					, type : "get" // 넘어오는 거 많으면 post로 바꾸기
					, data : param
					, success : function(result) {
						alert("두번째 ajax" + result);
					}
					, error : function(error) {
						alert("실패");
					}
				})*/
			} // end of first ajax success
			, error : function(error) {
				alert("실패");
			}
			
		}); // end of ajax
		
		let buttonText = $(this).html();
		if (buttonText === "출근") {
		
			// 출근 상태일때 퇴근 버튼으로 바꾸기
			$(this).css("background-color", "#DC3545");
			$(this).html("퇴근");	
		
		} else {
			// 퇴근 상태일 때
			$(this).css("background-color", "#009CFF");
			$(this).html("출근");
		}
		
	
	}); // end of click function
	

});
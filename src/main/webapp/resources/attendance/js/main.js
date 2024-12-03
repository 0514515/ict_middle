$(function(){
	
	// attendence 나의 근태 현황 _ 메인 페이지 js

	// 출근 버튼 누르면 출근 기록 찍히게 하기
	$('.btn_start').on("click", function(evt){
		
		let buttonText = $(this).html();
		
		// 파라메터로 보낼 값 id가 staff_id인 value를 staff_id로 넘겨줌
		let param = { staff_id : $('#staff_id').val() };
		
		
		$.ajax({
			url : "recode"
			, type : "get"
			//, dataType : "json"
			, data : param
			, success : function(result) {
				//alert("성공" + result);
				$.(ajax)({
					url : "selectRecode"
					, type : "get" // 넘어오는 거 많으면 post로 바꾸기
					, data : param
					, success : function(result) {
						alert("두번째 ajax" + result);
					}
					, error : function(error) {
						alert("실패");
					}
				})
			} // end of first ajax success
			, error : function(error) {
				alert("실패");
			}
			
		}); // end of ajax
		
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
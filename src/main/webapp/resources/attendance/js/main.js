$(function(){
	
	// attendence 나의 근태 현황 _ 메인 페이지 js

	
	// working_status가 "출근"이면 퇴근버튼으로, "퇴근"이면 출근버튼으로 상태값에 따라 버튼 변경

//	 let workingStatus = '${workingStatus}';
//	 console.log("상태 값 : " + workingStatus);
//	
//	if ( workingStatus === "출근") {		
//		
//		// 출근 상태일때 퇴근 버튼으로 바꾸기
//		$(".btn_start").css({"background-color" : "#DC3545", "border-color" : "#DC3545"});
//		$(".btn_start").html("퇴근");	
//	
//	} else if ( workingStatus === "퇴근" ){ 
//			// 퇴근 상태일 때
//		$(".btn_start").css({"background-color" : "#009CFF", "border-color" : "#009CFF"});
//		$(".btn_start").html("출근");
//	}

	
	
	 
	// 출근 버튼 누르면 출근 시간 및 workingStatus 상태 찍히게 하기
	$('.btn_start').on("click", function(evt){
		
		// 버튼의 텍스트 값을 가져와서 buttonText에 넣는다.
		let buttonText = $(this).html();		
		// 세션에 있는 staffId 값 받아와서 확인
		let staffId = $('#staffId').val();
		//alert(staffId);
		
		// 서버로 보낼 파라메터 설정
		let param = { staff_id : staffId, workingStatus: buttonText }; // session에서 가져온 staff_id 사용
				
		$.ajax({
			url : "recode"
			, type : "get"
			//, dataType : "json"
			, data : param
			, success : function(result) {
				alert("출근 시간 입력 성공" + result);
				
				selectByrecode();
			}
			, error: function(error) {
                alert("출근 시간 입력 실패");
            }
		}); // end of ajax
		
				
	
		// 넘어온 데이터를 받아서 화면에 출력
	function selectByrecode(result) {
		
			$.ajax ({
				url : "selectRecode"
				, type : "get" // 넘어오는 거 많으면 post로 바꾸기
				, data : param
				, success : function(result) {
					alert("두번째 ajax selectRecode 성공" + result);
					
					// 상태에 따라 버튼 css 변경
					if ( result.workingStatus === "출근") {		
						
						// 출근 상태일때 퇴근 버튼으로 바꾸기
						$(".btn_start").css({"background-color" : "#DC3545", "border-color" : "#DC3545"});
						$(".btn_start").html("퇴근");	
						
						alert('1' + $(".btn_start").html());
						
						// 사원이름과 부서도 바꿔주기				
						$(".main_work_type").html("[" + result.name + result.rank + "/" + result.deptName + "]");
						
						let timeOnlyStart = result.startAt.substring(11,19); // 11번째 자리부터 19번째 전까지의 문자를 추출한다. 즉 2024-12-04 16:20:11 이면 숫자만 빼옴
						$("#start_body").html(timeOnlyStart);	
					} 
					
					if ( result.workingStatus === "퇴근" ){ 
 						// 퇴근 상태일 때
						$(".btn_start").css({"background-color" : "#009CFF", "border-color" : "#009CFF"});
						$(".btn_start").html("출근");
						alert('2' + $(".btn_start").html());
					}
					
					
				}
				, error : function(error) {
					alert("화면에 출력 실패");
				}
				
				
			}); // end of ajax
		
		} // end of function selectByrecode
	
		
	
	}); // end of click function
	



	
});
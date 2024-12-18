$(function(){
	
	// attendence 나의 근태 현황 _ 메인 페이지 js

	// 버튼의 텍스트 값을 가져와서 buttonText에 넣는다.
	let buttonText1 = $(".btn_start").html();	
	console.log("새로고침시 누른 버튼의 텍스르를 보냄");
	// 세션에 있는 staffId 값 받아와서 확인
	let staffId1 = $('#staffId').val();
	//alert(staffId);
	
	// 서버로 보낼 파라메터 설정
//	let param = { staffId : staffId1, workingStatus: buttonText1 }; // session에서 가져온 staff_id 사용
	let param = { staffId : staffId1}; // session에서 가져온 staff_id 사용
	
	$.ajax({
		url : "sendData"
		, type : "post"
		, data : param
		, success : function(result){
			
			console.log(" 출근 시간 확인:  [" +result.startAt + "]  퇴근 시간 확인 : [" + result.endAt);

			if ( result.endAt == null ) {
				
				console.log( "초기화면 출근 시간 넘어오는지 확인" );
				
				var onlyTimeStartAt = result.startAt.substring(11,19);
				
				$("#start_body").html(onlyTimeStartAt);
				$(".main_work_type").html("[" + result.name + result.rank + "/" + result.deptName + "]");
				
				// 퇴근이 완료되면 출근 버튼을 누를 시 퇴근 버튼으로 바뀌는 거 방지
				if( result.workingStatus == "퇴근" ) {
					$(".btn_start").css({"background-color" : "#009CFF", "border-color" : "#009CFF"});
					$(".btn_start").html("출근");
				}
				
				console.log('출근시간이 null이 아닐 때 출근 시간 : ' + onlyTimeStartAt);
				
			} 
			
			if( result.endAt != null ) {
				
				var onlyTimeStartAt = result.startAt.substring(11,19);
				var onlyTimeEndAt = result.endAt.substring(11,19);
				
				$("#start_body").html(onlyTimeStartAt);
				$("#end_body").html(onlyTimeEndAt);
				
				$(".main_work_type").html("[" + result.name + result.rank + "/" + result.deptName + "]");
								
				$(".btn_start").css({"background-color" : "#009CFF", "border-color" : "#009CFF"});
				$(".btn_start").html("출근");
				
				console.log('출근시간이 null일 때 퇴근 시간 : ' + onlyTimeEndAt);
				
			} // end of else if

		}
		, error : function(error){
			alert("데이터 컨트롤러에 요청 실패");
		}
	})// end of ajax

	
	
	 
	// 출근 버튼 누르면 출근 시간 및 workingStatus 상태 찍히게 하기
	$('.btn_start').on("click", function(evt){
		
		// 버튼의 텍스트 값을 가져와서 buttonText에 넣는다.
		let buttonText = $(this).html();		
		// 세션에 있는 staffId 값 받아와서 확인
		let staffId = $('#staffId').val();
		//alert(staffId);
		
		// 서버로 보낼 파라메터 설정
		let param = { staffId : staffId, workingStatus: buttonText }; // session에서 가져온 staff_id 사용
				
		$.ajax({
			url : "recode"
			, type : "get"
			//, dataType : "json"
			, data : param
			, success : function(searchRecode) { // 오늘 날짜 기준 출근 유무 확인 결과 값 / true or false 출력
				//alert("출근이 완료되었습니다.");
				
				//console.log("오늘 출근 여부 확인 : " + result.toString());
				// 오늘 출근한 기록이 없으면 selectByrecode(); 실행
				if ( searchRecode == "true" ) {
					
					selectByrecode(searchRecode);	 // 출근전일때 
					
				}
				
				if ( searchRecode == "false" ) {	// 이미 출근했을 경우 (startAt에 대한 기록이 있을때)
					
					selectByrecode(searchRecode);
					
					//alert("이미 퇴근 완료하셨습니다.");
				}
				
			
			} // end of success
			
			, error: function(error) {
                alert("false라서 시간 입력 실패");
            }
		}); // end of ajax
		
				
	
		// 넘어온 데이터를 받아서 화면에 출력
	function selectByrecode(searchRecode) {	
			$.ajax ({
				url : "selectRecode"
				, type : "get" // 넘어오는 거 많으면 post로 바꾸기
				, data : param
				, success : function(result) {
					//alert("두번째 ajax selectRecode 성공" + result);
					
					// 상태에 따라 버튼 css 변경

					if ( result.endAt == null ) {
						if ( searchRecode = "false" || result.startAt != null ) {
							
							// 출근 상태일때 퇴근 버튼으로 바꾸기
							$(".btn_start").css({"background-color" : "#DC3545", "border-color" : "#DC3545"});
							$(".btn_start").html("퇴근");	
							
							alert("출근이 완료되었습니다.");
							
							console.log("출근입력시 퇴근값 유무 확인 : " + result.endAt)
							// 사원이름과 부서도 바꿔주기				
							//$(".main_work_type").html("[" + result.name + result.rank + "/" + result.deptName + "]");
							
							let timeOnlyStartAt = result.startAt.substring(11,19); // 11번째 자리부터 19번째 전까지의 문자를 추출한다. 즉 2024-12-04 16:20:11 이면 숫자만 빼옴
							$("#start_body").html(timeOnlyStartAt);
							$("#end_body").html("");
							
	
							
							requestToController();
						}
					
					}	
					
					if ( result.endAt != null ) {
						if ( searchRecode = "false" || result.startAt != null ){ 
	 						// 퇴근버튼을 눌렀을 때
							
							alert("퇴근이 완료 되었습니다.");
							
							$(".btn_start").css({"background-color" : "#009CFF", "border-color" : "#009CFF"});
							$(".btn_start").html("출근");
							
							// 데이터가 더이상 들어가지 않을때는 추
							
							console.log("퇴근입력시 출근값 유무 확인 : " + result.startAt);
							
							let timeOnlyStartAt = result.startAt.substring(11,19);
							let timeOnlyEndAt = result.endAt.substring(11,19); // 11번째 자리부터 19번째 전까지의 문자를 추출한다. 즉 2024-12-04 16:20:11 이면 숫자만 빼옴
							
							$("#start_body").html(timeOnlyStartAt);
							$("#end_body").html(timeOnlyEndAt);
							
	
		                    
							requestToController();
						}
					}	
					
					// 버튼 비활성화 처리: 버튼 클릭 후 하루가 지나기 전까지 비활성화
	               // disableButtonUntilNextDay();
					
					// 데이터 서버에 전송
					//requestToController();
					
				}
				, error : function(error) {
					alert("화면에 출력 실패");
				}
				
				
			}); // end of ajax

		} // end of function selectByrecode
	
	
		function requestToController(result) {
			
			$.ajax({
				url : "sendData"
				, type : "post"
				, data : param
				, success : function(result){
					//alert("데이터 컨트롤러에 요청 성공");
				}
				, error : function(error){
					//alert("데이터 컨트롤러에 요청 실패");
				}
			}); // end of ajax
			
		} // end of sendDataToController
		
		
	}); // end of click function
});
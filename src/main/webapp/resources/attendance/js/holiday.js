
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
		
		// 신청자 id와 승인자 id 값 받아오기
		let requestedFromId = $("#requestedFromId").val();
		let requestedToId 	= $("#requestedToId").val();
		
		console.log("신청자 id : " + requestedFromId + "승인자 id : " + requestedToId);
		
		// 휴가 구분 셀렉트 박스에서 값 가져오기
		let holidaySelectBox = $("select[name=holidaySelectBox] option:selected").val();
		//console.log("선택한 휴가 종류 셀렉트 박스 값 확인 : " + holidaySelectBox);
		
		
		// timepicker 값 가져오기
		let holidayTimePickerStart = $('#holidayTimePickerStart').val();
		let holidayTimePickerEnd   = $('#holidayTimePickerEnd').val();
		//console.log("휴가 시작 시간 : " + holidayTimePickerStart + "휴가 종료 시간 : " + holidayTimePickerEnd );

		
		// datepicker 값 가져오기
		let datePickerStart = $('#datePicker_start').val();
		let datePickerEnd	 = $('#datePicker_end').val();
		
		//console.log("휴가 시작 일시 : " + datePickerStart + " 휴가 종료 일시 : " + datePickerEnd );
		
		// 사유 텍스트 박스 값 가져오기
		let reason = $('#text_area').val();
		console.log(" 사유 입력 값 가져오기 : " + reason );
		
		
		
		// param에 저장
		let param = { requestedFromId	: requestedFromId			// 신청자 id
					, requestedToId		: requestedToId				// 승인자 id
					, type				: holidaySelectBox			// 휴가 종류
					, startedTime		: holidayTimePickerStart	// 휴가 시작 시간	
					, endedTime			: holidayTimePickerEnd 		// 휴가 종료 시간
					, startedAt 		: datePickerStart			// 휴가 시작 날짜
					, endedAt 			: datePickerEnd				// 휴가 종료 날짜
					, reasonOfRequest	: reason					// 사유
					};
		
		
		$.ajax({
			url : '/insertHoliday'
			, type : "post"
			, contentType: 'application/json'   // 데이터 형식을 JSON으로 지정
			, data: JSON.stringify(param)    
			, success : function(response){
				alert("휴가신청이 완료 되었습니다." + response)
				
			}
			, error : function(err){
				
				alert("휴가신청에 실패하였습니다." + err);
			}
			
		})

	});
	
});
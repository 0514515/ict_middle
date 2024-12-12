
$(function(){

// 출퇴근 현황 및 정정 요청 모달창 페이지 js
	
	// 출퇴근 정정 요청 페이지에서 출퇴근 기록의 테이블 행을 클릭 했을 때 모달창 띄우기
	$('#workingHistoryTable tr').click(function(e){

		// '근태이상' 배지가 있는지 확인
		let workingSign = $(this).find('span.badge.bg-danger').text().trim();
		
		// 근태이상 배지가 있을 시
		if( workingSign == '근태이상') {
		
			// 해당 행의 일자 값 가져오기
			let insertDate = $(this).find('td').first().html();
			// 출근시간 퇴근시간 값 가져오기
			let startedTime	= $(this).find('td').eq(1).html();
			let endedTime	= $(this).find('td').eq(2).html();
			
			// 모달창에 텍스트 입력하기
			$('#requestInfoTable tr:eq(1) td').html(insertDate);	
			$('#beforeRequestTable tr:eq(0) td').html(startedTime);
			$('#beforeRequestTable tr:eq(1) td').html(endedTime);
		
			
			$('#modal').modal("show");
			
		} else {
			// 근태이상 아닐 시 비활성화
			e.preventDefault();
		}
		

		// 정정 요청 모달창에서 정정요청 버튼 누르면
		$('.modifyModal button:nth-child(2)').click(function(e){
			
			e.preventDefault();
			
			// timpicker 값 가져오기
			let modifyTimePickerStart = $('#modifyTimePickerStart').val();
			console.log("시작시간 확인 : " + modifyTimePickerStart);
			let modifyTimePickerEnd = $('#modifyTimePickerEnd').val();
			
			// 승인권자 이름 가져오기
			let managerName = $('#managerInfoTable tr td').html();
			console.log("dddddd" + managerName);
	
			// 사유 텍스트 박스 값 가져오기
			let reason = $('#text_area').val();
			
			// input에 값 넣어주기
			$('#modifyTimePickerStartInput').val(modifyTimePickerStart);			// 수정 출근시간
			$('#modifyTimePickerEndInput').val(modifyTimePickerEnd);				// 수정 퇴근시간
			$('#managerNameInput').val(managerName);				// 관리자이름
			$('#reasonInput').val(reason);					// 사유
	
			 // 폼 제출
		    $('#modifyRequestForm').submit();
	
		    alert("정정요청이 완료되었습니다.");
		    
			$('#modal').modal("hide");
	
			
		});
	
	});
	
});
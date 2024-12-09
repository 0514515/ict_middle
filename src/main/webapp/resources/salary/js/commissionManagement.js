$(function() {
    // "추가" 버튼 클릭 시 모달 열기
    $('#commissionAddButton').on('click', function () {
        $('#addAllowanceModal').modal('show');
    });

    // 모달의 "추가" 버튼 클릭 이벤트
	$('#saveAllowanceButton').on('click', function () {
	    const allowanceName = $('#allowanceName').val().trim();
	    const defaultAmount = $('#defaultAmountModalInput').val().trim();
	    const companyId = $('#companyId').val();
	
	    if (allowanceName === '' || defaultAmount === '') {
	        alert('수당 이름과 기본 액수를 모두 입력하세요.');
	        return;
	    }
	
	    $.ajax({
	        url: '/salary/commission', // 요청 경로
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify({
	            name: allowanceName,
	            defaultAmount: parseInt(defaultAmount),
	            companyId: parseInt(companyId)
	        }),
	        success: function (response) {
			    // 성공 시 목록 다시 불러오기
			    refreshAllowanceList()
			
			    // 입력값 초기화 및 모달 닫기
			    $('#addAllowanceForm')[0].reset();
			    $('#addAllowanceModal').modal('hide');
			},
	    });
	});
	
	// 선택 변경 사항 저장 버튼 클릭 이벤트
	$('#commissionModifyButton').on('click',function(){
		let param = [];
		
		//체크박스 체크된 값 가져오기
		$("#commissionListBody input[type='checkbox']:checked").each(function(){
			
			// 행 선택
			let tr=$(this).closest("tr");
			
			// 값 가져오기
			let commissionId = tr.find("#commissionId").val();
			let companyId = tr.find("#companyId").val();
			let defaultAmount = tr.find("#defaultAmount").val();
			
			// 객체 패키징 후 보낼 List에 push
			param.push({
				id:commissionId,
				companyId:companyId,
				defaultAmount:defaultAmount
			}); 
		});
		
		// 서버 통신
		$.ajax({
			url:"/salary/commission",
			type:"PATCH",
			contentType:"application/json",
			data: JSON.stringify(param),
			success:function(result){
				refreshAllowanceList();
			},error:function(result){
			}
		});
	});
	
	// 조회 버튼 클릭 시 이벤트
	$("#searchButton").on("click",function(){
		let param = [];
	
		//체크박스 체크된 값 가져오기
		$("#commissionListBody input[type='checkbox']:checked").each(function(){
			
			// 행 선택
			let tr=$(this).closest("tr");
			
			// 값 가져오기
			let commissionId = tr.find("#commissionId").val();
			let companyId = tr.find("#companyId").val();
			
			// 객체 패키징 후 보낼 List에 push
			param.push({
				id:commissionId,
				companyId:companyId,
			}); 
		});
		
		refreshCommissionStaffList(param);
	});
	
    // 행 클릭 시 체크박스 상태 변경
    $('#commissionListBody').on('click', 'tr', function (e) {
        // 클릭한 대상이 input[type="text"]나 개별 체크박스인 경우 이벤트 무시
        if ($(e.target).is('input[type="text"], input[type="checkbox"]')) {
            return;
        }
        // 현재 행의 체크박스
        let $checkbox = $(this).find('input[type="checkbox"]');
        $checkbox.prop('checked', !$checkbox.prop('checked'));
    });
    
    // 개별 체크박스 클릭 이벤트
    $('#commissionListBody').on('click', 'input[type="checkbox"]', function (e) {
        e.stopPropagation(); // 이벤트 전파 방지
    });

    // 전체 선택 체크박스 클릭 시 모든 행의 체크박스 상태 변경
    $('#allCheck').on('click', function () {
        let isChecked = $(this).prop('checked');
        $('#commissionListBody input[type="checkbox"]').prop('checked', isChecked);
    });
    
    // 수당 지급 삭제 버튼 클릭 시 수당 지급 사원 목록에서 체크된 수당 지급 삭제
    $("#commissionDeleteButton").on("click",function(){
    	
    });
});

// 테이블 새로고침 함수
function refreshAllowanceList() {
    $.ajax({
        url: '/salary/commission/list', // 서버에서 수당 목록을 가져오는 API
        type: 'GET',
        success: function (data) {
            // 기존 테이블 내용 비우기
            $('#commissionListBody').empty();
			
			for(let commission of data){
				let tr = $("<tr/>").addClass("align-middle");
				let commissionIdTd = $("<input/>").attr({
					type:"hidden",
					value:commission.id,
					id:"commissionId",
					name:"commissionId"
				});
				
				let companyIdTd = $("<input/>").attr({
					type:"hidden",
					value:commission.companyId,
					id:"companyId",
					name:"companyId",
				});
				
				let checkboxTh = $("<th/>").append(
					$("<input/>").attr({
						type:"checkbox",
						class:"form-check-input"
					})
				);
				
				let commissionNameTd = $("<td/>").text(commission.name);
				let defaultAmountTd = $("<td/>").addClass("w-50").append(
					$("<input/>").attr({
						class:"form-control",
						type:"text",
						id:"defaultAmount",
						name:"defaultAmount",
						value:commission.defaultAmount
					})
				);
				
				tr.append(commissionIdTd);
				tr.append(companyIdTd);
				tr.append(checkboxTh);
				tr.append(commissionNameTd);
				tr.append(defaultAmountTd);
				
				$('#commissionListBody').append(tr);
			}
			
        },
        error: function () {
            alert('수당 목록을 불러오는 데 실패했습니다.');
        }
    });
}

// 수당 지급 사원 목록 테이블 새로고침 함수
let refreshCommissionStaffList = function(param){

	$.ajax({
        url: '/salary/commission/staff/list',
        type: 'POST',
    	contentType: 'application/json',
        contentType: 'application/json',
        data: JSON.stringify(param),
        success: function (result) {
            // 기존 테이블 내용 비우기
            $('#staffCommissionListBody').empty();
            
            // 행 채우기
            for(let staffCommission of result){
            	let tr = $("<tr/>");
            	
            	let selectCheckboxTd = $("<th/>").append(
					$("<input/>").attr({
						type:"checkbox",
						class:"form-check-input"
					})
				);
            	let staffNameTd = $("<td/>").text(staffCommission.staffName);
            	let commissionNameTd = $("<td/>").text(staffCommission.commissionName);
            	let amountTd = $("<td/>").text(staffCommission.amount);
            	let checkboxTd = $("<td/>").append(
            			$("<input/>",{
	            			 type: "checkbox",
					        checked: staffCommission.checkDefaultAmount === 1,
					        disabled: true
            			})
            	);
            	
            	tr.append(selectCheckboxTd);
        	    tr.append(staffNameTd);
			    tr.append(commissionNameTd);
			    tr.append(amountTd);
			    tr.append(checkboxTd);
			    
			    $("#staffCommissionListBody").append(tr);
            }
        },
        error: function () {
        	alert("실패");
        }
    });
};

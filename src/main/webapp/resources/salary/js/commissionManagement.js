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
	
	// 수당 지급 사원 목록 - 전체 선택 체크박스 클릭 이벤트
    $('#allCheck2').on('click', function () {
        let isChecked = $(this).prop('checked');
        $('#staffCommissionListBody input[type="checkbox"]').not('.defaultAmountCheckbox').prop('checked', isChecked);
    });

    // 수당 지급 사원 목록 - 개별 체크박스 클릭 이벤트
    $('#staffCommissionListBody').on('click', 'input[type="checkbox"]', function (e) {
        e.stopPropagation(); // 이벤트 전파 방지
    });

    // 수당 지급 사원 목록 - 행 클릭 시 체크박스 상태 변경
    $('#staffCommissionListBody').on('click', 'tr', function (e) {
        // 클릭한 대상이 input[type="text"], select, 또는 기본액수 체크박스인 경우 이벤트 무시
        if ($(e.target).is('input[type="text"], select, input.defaultAmountCheckbox')) {
            return;
        }
        // 현재 행의 체크박스
        let $checkbox = $(this).find('input[type="checkbox"]').not('.defaultAmountCheckbox');
        $checkbox.prop('checked', !$checkbox.prop('checked'));
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
				$("#searchButton").trigger("click");
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
    
    
    
    // 수당 지급 삭제 버튼 클릭 시 체크된 행 삭제
	$("#commissionDeleteButton").on("click", function () {
	    let selectedRows = [];
	
	    // 체크된 행의 정보를 가져오기
	    $("#staffCommissionListBody input[type='checkbox']:checked").not('.defaultAmountCheckbox').each(function () {
	        let tr = $(this).closest("tr");
	        
	        // hidden input에서 ID 값 가져오기
	        let staffId = tr.find("#staffCommissionStaffId").val(); // 사원 ID
	        let commissionId = tr.find("#staffCommissionCommissionId").val(); // 수당 ID
	        
	        if (staffId && commissionId) {
	            selectedRows.push({
	                staffId: staffId,
	                commissionId: commissionId
	            });
	        }
	    });
	    
	    console.log(selectedRows);
	
	    // 선택된 항목이 없는 경우 처리
	    if (selectedRows.length === 0) {
	        alert("삭제할 항목을 선택해주세요.");
	        return;
	    }
	
	    // 삭제 확인
	    if (confirm("선택한 항목을 삭제하시겠습니까?")) {
	        $.ajax({
	            url: "/salary/commission/staff/list", // 서버 요청 URL
	            type: "DELETE", // 요청 메소드
	            contentType: "application/json", // 요청 데이터 형식
	            data: JSON.stringify(selectedRows), // JSON 데이터 전송
	            success: function (response) {
	                // 성공 시 테이블 갱신 및 알림
	                $("#searchButton").trigger("click");
	            },
	            error: function () {
	                alert("삭제 중 오류가 발생했습니다.");
	            }
	        });
	    }
	});
	
	// "대상 추가" 버튼 클릭
    $("#includeButton").on("click", function () {
        // 선택된 옵션
        let selectedOption = $("#commissionOption option:selected");
        let commissionId = selectedOption.val();
        let defaultAmount = selectedOption.attr("defaultAmount");
        let commissionName = selectedOption.text();

        // jstree에서 체크된 노드 가져오기
        let checkedNodes = $("#jstree").jstree("get_checked", true);
        checkedNodes.forEach(function (node) {
            let staffId = $("#" + node.id).attr("staffId");
            let staffName = node.text;

            // staffId가 없는 경우 회사/부서 노드이므로 추가하지 않음
            if (!staffId) {
                return;
            }

            // 중복 추가 방지
            if (
                $(`#staffCommissionListBodyModal input[name="staffId"][value="${staffId}"]`)
                    .closest("tr")
                    .find(`input[name="commissionId"][value="${commissionId}"]`).length > 0
            ) {
                return;
            }

            // "신규 지급 대상 목록" 테이블에 추가
            let tr = $("<tr/>").addClass("align-middle");
            tr.append(
                $("<input/>").attr({ type: "hidden", value: staffId, name: "staffId" }),
                $("<input/>").attr({ type: "hidden", value: commissionId, name: "commissionId" }),
                $("<th/>").append(
                    $("<input/>").attr({ type: "checkbox", class: "form-check-input row-checkbox" })
                ),
                $("<td/>").text(staffName),
                $("<td/>").text(commissionName),
                $("<td/>").addClass("w-25").append(
                    $("<input/>").attr({
                        class: "form-control",
                        type: "text",
                        name: `amount_${staffId}_${commissionId}`,
                        value: defaultAmount
                    })
                ),
                $("<td/>").append(
                    $("<select/>").attr({
                        class: "form-select",
                        name: `isDefaultAmount_${staffId}_${commissionId}`
                    }).append(
                        $("<option/>").attr({ value: "1" }).text("예"),
                        $("<option/>").attr({ value: "0" }).text("아니오")
                    )
                )
            );

            // 모달 내 테이블(#staffCommissionListBodyModal)에 추가
            $("#staffCommissionListBodyModal").append(tr);
        });
    });

    // 개별 체크박스 클릭 이벤트
    $("#staffCommissionListBodyModal").on("click", "input.row-checkbox", function (e) {
        e.stopPropagation(); // 클릭 이벤트가 부모 요소로 전파되지 않도록 설정
    });

    // 행 클릭 시 체크박스 선택/해제
    $("#staffCommissionListBodyModal").on("click", "tr", function (e) {
        // 클릭한 대상이 input[type="text"]나 select, 체크박스라면 무시
        if ($(e.target).is("input[type='text'], select, input[type='checkbox']")) {
            return;
        }
        let checkbox = $(this).find("input[type='checkbox']");
        checkbox.prop("checked", !checkbox.prop("checked"));
    });

    // 전체 선택/해제
    $("#modalAllCheck").on("click", function () {
        let isChecked = $(this).prop("checked");
        $("#staffCommissionListBodyModal input[type='checkbox']").prop("checked", isChecked);
    });

    // "대상 제외" 버튼 클릭 시 체크된 행 삭제
    $("#excludeButton").on("click", function () {
        $("#staffCommissionListBodyModal input[type='checkbox']:checked").each(function () {
            $(this).closest("tr").remove();
        });
    });
    
    // "저장" 버튼 클릭
    $("#addCommission").on("click", function () {
        // 사용자 확인
        if (!confirm("신규 지급 하겠습니까?")) {
            return; // 취소 시 함수 종료
        }

        // 신규 지급 대상 목록 테이블 데이터 수집
        let data = [];
        $("#staffCommissionListBodyModal tr").each(function () {
            let staffId = $(this).find("input[name='staffId']").val();
            let commissionId = $(this).find("input[name='commissionId']").val();
            let amount = $(this).find("input[name^='amount']").val();
            let isDefaultAmount = $(this).find("select[name^='isDefaultAmount']").val();

            // 데이터 객체 생성
            let row = {
                staffId: staffId,
                commissionId: commissionId,
                amount: amount,
                checkDefaultAmount: isDefaultAmount
            };

            // 배열에 추가
            data.push(row);
        });

        // 서버로 AJAX 요청 보내기
        $.ajax({
            url: "/salary/commission/staff", // 서버 API 엔드포인트
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(data), // 데이터를 JSON 문자열로 변환하여 전송
            success: function (response) {
                // 성공 시 처리
                alert("신규 지급이 완료되었습니다.");
                // 모달 닫기 및 테이블 초기화
                $("#staffCommissionListBodyModal").empty();
                $("#modal").modal("hide");
                $("#searchButton").trigger("click");
            },
            error: function (xhr, status, error) {
                // 실패 시 처리
                alert("신규 지급 처리 중 오류가 발생했습니다. 다시 시도해주세요.");
                console.error("오류 내용:", error);
            }
        });
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
            
            if (result.length === 0) {
                // 결과가 없을 때 메시지 추가
                let emptyRow = $("<tr/>").append(
                    $("<td/>", {
                        colspan: 5,
                        text: "결과가 없습니다.",
                        class: "text-center text-muted"
                    })
                );
                $('#staffCommissionListBody').append(emptyRow);
            } else {
                // 행 채우기
                for (let staffCommission of result) {
                    let tr = $("<tr/>");
                    
                    let selectCheckboxTd = $("<th/>").append(
                        $("<input/>").attr({
                            type: "checkbox",
                            class: "form-check-input"
                        })
                    );
                    let staffId = $("<input/>", {
                        type: "hidden",
                        value: staffCommission.staffId,
                        id: "staffCommissionStaffId"
                    });
                    let commissionId = $("<input/>", {
                        type: "hidden",
                        value: staffCommission.commissionId,
                        id: "staffCommissionCommissionId"
                    });
                    let staffNameTd = $("<td/>").text(staffCommission.staffName);
                    let commissionNameTd = $("<td/>").text(staffCommission.commissionName);
                    let amountTd = $("<td/>").text(formatAmount(staffCommission.amount));
                    let checkboxTd = $("<td/>").append(
                        $("<input/>", {
                            type: "checkbox",
                            checked: staffCommission.checkDefaultAmount === 1,
                            disabled: true
                        }).addClass("defaultAmountCheckbox")
                    );
                    
                    tr.append(staffId);
                    tr.append(commissionId);
                    tr.append(selectCheckboxTd);
                    tr.append(staffNameTd);
                    tr.append(commissionNameTd);
                    tr.append(amountTd);
                    tr.append(checkboxTd);
                    
                    $("#staffCommissionListBody").append(tr);
                }
            }
        },
        error: function () {
        	alert("실패");
        }
    });
};

// 숫자를 쉼표 포함 금액 형식으로 변환하는 함수
function formatAmount(amount) {
    // 값이 undefined, null, 숫자 0일 경우 처리
    if (amount === undefined || amount === null || amount === '') return "0";

    // 숫자인 경우 그대로 처리
    if (typeof amount === "number") {
        return amount.toLocaleString('en-US');
    }

    // 문자열인 경우 쉼표 제거 후 숫자로 변환하여 처리
    const number = parseFloat(amount.toString().replace(/,/g, ''));
    if (isNaN(number)) return "0"; // 변환 실패 시 기본값 반환

    return number.toLocaleString('en-US');
}
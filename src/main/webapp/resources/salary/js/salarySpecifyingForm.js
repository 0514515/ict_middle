$(function(){
	$("#modalAddButton").on("click",function(){
		// jstree에서 체크된 노드 가져오기
        let checkedNodes = $("#jstree").jstree("get_checked", true);
        
        let selectedStaff = [];
        
        // 체크된 노드 중 사원만 필터링
        checkedNodes.forEach(function (node) {
            // `staffId` 속성 존재 여부로 사원을 식별
            let staffId = $("#" + node.id).attr("staffId");
            let staffName = node.text;

            if (staffId) {
                selectedStaff.push({
                    staffId: staffId,
                    staffName: staffName
                });
            }
        });
        
        if(selectedStaff.length>0){
        
        $.ajax({
                url: "/salary/specify/list", // 서버 API 엔드포인트
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(selectedStaff),
                success: function (result) {
                    console.log(result);
                    $('#modal').modal('hide');
                    addTableRow(result);
                },
                error: function () {
                    
                }
        });
        }else{
        	alert("사원을 선택해주세요");
       	} 
	});
	
	// 전체 선택/해제 체크박스 클릭 이벤트
    $('#allCheck').on('click', function () {
        let isChecked = $(this).prop('checked');
        $('#tableBody input[type="checkbox"]').prop('checked', isChecked);
    });

    // 각 행 클릭 시 해당 행의 체크박스 선택/해제
    $('#tableBody').on('click', 'tr', function (e) {
        // 클릭한 대상이 input[type="checkbox"]인 경우 이벤트 무시
        if ($(e.target).is('input[type="checkbox"]')) {
            return;
        }
        let $checkbox = $(this).find('input[type="checkbox"]');
        $checkbox.prop('checked', !$checkbox.prop('checked'));
    });

    // 선택 삭제 버튼 클릭 이벤트
    $('#deleteButton').on('click', function () {
        // 체크된 행 삭제
        $('#tableBody input[type="checkbox"]:checked').each(function () {
            $(this).closest('tr').remove();
        });

        // 전체 선택 체크박스 상태 초기화
        $('#allCheck').prop('checked', false);
    });
    
    // 발급 버튼을 눌러 발급
    $("#specifyButton").on("click", function () {
        let salaryHistoryList = [];

        // 테이블의 모든 행 데이터를 가져오기
        $("#tableBody tr").each(function () {
            let tr = $(this);

            let salaryHistory = {
                companyId: tr.find("#companyId").val(),
                staffId: tr.find("td:eq(1)").text().trim(), // 사원 ID
                totalAmount: parseInt(tr.find("td:eq(3)").text().trim()), // 합계
                basicSalaryAmount: parseInt(tr.find("td:eq(4)").text().trim()), // 기본급
                detailCommissions: [],
            };

                       // 각 수당 금액을 가져오기 (기본급 이후의 컬럼)
            tr.find("td:gt(4)").each(function (index) {
                let commissionAmount = parseInt($(this).text().trim());
                if (commissionAmount > 0) { // amount가 0인 경우 제외
                    let commissionId = $("#main_table thead th")
                        .eq(5 + index)
                        .attr("id")
                        .replace("commission_", ""); // 수당 ID
                    let commissionName = $("#main_table thead th")
                        .eq(5 + index)
                        .text()
                        .trim(); // 수당 이름

                    salaryHistory.detailCommissions.push({
                        id: commissionId,
                        name: commissionName,
                        amount: commissionAmount,
                    });
                }
            });
            salaryHistoryList.push(salaryHistory);
        });

        console.log(salaryHistoryList);

        // AJAX 요청
        $.ajax({
            url: "/salary/specify",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(salaryHistoryList),
            success: function (response) {
                alert("급여 명세가 완료되었습니다.");
                window.location.href = "/salary/specify";
            },
            error: function () {
                alert("오류가 발생했습니다.");
            },
        });
    });
});

let addTableRow = function(result){
	
	//사원 하나마다 행 추가
	for(let staff of result){
		let tr = $("<tr/>").addClass("align-middle");
		
		let companyIdInput = $("<input/>").attr({
			type:"hidden",
			id:"companyId",
			value:staff.companyId
		});
		
		let checkboxTd = $("<td/>").append(
			$("<input/>").attr({
				type:"checkbox",
				class:"form-check-input",
				id:"staffCheckbox_"+staff.staffId
			})
		);
		
		let staffIdTd = $("<td/>").text(staff.staffId);
		let staffNameTd = $("<td/>").text(staff.staffName);
		
		//추가수당과 기본급 합계
		let totalSalary = staff.basicSalaryAmount;
		let totalSalaryTd = $("<td/>");
		let basicSalaryTd = $("<td/>").text(staff.basicSalaryAmount);
		
		tr.append(companyIdInput);
		tr.append(checkboxTd);
		tr.append(staffIdTd);
		tr.append(staffNameTd);
		tr.append(totalSalaryTd);
		tr.append(basicSalaryTd);
		
		for(let commission of staff.staffCommissionList){
			tr.append($("<td/>").text(commission.amount));
			totalSalary += commission.amount;
		}
		totalSalaryTd.text(totalSalary);
		
		$("#tableBody").append(tr);
	}
};
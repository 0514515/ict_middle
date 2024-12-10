let selected = undefined;
$(function() {
    
    // 기본급 목록 테이블의 금액 포맷 적용
    $("#tableBody tr").each(function () {
	    let $amountElement = $(this).find("#amount"); // 금액 셀 선택
	    let amount = $amountElement.text().trim(); // 현재 텍스트 가져오기
	
	    if (amount) {
	        $amountElement.text(formatAmount(amount)); // 포맷 적용
	    }
    });
    
    // 기본급 목록 행 1개마다 클릭 했을 때 선택 기본급 사원 목록 조회 이벤트 주입
    $("#tableBody").on("click", "tr", function() {
        // 클릭했을 때 해당 행의 정보 가져옴
        let salaryId = $(this).children("#salaryId").text();
        let salaryName = $(this).children("#salaryName").text();
        let companyId = $(this).children("#companyId").val();
        let amount = $(this).children("#amount").text();

	    // 쉼표 제거하여 숫자 형태로 변환
    	let rawAmount = amount.replace(/,/g, '');

        // 이름, 금액 액수 입력란에 값 반영
        $("#nameInput").val(salaryName);
        $("#amountInput").val(rawAmount);
        $("#idLabel").text("선택번호 : " + salaryId);

        // 선택된 행이 있으면 배경 색 원래대로 돌리기
        if (selected !== undefined) {
            selected.css("background-color", "");  // 이전 선택된 행의 배경 색상 초기화
        }

        // 선택된 행의 배경 색상 변경
        $(this).css("background-color", "rgb(225, 228, 230)");

        // 현재 클릭된 행을 selected로 지정
        selected = $(this);
        
        // 선택 기본급 사원 목록 갱신
        refreshStaffTableBody(selected);
    });

    // 신규 추가 체크박스의 상태에 따라 선택번호와 삭제 활성화/비활성화 시키기
    $("#checked").on("change", function() {
        // 체크박스 체크되어있으면
        if ($(this).prop("checked")) {
            $("#idLabel").hide(); // 선택 번호 숨기기
            $("#deleteButton").prop("disabled", true); // 삭제 버튼 비활성화
            $("#deleteButton").removeClass("btn-outline-primary").addClass("btn-outline-secondary");
        }
        // 안 되어있으면
        else {
            $("#idLabel").show(); // 선택 번호 보이기
            $("#deleteButton").prop("disabled", false); // 삭제 버튼 활성화
            $("#deleteButton").removeClass("btn-outline-secondary").addClass("btn-outline-primary");
        }
    });

    // 저장 버튼 이벤트
    $("#saveButton").on("click", function() {
        let data = {};
        let url = "";
        let type = "";

        // 신규 추가 체크박스가 체크되어있으면
        if ($("#checked").prop("checked")) {
            // 신규 추가 시: 이름, 금액 액수, 회사 ID 전송
            data = {
                name: $("#nameInput").val(),
                amount: $("#amountInput").val(),
                companyId: $("#companyId").val()
            };
            type = "POST";
        } else {
            // 기존 선택된 기본급 수정 시: 기본급 ID, 이름, 금액 액수 전송
            if (selected === undefined) {
                alert("수정할 항목을 선택해 주세요.");
                return;  // 선택된 기본급이 없으면 동작을 중지
            }

            data = {
                id: selected.find("#salaryId").text(), // 선택된 기본급의 ID
                name: $("#nameInput").val(),
                amount: $("#amountInput").val(),
                companyId: $("#companyId").val()
            };
            type = "PATCH";
        }

        // 서버에 AJAX 요청으로 데이터 전송
        $.ajax({
            url: "/salary/base/index", // 분기 처리된 URL로 요청
            type: type,
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function(result) {
	            // 목록 무조건 갱신
		        refreshBaseSalaryList();
		        $("#staffTableBody").empty();
	            },
            error: function(result) {
	            refreshBaseSalaryList();
		        $("#staffTableBody").empty();
                console.log(result);
            }
        });
    });
    
    // 삭제 버튼 이벤트
    $("#deleteButton").on("click",function(){
    	let data = {
    		id: selected.find("#salaryId").text(),
    		companyId: $("#companyId").val()
    	};
    	
    	// 서버에 AJAX 요청으로 데이터 전송
        $.ajax({
            url: "/salary/base/index", // 분기 처리된 URL로 요청
            type: "DELETE",
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function(result) {
		        // 목록 무조건 갱신
		        refreshBaseSalaryList();
		        $("#staffTableBody").empty();
            },
            error: function(result) {
	            refreshBaseSalaryList();
		        $("#staffTableBody").empty();
	            console.log(result);
            }
        });
    });
});

// 저장(추가/수정), 삭제하면 목록 갱신할 용도
let refreshBaseSalaryList = function() {

    // loginId(세션 자동으로 보내짐)으로 기본급 전체 조회
    $.ajax({
        url: "/salary/base/index/refresh",
        type: "GET",
        success: function(result) {
            rerenderTableBody(result);
        },
        error: function(result) {
            console.log(result);
        }
    });
};

// 목록을 넣어서 목록 테이블 body 리렌더링
let rerenderTableBody = function(result) {
    // tableBody 비우기
    $("#tableBody").empty();

    // 테이블에 데이터 추가
    for (let baseSalary of result) {
        let tr = $("<tr/>");  // 빈 행 생성
        let salaryIdTd = $("<td/>").attr("id", "salaryId").text(baseSalary.id);  // 기본급 번호 td
        let salaryNameTd = $("<td/>").attr("id", "salaryName").text(baseSalary.name);  // 기본급 이름 td
        let amountTd = $("<td/>").attr("id", "amount").text(formatAmount(baseSalary.amount));  // 기본급 금액 액수 td
        let companyIdInput = $("<input/>").attr("id", "companyId").attr("type", "hidden").attr("value", baseSalary.companyId);  // 회사 id hidden input

        tr.append(salaryIdTd);
        tr.append(salaryNameTd);
        tr.append(amountTd);
        tr.append(companyIdInput);

        // 테이블 body에 행 추가
        $("#tableBody").append(tr);
    }

    // 테이블에 행이 추가된 후, 클릭 이벤트를 다시 바인딩
    bindRowClickEvent(); // 클릭 이벤트 바인딩 함수 호출
};

// 클릭 이벤트 바인딩 함수
let bindRowClickEvent = function() {
    $("#tableBody tr").on("click", function() {
        let salaryId = $(this).children("#salaryId").text();
        let salaryName = $(this).children("#salaryName").text();
        let companyId = $(this).children("#companyId").val();
        let amount = $(this).children("#amount").text();

        // 이름, 금액 액수 입력란에 값 반영
        $("#nameInput").val(salaryName);
        $("#amountInput").val(amount);
        $("#idLabel").text("선택번호 : " + salaryId);

        // 이전에 선택된 행이 있으면 배경 색상 초기화
        if (selected !== undefined) {
            selected.css("background-color", "");  // 이전 선택된 행의 배경 색상 초기화
        }

        // 선택된 행의 배경 색상 변경
        $(this).css("background-color", "rgb(225, 228, 230)");

        // 현재 클릭된 행을 selected로 지정
        selected = $(this);
        
        // 선택 기본급 사원 목록 갱신
        refreshStaffTableBody();
    });
};

// 사원 목록 가져오기
let refreshStaffTableBody = function(){
	
	let salaryId = selected.children("#salaryId").text();
	let companyId = selected.children("#companyId").val();
	
	let data = {
		id : salaryId,
		companyId : companyId
	};
	
	$.ajax({
        url: "/salary/base/staff",
        type: "GET",
        data: data,
        success: function(result) {
            rerenderStaffTableBody(result); 
        },
        error: function(result) {
            console.log(result);
        }
    });
	
}

// 사원 목록 테이블 랜더링
let rerenderStaffTableBody = function(result){
	// tableBody 비우기
    $("#staffTableBody").empty();
    
    salaryName = selected.children("#salaryName").text();
    amount = formatAmount(selected.children("#amount").text());

	
    // 테이블에 데이터 추가
    for (let staff of result) {
        let tr = $("<tr/>");  // 빈 행 생성
        let departmentName = $("<td/>").text(staff.departmentName);  // 부서 이름 td
        let staffNameTd = $("<td/>").text(staff.staffName);  // 사원 이름 td
        let salaryNameTd = $("<td/>").text(salaryName);
        let amountTd = $("<td/>").text(amount);  // 기본급 금액 액수 td

        tr.append(departmentName);
        tr.append(staffNameTd);
        tr.append(salaryNameTd);
        tr.append(amountTd);

        // 테이블 body에 행 추가
        $("#staffTableBody").append(tr);
    }
}

// 숫자를 금액 포맷으로 변환하는 함수
function formatAmount(amount) {
    // 금액 데이터를 쉼표 포함 포맷으로 변환
    return parseFloat(amount.replace(/,/g, '')).toLocaleString('en-US');
}
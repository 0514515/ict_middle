$(function(){
	
	// jstree 초기화
    $('#jstree').jstree({
        'plugins': ['checkbox', 'search'],
        'checkbox': {
            'three_state': false
        }
    }).jstree('open_all');

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

            // 중복 추가 방지
            if ($(`#staffCommissionListBodyModal input[value="${staffId}"]`).length > 0) {
                alert(`${staffName}은(는) 이미 추가되었습니다.`);
                return;
            }

            // "신규 지급 대상 목록" 테이블에 추가
            let tr = $("<tr/>").addClass("align-middle");
            tr.append(
                $("<input/>").attr({ type: "hidden", value: staffId, name: "staffId" }),
                $("<input/>").attr({ type: "hidden", value: commissionId, name: "commissionId" }),
                $("<th/>").append($("<input/>").attr({ type: "checkbox", class: "form-check-input" })),
                $("<td/>").text(staffName),
                $("<td/>").text(commissionName),
                $("<td/>").addClass("w-25").append(
				    $("<div/>").addClass("row g-0").append(
				        $("<div/>").addClass("col-auto").append(
				            $("<input/>").attr({
				                class: "form-control",
				                type: "text",
				                name: `amount_${staffId}`,
				                value: defaultAmount
				            })
				        )
				    )
				),
                $("<td/>").append(
                    $("<select/>").attr({
                        class: "form-select",
                        name: `isDefaultAmount_${staffId}`
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

    // "대상 제외" 버튼 클릭 시 체크된 행 삭제
    $("#excludeButton").on("click", function () {
        $("#staffCommissionListBodyModal input[type='checkbox']:checked").each(function () {
            $(this).closest("tr").remove();
        });
    });

    // 전체 선택/해제
    $("#modalAllCheck").on("click", function () {
        let isChecked = $(this).prop("checked");
        $("#staffCommissionListBodyModal input[type='checkbox']").prop("checked", isChecked);
    });

    // 행 클릭 시 체크박스 선택/해제
    $("#staffCommissionListBodyModal").on("click", "tr", function (e) {
        // 클릭한 대상이 input[type="text"]나 select라면 무시
        if ($(e.target).is("input[type='text'], select")) {
            return;
        }
        let checkbox = $(this).find("input[type='checkbox']");
        checkbox.prop("checked", !checkbox.prop("checked"));
    });
			
		// 엔터 클릭시 서치 
		function show_name(e){
	           
           var searchTxt = document.getElementById("search_input").value;
           var code = e.code;

           if(code == 'Enter'){ 
        	   $('#jstree').jstree(true).search(searchTxt);
           }
           
        }
		
		// 검색 버튼 클릭시 서치 
		$('#search_btn').click(function(){
			 var searchTxt = document.getElementById("search_input").value;
			 $('#jstree').jstree(true).search(searchTxt);
		})
		
		// 엔터 키 이벤트 리스너 추가
	    document.getElementById("search_input").addEventListener("keydown", show_name);
		
		$('#jstree').jstree(true).search(text);
		// $("#jstree").jstree("search", searchString);
		
		// changed.jstree 이벤트 핸들링
		$('#jstree').on('changed.jstree', function(e, data) {
			console.log('변경된 노드 ID:', data.selected);
		});

		// open_node.jstree 이벤트 핸들링
		$('#jstree').on('open_node.jstree', function(e, data) {
			console.log('노드가 열렸습니다:', data.node.text);
		});

		// close_node.jstree 이벤트 핸들링
		$('#jstree').on('close_node.jstree', function(e, data) {
			console.log('노드가 닫혔습니다:', data.node.text);
		});

		// select_node.jstree 이벤트 핸들링
		$('#jstree').on('select_node.jstree', function(e, data) {
			console.log('노드가 선택되었습니다:', data.node.text);
		});

		// deselect_node.jstree 이벤트 핸들링
		$('#jstree').on('deselect_node.jstree', function(e, data) {
			console.log('노드 선택이 해제되었습니다:', data.node.text);
		});
})
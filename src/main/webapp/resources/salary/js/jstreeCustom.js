$(function(){
    // jstree 초기화
    $('#jstree').jstree({
        'plugins': ['checkbox', 'search'],
        'checkbox': {
            'three_state': true // 부모-자식 관계를 자동으로 처리
        }
    }).jstree('open_all');

    // 부모 노드 체크 시 자식 노드 동작
    $('#jstree').on('check_node.jstree', function (e, data) {
        if (data.node.children_d) {
            data.node.children_d.forEach(function (childId) {
                $('#jstree').jstree('check_node', childId);
            });
        }
    });

    // 부모 노드 체크 해제 시 자식 노드 동작
    $('#jstree').on('uncheck_node.jstree', function (e, data) {
        if (data.node.children_d) {
            data.node.children_d.forEach(function (childId) {
                $('#jstree').jstree('uncheck_node', childId);
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
    
    // "적용" 버튼 클릭
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
            },
            error: function (xhr, status, error) {
                // 실패 시 처리
                alert("신규 지급 처리 중 오류가 발생했습니다. 다시 시도해주세요.");
                console.error("오류 내용:", error);
            }
        });
    });
});

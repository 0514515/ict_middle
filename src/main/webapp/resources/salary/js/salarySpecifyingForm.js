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
        
        $.ajax({
                url: "/salary/specify/list", // 서버 API 엔드포인트
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(selectedStaff),
                success: function (response) {
                    console.log(response);
                    $('#modal').modal('hide');
                },
                error: function () {
                    
                }
        });
	});
});
$(function(){
    // 행 클릭 시 체크/체크해제 이벤트 부여 (단, input text 필드는 제외)
    $("#tableBody tr").on("click", function(event){
        // input text 또는 체크박스 클릭을 제외하고 체크박스를 변경
        if (!$(event.target).is('input[type="text"], input[type="checkbox"]')) {
            let checkbox = $(this).find("input[type='checkbox']");
            checkbox.prop("checked", !checkbox.prop("checked"));
        }
    });
    
    // 체크박스 클릭 시 체크/체크해제 이벤트 부여
    $("#tableBody input[type='checkbox']").on("click", function(event){
        // 체크박스를 클릭했을 때 이벤트 전파를 막아줍니다.
        event.stopPropagation();
    });
    
    // 전체 체크 박스 체크/체크해제 이벤트 부여
    $("#allCheck").on("change", function() {
        // 전체 체크박스를 확인하고 체크 상태에 맞게 처리
        let isChecked = $(this).prop("checked");
        
        // 각 행의 체크박스를 전체 선택/해제
        $("#tableBody input[type='checkbox']").each(function() {
            $(this).prop("checked", isChecked);
        });
    });
    
    // 선택 수정 버튼 클릭하여 update
    $("#modifyButton").on("click",function(){

    	let param = [];
    	
    	// 체크된 체크박스의 값 가져오기
    	$("#tableBody input[type='checkbox']:checked").each(function(){
    		
    		let tr = $(this).closest("tr");
    		
    		//값 가져오기
    		let staffId = tr.find("input[name='staffId']").val();
    		let authority = tr.find("input[name='authority']").val();
    		
    		param.push({
			    staffId: staffId,   
			    authority: authority
			});
    	});
    	
    	//서버 통신
    	$.ajax({
    		url: "/member/permission",
    		type: "PATCH",
    		contentType: "application/json",
    		data: JSON.stringify(param),
    		success: function(result){
    			alert("OK");
    			//검색 옵션, 검색 키워드, 현재 페이지 수 등 현재 검색 조건을 유지한 채 리다이렉트
    			
    			let searchOption = $("#searchOption").val();
    			let searchKeyword = $("#searchKeyword").val();
    			let pageNum = $("li.page-item.active a").text();
    			
    			window.location.href = "/member/permission?searchOption=" + searchOption
                + "&searchKeyword=" + searchKeyword
                + "&pageNum=" + pageNum;
    		},
    		
    		error: function(result){
    			alert("NO");
    			//검색 옵션, 검색 키워드, 현재 페이지 수 등 현재 검색 조건을 유지한 채 리다이렉트
	    		let searchOption = $("#searchOption").val();
    			let searchKeyword = $("#searchKeyword").val();
    			let pageNum = $("li.page-item.active a").text();
    			
    			window.location.href = "/member/permission?searchOption=" + searchOption
                + "&searchKeyword=" + searchKeyword
                + "&pageNum=" + pageNum;
    		}
    	});
    });
});

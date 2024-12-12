$(function(){
	
	// jstree 초기화 
	$('#jstree').jstree({
        'plugins': ['checkbox', 'search'],
        'checkbox': {
            'three_state': false
           }     // 모든 체크박스가 독립적으로 동작하도록 설정
    }).jstree('open_all');
	
	
	// 결재 추가 버튼 클릭시 
	$('#line_plus').click(function() {
		// 체크된 노드들 가져오기 
		var selectedNodes = $('#jstree').jstree('get_selected', true);
		
		selectedNodes.forEach(function(node) {
		    console.log("node.id", node.id);  // 노드의 ID
		    console.log("node.text", node.text);  // 노드의 텍스트 (이름) 
		    console.log("node.parent", node.parent);  // 부모 노드 ID
		    console.log("node.attr", node.li_attr);  // 사용자 정의 속성들 (예: staffId, staffRank 등)
		});
		
		
		// 테이블에 추가할 사람들(체크된 노드의 정보) 
		var rows=''; 
		selectedNodes.forEach(function(node){
			// 부모 노드의 ID
	        var parentNodeId = node.parent;

	        // 부모 노드의 li_attr 가져오기
	        var parentNode = $('#jstree').jstree('get_node', parentNodeId);
	        var parentLiAttr = parentNode.li_attr;

	        console.log('Parent Node li_attr:', parentLiAttr);  // 부모 노드의 li_attr 출력
			
			var parentDepartmentName = parentLiAttr.departmentname || '알 수 없음';
	        var staffname = node.text || '알 수 없음';
	        var rank = node.li_attr.staffrank || '알 수 없음';
	        var staffId = node.li_attr.staffid || '알 수 없음';  // staffId 추가
			
			if(parentDepartmentName && staffname && rank) {
				  rows += '<tr data-staffId="' + staffId + '">' +  // staffId를 data- 속성으로 추가
		                '<td>' + '[' + parentDepartmentName + '] '+ staffname + ' ' + rank + '</td>' +    // 부서명 + 이름 + 직급
		                '<td><div><button type="button" class="btn-close" aria-label="Close"></button></div></td>' +
		                '</tr>';
			}else {
				console.log('node를 찾을 수 없습니다', node);
			}
	
		})
		
		// 테이블의 tbody에 추가 
		$('.line_table tbody').append(rows);
		
		// 테이블에 옮긴 후에 체크박스 해제
	    $('#jstree').jstree('deselect_all');
		
		// 추가된 버튼에 클릭 이벤트를 바인딩 
		$('.btn-close').click(function(){
			// 클릭된 버튼이 속한 행을 삭제
			$(this).closest('tr').remove(); 
		})
	
		
		
	});
		
	// 참조 추가 버튼 클릭시 
			$('#ref_plus').click(function() {
			    // 체크된 자식 노드들 가져오기 (부모는 제외)
			    var selectedNodes = $('#jstree').jstree('get_selected', true);
			    
			    selectedNodes.forEach(function(node) {
				    console.log("node.id", node.id);  // 노드의 ID
				    console.log("node.text", node.text);  // 노드의 텍스트 (이름) 
				    console.log("node.parent", node.parent);  // 부모 노드 ID
				    console.log("node.attr", node.li_attr);  // 사용자 정의 속성들 (예: staffId, staffRank 등)
				});
			    

				// 테이블에 추가할 사람들(체크된 노드의 정보) 
				var rows=''; 
				selectedNodes.forEach(function(node){
					// 부모 노드의 ID
			        var parentNodeId = node.parent;

			        // 부모 노드의 li_attr 가져오기
			        var parentNode = $('#jstree').jstree('get_node', parentNodeId);
			        var parentLiAttr = parentNode.li_attr;

			        console.log('Parent Node li_attr:', parentLiAttr);  // 부모 노드의 li_attr 출력
					
					var parentDepartmentName = parentLiAttr.departmentname || '알 수 없음';
			        var staffname = node.text || '알 수 없음';
			        var rank = node.li_attr.staffrank || '알 수 없음';
			        var staffId = node.li_attr.staffid || '알 수 없음';  // staffId 추가
					
					if(parentDepartmentName && staffname && rank) {
						  rows += '<tr data-staffId="' + staffId + '">' +  // staffId를 data- 속성으로 추가
				                '<td>' + '[' + parentDepartmentName + '] '+ staffname + ' ' + rank + '</td>' +    // 부서명 + 이름 + 직급
				                '<td><div><button type="button" class="btn-close" aria-label="Close"></button></div></td>' +
				                '</tr>';
					}else {
						console.log('node를 찾을 수 없습니다', node);
					}
			
				})
				
				
			    // 테이블의 tbody에 추가
			    $('.ref_table tbody').append(rows);
				
				// 테이블에 옮긴 후에 체크박스 해제
			    $('#jstree').jstree('deselect_all');

			    // 추가된 버튼에 클릭 이벤트를 바인딩
			    $('.btn-close').click(function() {
			        // 클릭된 버튼이 속한 행을 삭제
			        $(this).closest('tr').remove(); 
			    });
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
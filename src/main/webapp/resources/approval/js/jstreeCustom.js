$(function(){
	
	// jstree 초기화 
		$('#jstree').jstree({
			'plugins' : [ 'checkbox', 'search' ]
		}).jstree('open_all');
		
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
		
		$('#linePlus').click(function() {  //#confirmationBtn
			var selectedNodes = $('#jstree').jstree('get_selected', true);
			var selectedNodeIds = selectedNodes.map(function(node) {
				return node.id;
			});
			alert("선택된 항목 ID: " + selectedNodeIds.join(", "));
		});

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
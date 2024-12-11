
$(function(){

	// 관리자_근무제 변경 메인 js

	
	addChecked();
	
	
	
	// 근무제 등록 누르면 등록 모달창 띄우기
	$('.workSystemBtn').click(function(e){
		
		// 버튼을 재클릭시 내용 비워주기
		$("select[name=selectWorkSystemName]").val('');
		
		$("#timePickerStart").val('');
		$("#timePickerEnd").val('');
		
		//e.preventDefault();
		$('#modal_workSystem').modal("show");

		// 모달창 닫기
		/*		e.preventDefault();
		$('#modal').modal("hide");*/

		// 모달창의 근무제 생성 버튼을 누르면 값 넘겨주기
		$(".insertWorkBtn").off('click').one('click',function(){

			
			// 셀렉트박스 근무제명 값 가져오기
			let selectWorkName = $("select[name=selectWorkSystemName] option:selected").val();
			console.log("셀렉트박스값 확인11: " + selectWorkName);

			
			// timepicker 값 가져오기
			let timePickerStart = $('#timePickerStart').val();
			let timePickerEnd	= $('#timePickerEnd').val();
			console.log("출근시간확인:" + timePickerStart + "퇴근 시간 확인 " + timePickerEnd);

			// param에 저장
			let param = { selectWorkName : selectWorkName
						, timePickerStart : timePickerStart
						, timePickerEnd : timePickerEnd };
			
			
			console.log("param확인" , param);
			
			// 셀렉트 박스에 있는 값 전달
			$.ajax({
				url : "/insert"
					, type : "post"
					, data : param
					, dataType : "json"
					, success :	 function(reponse) {
				        alert("입력이 완료되었습니다.");
				        
				        $('#modal_workSystem').modal("hide");
				    }
					, error : function(reponse) {
	
				        alert("입력실패: " + error);  // 오류 메시지 출력
				    }
			}); // end of ajax	

			

		}); // end of insertWorkBtn



	});// end of timePickerStart	
	

	/*	$('.list_btn').click(function(e){

		//alert("휴가 신청");

		e.preventDefault();
		$('#modal').modal("show");

	});*/

	
	// 시작 시간 셀렉트 박스를 눌렀을 때 선택된 근무 유형에 따른 출근시간 퇴근시간 불러오기
	$('select[name=workSystemName]').change(function(){
		
		alert("dd");
		
		// 근무 유형 셀렉트 박스에서 선택된 값 받아오기
		let workName = $("select[name=workSystemName] option:selected").val();
			console.log("눌린 값 확인 :" + workName);
		
		// 받아온 값 param으로 지정
		let param = { workName : workName };
		
		
		$.ajax({
			url : '/selectTime'
			, type : "post"
			, data : param
			, success : function(result){
				alert("성공");
				console.log(result);
				
				 $("select[name=workStartTime]").val("");
				// 기존 option들을 지우고 새로운 option들을 추가
		        $("select[name=workStartTime]").empty();
		        // result에서 workSystemStartedAt 값을 이용해 새로운 option 생성
		        result.forEach(function(item) {
		            $("select[name=workStartTime]").append('<option value="' + item.workSystemStartedAt + '">' + item.workSystemStartedAt + " ~ " + item.workSystemEndedAt + '</option>');
		            
		        });

		        $("select[name=workEndedTime]").val("");
		        $("select[name=workEndedTime]").empty();
		        // result에서 workSystemStartedAt 값을 이용해 새로운 option 생성
		        result.forEach(function(item) {

			        $("select[name=workEndTime]").append('<option value="' + item.workSystemEndedAt + '">' + item.workSystemEndedAt + '</option>');
		            
		        });
		        
				
			}
			, error : function(result){
				alert("실패");
			}
			
		}); // end of ajax
	
	}); // end of change
	

	// 부서 셀렉트 박스에 따라 사원 출력
	$('select[name=departmentSelect]').change(function(){
		
		let department = $("select[name=departmentSelect] option:selected").val();
				
		console.log("부서별 리스트 확인 : " + department);
		

		// 전체부서를 누를 땐 화면이 다시 새로고침
	   if (department === "전체부서") {
	        window.location.reload();  // 페이지 새로고침
	        return; // 새로고침 후 더 이상 코드가 실행되지 않도록 종료
	    }

	   
		let param = { department : department };
		alert("클릭이벤트 ");
		
		$.ajax({
			url : '/management/worksystem/department'
			, type : 'post'
			, data : param
			, success : function (result) {
				
				alert("부서별 값 받아오기 성공 " + result);
					
				console.log("첫 번째 직원의 staffId: " + result.staffListByCompanyIdDeptName[0].staffId);
		
				// 페이징 버튼을 업데이트
                //updatePagination(result.totalPage, param.pageNum); // 값으로 
				
	            // 결과를 이용해 테이블 행 추가
	            let tableBody = $("#staffTableBody"); // 테이블의 tbody 부분을 선택

	            // 테이블 기존 내용 초기화
	           $('#defaultStaffTableBody').empty();
	           $('#staffTableBody').empty();

	            // 결과 데이터를 기반으로 테이블 생성
	            result.staffListByCompanyIdDeptName.forEach(function(staff) {
	                let row = `
	                    <tr>
	                        <td>
	                            <div class="form-check">
	                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
	                            </div>
	                        </td>
	                        <td>${staff.staffId}</td>
	                        <td>${staff.departmentName}</td>
	                        <td>${staff.staffName}</td>
	                        <td>${staff.workSystemName}</td>
	                        <td>${staff.workSystemStartedAt}</td>
	                        <td>${staff.workSystemEndedAt}</td>
	                    </tr>
	                `;
	                tableBody.append(row); // 새로운 행을 테이블에 추가
	            
	                
	                
	                addChecked();
	            });
				
			}
			, error : function(err) {
				
				alert("부서별 값 받아오기 실패 " + err);
			}
			
			
		})// end of ajax
		
	}); // end of change
	
	
	
	
	function addChecked(){
		
		updateSelectAllCheckbox();
		
		// 전체 선택 체크박스를 눌렀을 때 전체 선택 및 해제
		$("#flexCheckDefaultAll").click(function(){
			
			if($("#flexCheckDefaultAll").is(":checked")) { 
				$("input[id=flexCheckDefault]").prop("checked", true);
			} else { 
				$("input[id=flexCheckDefault]").prop("checked", false);
			}
		});
		
		// 체크박스 클릭 시 전체를 클릭 했을 경우 전체 선택 체크박스도 클릭되게 하기
		$("input[id=flexCheckDefault]").click(function(){
			
			updateSelectAllCheckbox();

		}); // end of click
		
		
		function updateSelectAllCheckbox() {
			// 체크박스의 전체 수
			var total = $("input[id=flexCheckDefault]").length;
			var checked = $("input[id=flexCheckDefault]:checked").length;
			
			if(total === checked) { 
				$("#flexCheckDefaultAll").prop("checked", true);
			} else {
				$("#flexCheckDefaultAll").prop("checked", false);
			}
		
		}
		
	};// end of addCehcked
	
	
	
	// 페이징 업데이트
	/*function updatePagination(totalPage, currentPage) {
	    let paginationHtml = '';
	    let begin = Math.max(1, currentPage - 2); // 페이지 번호 시작
	    let end = Math.min(totalPage, currentPage + 2); // 페이지 번호 끝
	
	    // "이전" 버튼
	    if (currentPage > 1) {
	        paginationHtml += `<li class="page-item"><a class="page-link" href="/management/worksystem?pageNum=${currentPage - 1}">이전</a></li>`;
	    }

	    // 페이지 번호 출력
	    for (let i = begin; i <= end; i++) {
	        let activeClass = (i === currentPage) ? 'active' : '';
	        paginationHtml += `<li class="page-item ${activeClass}"><a class="page-link" href="/management/worksystem?pageNum=${i}">${i}</a></li>`;
	    }

	    // "다음" 버튼
	    if (currentPage < totalPage) {
	        paginationHtml += `<li class="page-item"><a class="page-link" href="/management/worksystem?pageNum=${currentPage + 1}">다음</a></li>`;
	    }

	    // 페이징 영역에 HTML 업데이트
	    $('#pagination').html(paginationHtml);
	}*/
	
	
	
	
});
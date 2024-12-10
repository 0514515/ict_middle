<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>기안 작성하기</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />

<!-- Favicon -->
<link href="/resources/template/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link
	href="/resources/template/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="/resources/template/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="/resources/template/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/resources/template/css/style.css" rel="stylesheet">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>


	<!-- 공통 커스텀 스타일 -->
	<style>
	body {
		font-family: "Noto Sans KR", sans-serif !important;
	}
	
	.navbar {
		border-bottom: 1px solid #14A4FF;
		height: 60px;
	}
	
	.fa-hashtag:before {
		display: none;
	}
	
	.sidebar .navbar .dropdown-item {
		padding-left: 35px;
	}
	
	.sidebar .navbar .navbar-nav .nav-link {
		font-weight: 600;
	}
	
	.ms-4 {
		margin-top: 1rem;
	}
	</style>
	
	<!-- 개인 커스텀 -->
	<style>
	
	/* 본문 높이값 _ footer올라오는 현상 방지 */
	.container {
		height: 83%;
	}
	
	table {
		text-align: left;
	}
	
	/*뱃지 컬러 : 임시저장*/
	.bg-success {
		background-color: #D1E7DD !important;
		color: #0A3622;
	}
	/*뱃지 컬러 : 회수*/
	.bg-warning {
		background-color: #FFF3CD !important;
		color: #664D03;
	}
	
	.form-select {
		display: inline-block;
		width: 35%;
	}
	
	.search_form {
		text-align: right;
	}
	
	.search_form form {
		display: inline-block;
	}
	
	.border-0 {
		border: 1px solid #ced4da !important;
	}
	
	.form-check {
		min-height: 0px;
		padding-left: 0px;
		margin-bottom: 0px;
		margin-left: 0px !important;
		display: inline-block;
	}
	
	.form-check-input {
		margin-left: 0px !important;
	}
	
	.choice_save, .choice_cancel {
		border: 1px solid #14A4FF;
		background-color: #fff;
		color: #14A4FF;
		font-weight: 500;
	}
	
	.choice_send {
		border: 1px solid #14A4FF;
		background-color: #14A4FF;
		color: #fff;
		font-weight: 500;
	}
	
	.btn:hover {
		color: #00539d;
	}
	
	.form_box {
		border: 1px solid #14A4FF;
		border-radius: 10px;
	}
	
	.form_box_hidden {
		border: 1px solid #ccc;
		border-radius: 10px;
	}
	
	.form-label {
		color: #191C24;
		font-size: 1.2em;
		font-weight: 500;
	}
	
	h5 {
		color: #14A4FF;
	}
	
	.first_cell {
		width: 88%;
	}
	
	.form_preview {
		border: 1px solid #191C24;
		height: 300px;
	}
	
	iframe {
		width: 25vw;
		height: 58.5vh;
		border: none;
	}
	
	.form_ch_name span {
		color: #191C24;
	}
	
	.form_subtitle {
		font-size: 20px;
		color: #191C24;
		font-weight: 500;
	}
	
	.tree_div {
		border: 1px solid #191C24;
		height: 400px;
	}
	
	.table_div{
		height:50%;
		align-content:center;
	}
	
	.btn_group{
		text-align:center;
		height:100%;
	}
	
	.btn_group div{
		align-content:center;
		height:50%;
	}
	
	.btn_group .btn{
		border: 1px solid #14A4FF;
		background-color: #fff;
		color: #14A4FF;
		font-weight: 500;
	}
	
	/* 결재선 모달 내부 테이블 높이값 및 overflow 지정 */
	.table_height{
		height:168px;
		border: 1px solid #ccc;
		overflow-y:scroll;
	}
	
	/* 본문 테이블 높이값 및 overflow 지정 */
	.body_table_height{
	height:144px;
	border: 1px solid #ccc;
	overflow-y:scroll;
	}
	
		
	.frame_div {
		height:577px;
		overflow-y: scroll;
	}
	
	#formContent{
		transform:scale(0.7);
		transform-origin: top left;
		height:700px;
	}
	
	#formCheckboxContainer{
		height: 500px;
    	overflow-y: scroll;
	}
	
	</style>

</head>

<body>

<!-- 결재양식 선택 Modal -->
	<div class="modal fade" id="formModal" tabindex="-1"
		aria-labelledby="formModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="formModalLabel">결재 양식 선택 및 미리보기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<div class="row">

						<div class="col-md-4 ms-auto ps-4">
							<!-- 모달 서브제목 -->
							<p class="mt-4 mb-4 form_subtitle">결재 양식 선택</p>
							
							<!-- 체크박스 리스트 -->
							<div id="formCheckboxContainer">
								<!-- 이곳에 Ajax로 받은 양식 목록 동적 추가 -->
							</div>

						
						</div>
						
						
						<div id="frame_content" class="col-md-8 ms-auto frame_div">
							<div id="formContent">
								<!-- iframe pdf 사용시 툴바 숨기기 : 확장자명 뒤에 #toolbar=0&navpanes=0&scrollbar=0 추가 -->
								<!-- <iframe
									src="/resources/approval/img/sample.pdf#toolbar=0&navpanes=0&scrollbar=0"></iframe> -->
								
								<!-- 이곳에 ajax 통해 양식 html 렌더링 화면 출력 -->

							</div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="formSelectBtn">적용</button>
				</div>
			</div>
		</div>
	</div>


<!-- 결재선 선택 Modal -->
	<div class="modal fade" id="lineModal" tabindex="-1"
		aria-labelledby="formModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="formModalLabel">결재선 지정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<div class="row g-2">
						<div class="col-md-4">
							<input type="text" class="form-control" id="search_input" value="" placeholder="이름 또는 부서 검색" onkeypress="show_name(event)">
						</div>
						<div class="col-md-8">
							<button type="button" id="search_btn" class="btn btn-primary mb-3">선택</button>
						</div>
					</div>

					<div class="row">
						<div class="col-md-5 ms-auto">
						
						<!-- 트리구조 조직도 -->
							<div class="tree_div overflow-scroll">
							<div id="jstree">
							<%-- <ul>
									<!-- 회사 -->
									<li id="root">${rootCompany.name}
                                       <ul>
                                          <!-- 부서 -->
                                          
                                          <!-- 동적으로 생성 -->
                                          
                                           <c:forEach var="department" items="${rootCompany.departments}">
                                             <li class="group" id="group${department.id}">${department.name}
                                                <ul>
                                                   <!-- 직원 -->
                                                   <c:forEach var="staff" items="${department.staffs}">
                                                      <li id="child${staff.staffId}">${staff.staffName}</li>
                                                   </c:forEach>
                                                </ul>
                                             </li>
                                          </c:forEach> 
                                       </ul>
                                    </li>
																	
								</ul>--%>
							</div>
							
							</div>
						</div>
						<div class="col-md-2 ms-auto">
							<div class="btn_group">
								<!-- 버튼 -->
								<div>
									<button type="button" id="line_plus" class="btn btn-primary mb-3">결재 추가<i class="bi bi-caret-right-fill"></i></button>
								</div>
								<div>
									<button type="button" id="ref_plus" class="btn btn-primary mb-3">참조 추가<i class="bi bi-caret-right-fill"></i></button>
								</div>
								
							</div>
						</div>
						<div class="col-md-5 ms-auto">
						  <div class="table_div">
							  	<div class="table_height">
									<table class="table modal_table line_table">
										<thead>
											<tr>
												<th colspan=2>결재자</th>
											</tr>
										</thead>
										<tbody>
											<!-- 동적 테이블 추가 -->	
										</tbody>
									</table>
								</div>	
						  </div>
						  
						  <div class="table_div">
						  	<div class="table_height">
								<table class="table ref_table">
									<thead>
										<tr>
											<th colspan=2>참조자</th>
										</tr>
									</thead>
									<tbody>
										<!-- 동적 테이블 추가 -->	
									</tbody>
								</table>
							</div>
						   </div>
							
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" id="line_complete" class="btn btn-primary">적용</button>
				</div>
			</div>
		</div>
	</div>



	<div class="container-fluid position-relative bg-white d-flex p-0">

		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->


		<!-- @@@ Menu Tab Include @@@ -->
		<jsp:include page="/common_layout/menu_tab.jsp">
			<jsp:param name="menu_tab" value="menu_tab" />
		</jsp:include>
		<!-- @@@@@@@@@@@@@@@@@@@@@@@@ -->

		<!-- Content Start -->
		<div class="content">

			<!-- @@@ Navigation Bar Include @@@ -->
			<jsp:include page="/common_layout/nav_bar.jsp">
				<jsp:param name="nav_bar" value="nav_bar" />
			</jsp:include>
			<!-- @@@@@@@@@@@@@@@@@@@@@@@@ -->



<!-- 본문 작성 (body start) -->

	<!-- 본문 여백 -->
	<div class="container container-fluid pt-4 px-4">

		<!-- 페이지 타이틀 -->
		<div class="mx-4 my-4">
			<h4>기안 작성하기</h4>
			<hr/>
		</div>


		<div class="row g-0">
			<!-- 좌측 : 텍스트필드 부분 -->
			<div class="col-sm-6 col-md-4 justify-content-md-start">

				<div class="mx-4 my-4">
					<h5>양식 및 결재선</h5>
				</div>
				<div class="form_box_hidden mx-4 my-4 px-4 py-4"> <!-- 그레이 박스선 -->

					<!-- 기안일자 -->  
					<div class="mb-3">
						<label for="draftDate" class="form-label">기안일자</label>
						<div class="row g-2 mb-4">
							<div>
								<input type="text" class="form-control" id="draftDate" name="draftDate"
									   aria-label="Disabled input example" disabled>
							</div>
						</div>
					</div>

					<!-- 결재양식 -->
					<div class="mb-3">
						<label for="approvalForm" class="form-label">결재양식</label>
						<div class="row g-2">
							<div class="col-md-9">
								<input type="text" class="form-control" id="approval_form"
									value="" aria-label="Disabled input example" readonly>
							</div>
							<div class="col-md-3">
								<button type="button" id="formModal" class="btn btn-primary mb-3"
									data-bs-toggle="modal" data-bs-target="#formModal">선택</button>
							</div>
						</div>
					</div>

					<!-- 결재선 -->
					<div class="mb-3">
						<label for="approvalLine" class="form-label">결재선</label>
						<div class="row g-2">
							<div class="col-md-9">
								<input type="text" class="form-control" id="approval_line"
									value="" aria-label="Disabled input example" disabled>
							</div>
							<div class="col-md-3">
								<button type="button" class="btn btn-primary mb-3"
									data-bs-toggle="modal" data-bs-target="#lineModal">선택</button>
							</div>
						</div>
					</div>

					<!-- 결재자 -->
					<div class="mb-3">
						<label for="inputTitle" class="form-label">결재자</label>
						<div class="body_table_height">
						<table id="body_line_table" class="table">
							<tbody>
								<tr>
									<td colspan=2>[${departmentName}] ${name} ${rank}</td>
								</tr>
								
								<!-- 동적 테이블 생성 -->
								
							</tbody>
						</table>
						</div>
					</div>

					<!-- 참조자 -->
					<div class="mb-3">
						<label for="inputTitle" class="form-label">참조자</label>
						<div class="body_table_height">
						<table id="body_ref_table" class="table">
							<tbody>
							
								<!-- 동적 테이블 생성 -->
							
							</tbody>
						</table>
						</div>
					</div>


				</div>
				<!-- end 그레이 박스선 -->
			</div>

			<!-- 우측 : 결재내용 본문박스 -->
			<div class="col-sm-6 col-md-8 justify-content-md-start">
				<div class="mx-4 my-4">
					<h5>결재 내용</h5>
				</div>

				<!-- 결재 내용 본문 박스 -->
				<div class="form_box mx-4 my-4 px-4 py-4">

					<form id="writeDraftForm" action="/draft_save" method="post">  <!-- 컨트롤러의 /draft_save 요청 -->
						<!-- 제목 영역 -->
						<div class="mb-3">
							<label for="inputTitle" class="form-label">제목</label>
							<input type="text" class="form-control" id="inputTitle" name="draftTitle">
						</div>		
									
						<!-- SmartEditor2  -->
						<div class="jsx-2303464893 editor">
							<div class="fr-box fr-basic fr-top" role="application">
								<div id="smartEditor_wrapper" class="fr-wrapper show-placeholder" dir="auto">
									<!-- style="overflow: scroll;" 제외 -->
									<textarea name="noticeContent" id="smartEditor" 
											  style="width: 100%; height: 560px;">${htmlContent}</textarea>  <!-- 엑셀 변환 HTML -->
								</div>
							</div>
						</div>
					</form>	

				</div>

			</div>

		</div>

		<!-- 버튼 (form 외부에 위치) -->
		<div class="mx-4 my-4">
			<div class="row g-0">
				<div class="col-sm-6 col-md-6 justify-content-md-start">
					<button class="btn choice_cancel" type="button">취소</button>
				</div>
				<div class="col-6 col-md-6 d-md-flex justify-content-md-end">
					<div d-grid gap-2>
						<button class="btn choice_save me-2" type="button">저장</button>
						<button class="btn choice_send" type="submit">결재상신</button>
					</div>
				</div>
			</div>
		</div>



	</div>
	<!-- end of class = container-->



	<!-- 본문 끝 (body end) -->


			<!-- @@@ Footer Include @@@ -->
			<jsp:include page="../../../common_layout/footer.jsp">
				<jsp:param name="footer" value="footer" />
			</jsp:include>
			<!-- @@@@@@@@@@@@@@@@@@@@@@@@ -->
		</div>
		<!-- Content End -->


		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
	</div>

	<!-- JavaScript Libraries -->
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/template/lib/chart/chart.min.js"></script>
	<script src="/resources/template/lib/easing/easing.min.js"></script>
	<script src="/resources/template/lib/waypoints/waypoints.min.js"></script>
	<script src="/resources/template/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="/resources/template/lib/tempusdominus/js/moment.min.js"></script>
	<script src="/resources/template/lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script src="/resources/template/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>


	<!-- modal Javascript -->
	<script type="text/javascript" src="/resources/approval/js/approvalFormSelect.js"></script>

	<!-- SmartEditor2 라이브러리  -->
	<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

	<!-- Template Javascript -->
	<script src="/resources/template/js/main.js"></script>

	<!-- SmartEditor2 -->
	<script type="text/javascript" src="/resources/template/js/notice-write.js"></script>
		
	<!-- jstree js -->
	<script type="text/javascript" src="/resources/approval/js/jstreeCustom.js"></script>
	
	<script>
		$(function(){
			
			// 페이지 열리면 "기안일자" => 오늘 날짜로 바로 들어가도록 구현 
			window.onload = function(){
				var today = new Date(); 
				var dd = String(today.getDate()).padStart(2,'0');  // padStart => 문자열의 앞부분에 '0'을 채워서 최소 2자리로 만들기 
				var mm = String(today.getMonth()+1).padStart(2,'0');
				var yyyy = today.getFullYear(); 
				today = yyyy + '-' + mm + '-' + dd; 
				
				// "#draftDate" 필드에 오늘 날짜 설정 
				document.getElementById("draftDate").value = today;
				
				// 'draftDate'값을 숨겨진 필드로 추가해서 writeDraftForm에 붙이기 
				const draftDateInput = document.createElement("input");
				draftDateInput.type = "hidden";
				draftDateInput.name = "draftedAt";   // Approval vo와 같게 맞춰줌 
				draftDateInput.value = "today";  // draftDate의 값으로 설정
				document.getElementById("writeDraftForm").appendChild(draftDateInput); // 폼에 숨겨진 필드 추가
				
			}
			
			
			// 양식 선택 모달이 열릴 떄마다 Ajax 요청을 보내 데이터 로드
		 	$('#formModal').on('show.bs.modal', function(e){
		 		$('#formContent').empty();  // 양식 내용 비우기
		 	    $('#approval_form').val('');  // 텍스트 필드 값 초기화
		 	    $('input[type="checkbox"][name="formCheck"]').prop('checked', false);  // 체크박스 초기화
		 	    oEditors.getById["smartEditor"].exec("SET_IR", [""]); // 스마트에디터 내용초기화
		 	    
		 		$.ajax({
		 			url: '/approval/getApprovalForm', // 양식 목록 불러오는 서버API
		 			method: 'GET',  // get 방식으로 요청 
		 			success: function(response){
		 				console.log(response)
		 				var formList = response; // 서버에서 받은 양식 목록
		 				var checkboxContainer=$('#formCheckboxContainer');
		 				checkboxContainer.empty(); // 기존 목록 초기화
		 				
		 				// 받은 양식 목록을 체크박스 형태로 생성
		 				formList.forEach(function(forms){  // forms(각 양식 객체) => 넘어오는 값 적어주기 
		 					
		 					let checkboxHtml = $('<div/>', {
							    class: 'mx-3 mt-2 mb-2 form_ch_name',
							    html: $('<input/>', {
							        class: 'form-check-input me-2',
							        type: 'checkbox',
							        name: 'formCheck',
							        value: forms.id,
							        id: 'flexCheckChecked-' + forms.id, 'data-html': forms.formContent
							    }).prop('outerHTML') + '<span>' + forms.title + '</span>'
							});
		 					
	                    checkboxContainer.append(checkboxHtml);
	                    
 		 				});			
		 			},
		 			error: function(xhr, status, error){
		 				console.log('AJAX 요청 실패:', error);  // 오류 메시지 출력
		 		        alert('양식 목록을 불러오는 데 실패했습니다.');
		 			}
		 		});
		 		
		 		
				 // 양식 선택 체크박스 중복 적용 안 되도록
				$(document).on('change', 'input[type="checkbox"][name="formCheck"]', function() {
				    // 현재 체크된 상태가 아니면 다른 모든 체크박스 선택 해제
				    if ($(this).prop('checked')) {
					        // 다른 체크박스 선택 해제
					        $('input[type="checkbox"][name="formCheck"]').prop('checked', false);
					        // 현재 클릭된 체크박스만 체크
					        $(this).prop('checked', true);
				    } else {
					        // 현재 체크박스가 해제되면 아무것도 선택되지 않도록
					        $(this).prop('checked', false);
				    }
				});
				
				// 체크박스 선택했을 때 HTML을 렌더링 
				$(document).on('change', 'input[type="checkbox"][name="formCheck"]', function(){
					var selectedForms = $('input[type="checkbox"][name="formCheck"]:checked');
					
					selectedForms.each(function(){
						// 기존 HTML을 지우고, 새로 선택된 양식만 렌더링
				        $('#formContent').empty(); 
						var html = $(this).data('html'); // 선택된 체크박스에 저장된 양식 HTML (data-html)
						$('#formContent').append(html); // 새로운 양식만 추가 
						console.log(html)
						
					})
					
					//선택된 양식이 없다면 기본 메시지 출력
					if(selectedForms.length === 0){
						$('#formContent').html('<div>양식을 선택하세요.</div>')
					}
							
					
					
					// 양식 선택 모달창에서 '적용' 버튼 클릭시, 본문 스마트에디터에 양식 삽입 
				    $('#formSelectBtn').off('click').on('click', function(){
				    	
						 if (typeof oEditors !== 'undefined' && oEditors.getById["smartEditor"]) {
			            	console.log("smartEditor 객체 있음");
			            	var htmlContent = $('#formContent').html();
				            console.log("htmlContent==> " + htmlContent); // HTML 내용이 제대로 출력되는지 확인
				           
			                oEditors.getById["smartEditor"].exec("PASTE_HTML", [htmlContent]); // 스마트에디터에 HTML 데이터를 업데이트
			          
			            } else {
			                console.log("스마트에디터가 준비되지 않았습니다.");
			            }
				 		
				 	// 모달창 닫기 
						$('#formModal').modal('hide');
						
						// 텍스트 필드 값 초기화 
						var textField = $('#approval_form');
						textField.val('');
						
						// 텍스트 필드에 선택된 양식 이름 표시
				        var selectedTitle = selectedForms.next('span').text(); // 체크박스 옆에 있는 span의 텍스트
				        textField.val(selectedTitle || ''); // 선택된 양식 이름 없으면 빈 값 설정	
				     
						
					})//   #formSelectBtn 클릭 end
					
					
				})  // 체크박스 선택했을 때 end
			 			
				
		 	});  // 양식선택 모달 end
			
			
		 	
			
		 	// 결재선 선택 모달이 열릴 떄마다 Ajax 요청을 보내 데이터 로드
		 	$('#lineModal').on('show.bs.modal', function(e){
		 		
		 		$.ajax({
		 			url: '/approval/company/tree', // 양식 목록 불러오는 서버API
		 			method: 'GET',  // get 방식으로 요청 
		 			success: function(response){
		 				console.log(response);
		 				
		 			   // jstree 파괴 및 초기화
		 	            if ($.jstree.reference('#jstree')) {
		 	                $('#jstree').jstree('destroy').empty();
		 	            }
		 				
		 				var rootCompany = response; // 서버에서 받은 사원 목록 데이터
		 			
		 				
		 				// #jstree감싸고 있는 <ul> 생성
		 				let jstreeWrapper = $('<ul/>');
		 				
		 				// 루트 회사 정보 
		 				let rootHtml = $('<li/>', {
		 					id:'root',
		 					text:rootCompany.name
		 				})
		 				
		 				// 부서 목록 생성 (부서들을 감싸는 <ul>)
		 				let departmentsHtml = $('<ul/>');
		 				
		 				rootCompany.departments.forEach(function(department){
		 					// 각 부서를 위한 <li> 요소 생성	
		 					let departmentHtml = $('<li/>', {
		 						class:'group',
		 						id: 'group'+department.id,
		 						html: department.name // 부서 이름 설정 
		 					});	
		 					
		 					// 부서 내부의 <ul> 생성 
		 					let staffListHtml = $('<ul/>');
		 					
		 					//부서에 속한 직원들 순회 
		 					department.staffs.forEach(function(staff){
		 						// 각 직원을 위한 <li/> 요소 생성
		 						let staffHtml=$('<li/>', {
		 							id:'child'+staff.staffId,
		 							text:staff.staffName + ' ' +staff.rank // 직원 이름, 직책 설정
		 						});
		 					// 직원<li> 요소를 <ul>에 추가 
		 						staffListHtml.append(staffHtml);
		 					});
		 					
		 					// <ul>을 부서의 내부 <li>에 추가 
		 					departmentHtml.append(staffListHtml);
		 					
		 					// 부서<li> 요소를 부서 목록 <ul>에 추가 
		 					departmentsHtml.append(departmentHtml); 
		 					
		 				});
		 				
			 				// 루트 회사의 부서 목록을 <ul>로 감싸고 <li>에 추가
		 	            	rootHtml.append(departmentsHtml);

		 	    	       // 전체 회사 및 부서 트리를 #jstree에 추가
		 	         	  jstreeWrapper.append(rootHtml);
		 	           
		 	     	 	   // 트리 구조를 #jstree에 삽입
		 	          	   $('#jstree').append(jstreeWrapper);
		 	          	
		 	          	// jstree 초기화
		 	              $('#jstree').jstree({
		 	                  'plugins': ['checkbox', 'search'],
		 	                  'checkbox': {
		 	                      'three_state': false
		 	                  }
		 	              }).jstree('open_all');
		 	     	 	   
			 			},
			 			error: function(xhr, status, error){
			 				console.log('AJAX 요청 실패:', error);  // 오류 메시지 출력
			 		        alert('사원목록을 불러오는 데 실패했습니다.');
			 			}
			 		});  // $ . ajax end
			
		 		}) // #lineModal end
		 	
		 	

			
			// '적용' 버튼 클릭 시 '결재자' mainTable에 데이터 추가
			   $('#line_complete').click(function() {
			       // 모달에서 추가된 행들을 가져오기
			       $('.line_table tbody tr').each(function() {
			           // 행의 데이터를 가져옴
			           var name = $(this).find('td').eq(0).text();
			           // var position = $(this).find('td').eq(1).text();
			
			           // 새로운 행을 mainTable에 추가
			           var newRow = '<tr><td>' + name + '</td><td>' + '<div><button type="button" class="btn-close" aria-label="Close"></button></div>' + '</td></tr>';
			           $('#body_line_table tbody').append(newRow);
			       });
			
			       // 모달 닫기
			       $('#lineModal').modal('hide');
			
			       // 모달 내용 비우기
			       $('.line_table tbody').empty();
			       
			    // 추가된 버튼에 클릭 이벤트를 바인딩
				    $('.btn-close').click(function() {
				        // 클릭된 버튼이 속한 행을 삭제
				        $(this).closest('tr').remove(); 
				    });
			       
			   });

			// '적용' 버튼 클릭 시 '참조자' mainTable에 데이터 추가
			   $('#line_complete').click(function() {
			       // 모달에서 추가된 행들을 가져오기
			       $('.ref_table tbody tr').each(function() {
			           // 행의 데이터를 가져옴
			           var name = $(this).find('td').eq(0).text();
			           // var position = $(this).find('td').eq(1).text();
			
			           // 새로운 행을 mainTable에 추가
			           var newRow = '<tr><td>' + name + '</td><td>' + '<div><button type="button" class="btn-close" aria-label="Close"></button></div>' + '</td></tr>';
			           $('#body_ref_table tbody').append(newRow);
			       });
			
			       // 모달 닫기
			       $('#lineModal').modal('hide');
			
			       // 모달 내용 비우기
			       $('.ref_table tbody').empty();
			       
			    // 추가된 버튼에 클릭 이벤트를 바인딩
				    $('.btn-close').click(function() {
				        // 클릭된 버튼이 속한 행을 삭제
				        $(this).closest('tr').remove(); 
				    });
			       
			   });
			
			  
			// writeDraftForm 폼에 submit 이벤트가 일어날 때, 
			document.getElementById("writeDraftForm").addEventListener("submit", function(event){
				
				// 결재선, 참조선 동적테이블 담아서 데이터 추출 
				const allApprovalLines = [];
			    const tableIds = ["body_line_table", "body_ref_table"]; // 여러 테이블 ID

			    tableIds.forEach(tableId => {
			        const approvalLines = extractApprovalLines(tableId);
			        allApprovalLines.push(...approvalLines); // 결과를 통합
			    });
				
			 	// 결과 확인
			    console.log(allApprovalLines);
			 	    
				
				// 결재라인 _ 숨겨진 필드로 추가 
				const LinesHiddenInput = document.createElement("input");
				LinesHiddenInput.type = "hidden";
				LinesHiddenInput.name = "approvalLines";
				LinesHiddenInput.value = JSON.stringify(approvalLines); // JSON 형태로 변환
				this.appendChild(LinesHiddenInput); // "writeDraftForm" 폼에 숨겨진 폼 붙이기 
				
				
				
				// 결재양식 input 박스 _ 숨겨진 필드로 추가 
				const formInput = document.querySelector("#approval_form"); // "#approval_form"값 가져오기 
				if(formInput){
					const hiddenInput = document.createElement("input");
					hiddenInput.type = "hidden";
					hiddenInput.name = "approval_form";  // input의 id를 name으로 설정
					hiddenInput.value = "formInput.value"; // input의 값
					this.appendChild(hiddenInput); 
				}
				
					
			});
			
			// 본문 결재선, 참조선 동적 테이블의 데이터를 수집,  "[부서] 유재석 부장" => 이 구조에서 내용 추출  
			function extractApprovalLines(tableId){
				
				const approvalLines = []; 
				document.querySelectorAll(`#${tableId} tbody tr`).forEach(row => {
					const fullText = row.querySelector("td:nth-child(1)").innerText.trim(); // 전체 텍스트
				    const matches = fullText.match(/\[([^\]]+)\]\s+(.+)\s+(.+)/); // 정규식으로 부서, 이름, 직책 추출
				    
				    if(matches){
				    	const department = matches[1]; // [부서]
				    	const name = matches[2];  // 유재석
				    	const rank = matches[3]; // 부장 
				  		
				    	approvalLines.push({
				    		departmentName,  // List<StaffInfo> 클래스 필드 이름과 동일하게 해야함  
				    		name,
				    		rank
				    	});
				    } 
				   
				});
				return approvalLines; 
				
			}
			
			
			
			
			
			
			
			
			
			
			// 결재 상신 버튼 클릭시 실행될 함수 
 			$('.choice_send').click(function(){
			    // SmartEditor에서 textarea에 내용 업데이트
			    oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []); // 이 명령이 `textarea`의 값을 업데이트함
				
			    var htmlContent = document.getElementsByName("noticeContent")[0].value;
			    // console.log(htmlContent);  // 콘솔에서 HTML 값 확인
			    
				// 폼 제출 (textarea 값은 자동으로 폼에 포함됨)
			    $('#writeDraftForm').submit(); // form 제출 (action 요청 실행)
			}) 
			
			// 취소 버튼 클릭시 페이지 리로드  
			$('.choice_cancel').click(function(){
				// 페이지 새로고침
				location.reload();  	
			})
			
			
		})
	</script>


</body>

</html>
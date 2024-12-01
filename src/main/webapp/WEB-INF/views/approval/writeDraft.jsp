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
		border: 1px solid #ccc;
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
	
	.frame_div {
		text-align: center;
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

						<div class="col-md-4 ms-auto ps-5">
							<p class="mt-4 mb-4 form_subtitle">결재 양식 선택</p>
							<div class="mx-3 mt-2 mb-2 form_ch_name">
								<input class="form-check-input me-2" type="checkbox" name="formCheck" value="1" 
								    id="flexCheckChecked"> 
								<span>기안서</span>
							</div>
							<div class="mx-3 mt-2 mb-2 form_ch_name">
								<input class="form-check-input me-2" type="checkbox" name="formCheck" value="2"
									id="flexCheckChecked"> <span>지출결의서</span>
							</div>
							<div class="mx-3 mt-2 mb-2 form_ch_name">
								<input class="form-check-input me-2" type="checkbox" name="formCheck" value="3"
									id="flexCheckChecked"> <span>품의서</span>
							</div>
							<div class="mx-3 mt-2 mb-2 form_ch_name">
								<input class="form-check-input me-2" type="checkbox" name="formCheck" value="4"
									id="flexCheckChecked"> <span>출장보고서</span>
							</div>
							<div class="mx-3 mt-2 mb-2 form_ch_name">
								<input class="form-check-input me-2" type="checkbox" name="formCheck" value="5"
									id="flexCheckChecked"> <span>사직서</span>
							</div>
						</div>
						<div class="col-md-8 ms-auto frame_div">
							<div>
								<!-- 툴바 숨기기 : 확장자명 뒤에 #toolbar=0&navpanes=0&scrollbar=0 추가 -->
								<iframe
									src="/resources/approval/img/sample.pdf#toolbar=0&navpanes=0&scrollbar=0"></iframe>
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
								<ul>
									<li id="root">무한상사
										<ul>
											<li class="group" id="groupA">대표이사
												<ul>
													<li id="child1">유재석</li>
												</ul>
											</li>
											<li class="group" id="groupB">경영지원부
												<ul>
													<li id="child2">홍진경 사원</li>
													<li id="child3">남창희 사원</li>
													<li id="child4">조세호 대리</li>
													<li id="child5">이동욱 과장</li>
													<li id="child6">황정민 부장</li>
													
												</ul>
											</li>
											<li class="group" id="groupC">디자인부
												<ul>
													<li id="child7">양세찬 사원</li>
													<li id="child8">이광수 사원</li>
													<li id="child9">지예은 사원</li>
													<li id="child10">송지효 대리</li>
													<li id="child11">김종국 과장</li>
													<li id="child12">지석진 부장</li>
												</ul>
											</li>
											<li class="group" id="groupD">영업부 
												<ul>
													<li id="child13">하동훈 사원</li>
													<li id="child14">노홍철 사원</li>
													<li id="child15">정형돈 대리</li>
													<li id="child16">정준하 과장</li>
													<li id="child17">박명수 부장</li>
												</ul>
											</li>
										</ul>
									</li>
								</ul>
							</div>
							
							</div>
						</div>
						<div class="col-md-2 ms-auto">
							<div class="btn_group">
								<!-- 버튼 -->
								<div>
									<button type="button" id="linePlus" class="btn btn-primary mb-3">결재 추가<i class="bi bi-caret-right-fill"></i></button>
								</div>
								<div>
									<button type="button" id="refPlus" class="btn btn-primary mb-3">참조 추가<i class="bi bi-caret-right-fill"></i></button>
								</div>
								
							</div>
						</div>
						<div class="col-md-5 ms-auto">
						  <div class="table_div">
							<table class="table modal_table">
								<thead>
									<tr>
										<th colspan=2>결재자</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="first_cell">[디자인팀] 지석진 과장</td>
										<td>
											<div>
												<button type="button" class="btn-close" aria-label="Close"></button>
											</div>
										</td>
									</tr>
									<tr>
										<td class="first_cell">[디자인팀] 지석진 과장</td>
										<td>
											<div>
												<button type="button" class="btn-close" aria-label="Close"></button>
											</div>
										</td>
									</tr>	
								</tbody>
							</table>
						  </div>
						  
						  <div class="table_div">
							<table class="table">
								<thead>
									<tr>
										<th colspan=2>참조자</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="first_cell">[디자인팀] 지석진 과장</td>
										<td>
											<div>
												<button type="button" class="btn-close" aria-label="Close"></button>
											</div>
										</td>
									</tr>
									<tr>
										<td class="first_cell">[디자인팀] 지석진 과장</td>
										<td>
											<div>
												<button type="button" class="btn-close" aria-label="Close"></button>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						   </div>
							
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary">적용</button>
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
				<div class="form_box_hidden mx-4 my-4 px-4 py-4">
					<!-- 그레이 박스선 -->

					<!-- 기안일자 -->  
					<div class="mb-3">
						<label for="draftDate" class="form-label">기안일자</label>
						<div class="row g-2 mb-4">
							<div>
								<input type="text" class="form-control" id="draftDate"
									value="sysdate" aria-label="Disabled input example" disabled>
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
								<button type="button" class="btn btn-primary mb-3"
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
						<table class="table">
							<tbody>
								<tr>
									<td colspan=2>[디자인팀] 양세찬 사원</td>
								</tr>
								<tr>
									<td class="first_cell">[디자인팀] 지석진 과장</td>
									<td>
										<div>
											<button type="button" class="btn-close" aria-label="Close"></button>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<!-- 참조자 -->
					<div class="mb-3">
						<label for="inputTitle" class="form-label">참조자</label>
						<table class="table">
							<tbody>
								<td class="first_cell">[경영지원부] 조세호 대리</td>
								<td>
									<div>
										<button type="button" class="btn-close" aria-label="Close"></button>
									</div>
								</td>
								<tr>
									<td class="first_cell">[디자인팀] 송지효 대리</td>
									<td>
										<div>
											<button type="button" class="btn-close" aria-label="Close"></button>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
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

					<form id="writeDraftForm" action="/save" method="post">
						<!-- 제목 영역 -->
						<div class="mb-3">
							<label for="inputTitle" class="form-label">제목</label>
							<input type="text" class="form-control" id="inputTitle" name="draftTitle">
						</div>		
									
						<!-- SmartEditor2  -->
						<div class="jsx-2303464893 editor">
							<div class="fr-box fr-basic fr-top" role="application">
								<div class="fr-wrapper show-placeholder" dir="auto">
									<!-- style="overflow: scroll;" 제외 -->
									<textarea name="notice_content" id="smartEditor" 
											  style="width: 100%; height: 412px;">${htmlContent}</textarea>  <!-- 엑셀 변환 HTML -->
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
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
	</div>

	<!-- JavaScript Libraries -->
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/template/lib/chart/chart.min.js"></script>
	<script src="/resources/template/lib/easing/easing.min.js"></script>
	<script src="/resources/template/lib/waypoints/waypoints.min.js"></script>
	<script src="/resources/template/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="/resources/template/lib/tempusdominus/js/moment.min.js"></script>
	<script
		src="/resources/template/lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script
		src="/resources/template/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>


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
			
			// 양식 선택 체크박스 중복 적용 안 되도록  
			$('input[type="checkbox"][name="formCheck"]').click(function(){
				if($(this).prop('checked')){
					$('input[type="checkbox"][name="formCheck"]').prop('checked', false);
					$(this).prop('checked', true);
				}
			})
			
			// 양식 선택 모달창에서 양식 선택 후 '적용' 버튼 클릭시 
			$('#formSelectBtn').click(function(){
				// 모달창 닫기 
				$('#formModal').modal('hide');
				// 텍스트 필드 값 초기화 
				var textField = $('#approval_form');
				textField.val('');
				
				// input 옆에 있는 span의 값(양식 이름 text)을 spanTxt 변수에 저장 후 텍스트필드의 값으로 해당 값 출력 
				var spanTxt = $('.form_ch_name input[name="formCheck"]:checked').next('span').text(); 
				textField.val(spanTxt);
					
			})
			
			
			
			
			// 결재 상신 버튼 클릭시 실행될 함수 
			$('.choice_send').click(function(){
			    // SmartEditor에서 textarea에 내용 업데이트
			    oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []); // 이 명령이 `textarea`의 값을 업데이트함
				
			    var htmlContent = document.getElementsByName("notice_content")[0].value;
			    console.log(htmlContent);  // 콘솔에서 HTML 값 확인
			    
				// 폼 제출 (textarea 값은 자동으로 폼에 포함됨)
			    $('#writeDraftForm').submit(); // form 제출 
			})
			
			
			
		})
	</script>


</body>

</html>
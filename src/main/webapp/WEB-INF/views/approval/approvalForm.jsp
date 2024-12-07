<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>결재 양식 관리</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link
	href="=/resources/template/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="/resources/template/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="/resources/template/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/resources/template/css/style.css" rel="stylesheet">

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
	height: 78%;
}

table {
	text-align: center;
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
	width: 20%;
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

.choice_del {
	border: 1px solid #14A4FF;
	background-color: #fff;
	color: #14A4FF;
	font-weight: 500;
}

.choice_plus {
	border: 1px solid #14A4FF;
	background-color: #14A4FF;
	color: #fff;
	font-weight: 500;
}

.btn:hover {
	color: #00539d;
}

table tr:hover {
  cursor: pointer;
}

</style>

</head>

<body>
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
		<jsp:include page="../../../common_layout/menu_tab.jsp">
			<jsp:param name="menu_tab" value="menu_tab" />
		</jsp:include>
		<!-- @@@@@@@@@@@@@@@@@@@@@@@@ -->

		<!-- Content Start -->
		<div class="content">

			<!-- @@@ Navigation Bar Include @@@ -->
			<jsp:include page="../../../common_layout/nav_bar.jsp">
				<jsp:param name="nav_bar" value="nav_bar" />
			</jsp:include>
			<!-- @@@@@@@@@@@@@@@@@@@@@@@@ -->


			<!-- 본문 작성 (body start) -->

			<!-- 본문 여백 -->
			<div class="container container-fluid pt-4 px-4">

				<div class="mx-4 my-4">
					<h4>결재 양식 관리</h4>
				</div>



				<!-- 네비바 -->

				<div class="mx-4 my-4">
					<div class="row g-0">
						<div class="col-sm-6 col-md-4">
							<ul class="nav nav-pills nav-fill">
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/approval/approvalForm">전체</a></li>
								<li class="nav-item"><a class="nav-link" href="/approval/approvalForm?documentType=기안 문서">기안 문서</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="/approval/approvalForm?documentType=인사 문서"">인사 문서</a>
								</li>
							</ul>
						</div>
						<div class="col-6 col-md-2"></div>
						
						<!-- 검색 도구 start -->

						<div class="col-6 col-md-6 d-flex justify-content-end">
							<form action="/approval/approvalForm" method="GET" class="d-flex align-items-center">
								<!-- 이전 검색 도구의 값을 유지 -->
								<div class="d-flex align-items-center g-2">
									<select class="form-select me-2 w-auto" name="searchOption"
										id="searchOption">
										<option selected>선택</option>
										<option value="title"
											${"title".equals(searchOption) ? "selected" : ""}>양식명</option>
										<option value="staffId"
											${"staffId".equals(searchOption) ? "selected" : ""}>작성자</option>
									</select>

									<input class="form-control me-2 w-auto" type="search"
										value="${searchKeyword != null ? searchKeyword : ''}"
										name="searchKeyword" id="searchKeyword" placeholder="Search">


									<button type="submit" id="searchButton"
										class="btn btn-primary w-100">검색</button>

								</div>
							</form>
						</div>

						<!-- 검색 도구 end -->
					
					</div>
				</div>



				<!-- 테이블 시작 -->
				<div class="mx-4 my-4">
					<table class="table table-hover">
						<tr>
							<th class="table-light">
								<div class="form-check">
									<input class="form-check-input all_check" type="checkbox" value="" id="flexCheckChecked">
								</div>
							</th>
							<th class="table-light">번호</th>
							<th class="table-light">결재 양식명</th>
							<th class="table-light">작성자</th>
							<th class="table-light">작성일</th>
							<th class="table-light">구분</th>
						</tr>
						<c:forEach items="${formList}" var="forms">
							<tr id="select_tr" data-id="${forms.id}">
								<td>  <!-- 체크박스에 양식 ID를 value로 설정 -->
									<div class="form-check">
										<input class="form-check-input each_check" type="checkbox" value="${forms.id}" id="flexCheckChecked">
									</div>
								</td>
								<td>${forms.id}</td>
								<td>${forms.title}</td>
								<td>${forms.name}</td>
								<td>${forms.createdAt}</td>
								<%-- <td><span class="badge bg-warning">${forms.document_type}</span></td> --%>
								<td><span class="badge <c:choose>
										            <c:when test="${forms.documentType == '기안 문서'}">bg-warning</c:when>
										            <c:when test="${forms.documentType == '인사 문서'}">bg-success</c:when>
										            <c:otherwise>bg-danger</c:otherwise>
												   </c:choose>">${forms.documentType}</span></td>
							</tr>
						</c:forEach>


					</table>
				</div>

        <!-- pagination start -->
        <div class="d-flex align-items-center justify-content-center">
            <nav aria-label="Page navigation">
                <ul class="pagination pt-3 pr-3">
                    <!-- 현재 페이지가 1페이지일 경우 "이전" 버튼 없음 -->
                    <c:if test="${pageNum != 1}">
                        <li class="page-item"><a class="page-link"
                                                 href="/approval/approvalForm?searchOption=${searchOption}&searchKeyword=${searchKeyword}&pageNum=${pageNum-1}">이전</a>
                        </li>
                    </c:if>

                    <!-- pageNum-2가 0보다 작으면 1로 설정 -->
                    <!-- 파라미터 pageNum을 받아와서 로컬 pageNum으로 만들기 -->
                    <c:set var="pageNum"
                           value="${param.pageNum != null ? param.pageNum : 1 }"/>

                    <!-- pageNum-2가 1보다 작으면 1로 설정 -->
                    <!-- begin 선언 -->
                    <c:set var="begin" value="${pageNum-2}"/>
                    <c:if test="${begin<1 }">
                        <c:set var="begin" value="1"/>
                    </c:if>

                    <!-- pageNum이 총 페이지 수를 넘지 않도록 설정 -->
                    <c:set var="end" value="${pageNum + 2}"/>
                    <c:if test="${end > totalPage}">
                        <c:set var="end" value="${totalPage}"/>
                    </c:if>

                    <!-- 페이지 번호 출력 -->
                    <c:forEach var="i" begin="${begin}" end="${end}" step="1">
                        <li class="page-item ${i == pageNum ? 'active' : ''}"><a
                                class="page-link"
                                href="/approval/approvalForm?searchOption=${searchOption}&searchKeyword=${searchKeyword}&pageNum=${i}">${i}</a>
                        </li>
                    </c:forEach>

                    <!-- 현재 페이지가 마지막 페이지일 경우 "다음" 버튼 없음 -->
                    <c:if test="${pageNum != totalPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="/approval/approvalForm?searchOption=${searchOption}&searchKeyword=${searchKeyword}&pageNum=${pageNum+1}">다음</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
        <!-- pagination end -->

				<!-- 버튼 -->
				<div class="d-grid gap-2 d-md-flex justify-content-md-end mx-4 mt-3 mb-5">
					<button class="btn choice_del" type="button">선택 삭제</button>
					<button class="btn choice_plus" type="button">+ 새 양식 만들기</button>
				</div>


			</div>
			<!-- end of class = container-fluid -->







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
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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

	<!-- Template Javascript -->
	<script src="/resources/template/js/main.js"></script>

	<script>
		// '새 양식 만들기' 버튼 클릭시 
		$('.choice_plus').click(function() {
			// '새 양식 만들기' 페이지로 이동
			window.location.href = '/approval/approvalForm/CreateForm';
		})
		
		// 전체 선택 클릭시 전체 선택 및 해제  
			$('.all_check').click(function(){
				if($(this).prop('checked')){
					$('.form-check-input').prop('checked', true);
				}else{
					$('.form-check-input').prop('checked', false);
				}
			})
			
			// 양식 선택 체크박스 중복 적용 안 되도록  
			$('.each_check').click(function(){
				if($(this).prop('checked')){
					$(this).prop('checked', true);
				}else{
					$(this).prop('checked', false);
				}
				
			})
			
			// 선택 삭제 버튼 클릭시 
			$('.choice_del').click(function(){
				var selectedIds = []; 
				
				// 선택된 체크박스의 id를 selectedIds 배열에 저장 
				$('.each_check:checked').each(function(){
					selectedIds.push($(this).val());  // 체크한 행의 양식 id값	
				});
				
				console.log(selectedIds); // 최종 선택된 id들이 출력
				
				// 선택된 id가 하나라도 있으면 삭제 요청 
				if(selectedIds.length > 0){
					// 선택된 문서 ID들을 서버로 전송 
					$.ajax({
						url: '/approval/approvalForm', // 삭제 요청을 받을 서버의 URL
						type: 'POST',
						contentType: 'application/json',  // json 형식으로 데이터 전송 
						data:JSON.stringify({
							formIds:selectedIds // selectedIds 배열을 JSON 문자열로 변환
						}),
						success:function(response){
							alert('선택한 양식이 삭제되었습니다.');
							location.reload();
						},
						error:function(xhr, status, error){
							alert('삭제 실패하였습니다. 다시 시도해주세요.');
							console.error('Error:', xhr.responseText);
						}
					});
					
				}else{
					alert('삭제할 양식을 선택해주세요.');
				}
				
			})
			
			
			// 체크박스 클릭시 행 클릭 이벤트 막기 
			$(document).on('click', 'input[type="checkbox"]', function(event){
				event.stopPropagation(); // 체크박스를 클릭하면 이벤트가 전파되지 않도록 막음
			})
			
			
			// 행 선택시 상세 화면(완료화면)으로 전환 
			$(document).on('click', '#select_tr', function(){
				var id = $(this).data('id');  // 클릭한 행의 data-id 값을 가져옴 
				console.log(id);
				// 해당 trId를 가지고 상세화면으로 이동 
				window.location.href = '/approval/approvalForm/detail?formId=' + id;  // trId를 쿼리 파라미터로 전달 
			})
			
		
		
	</script>

</body>

</html>
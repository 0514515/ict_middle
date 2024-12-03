<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>DASHMIN - Bootstrap Admin Template</title>
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
						<div class="col-sm-6 col-md-3">
							<ul class="nav nav-pills nav-fill">
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="#">전체</a></li>
								<li class="nav-item"><a class="nav-link" href="#">기안 문서</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">인사 문서</a>
								</li>
							</ul>
						</div>
						<div class="col-6 col-md-9 search_form">
							<select class="form-select" aria-label="Default select example">
								<option selected>선택</option>
								<option value="1">양식명으로 검색</option>
								<option value="2">내용으로 검색</option>
								<option value="3">양식명+내용으로 검색</option>
							</select>
							<form>
								<input class="form-control border-0" type="search"
									placeholder="Search">
							</form>
						</div>
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
							<tr>
								<td>
									<div class="form-check">
										<input class="form-check-input each_check" type="checkbox" value="" id="flexCheckChecked">
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

				<!-- 페이징 버튼 -->
				<div class="d-flex align-items-center justify-content-center">
					<nav aria-label="Page navigation">
						<ul class="pagination pt-3 pr-3">
							<li class="page-item"><a class="page-link" href="#">이전</a></li>
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">다음</a></li>
						</ul>
					</nav>
				</div>

				<!-- 버튼 -->
				<div class="d-grid gap-2 d-md-flex justify-content-md-end mx-4 my-4">
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
		
	</script>

</body>

</html>
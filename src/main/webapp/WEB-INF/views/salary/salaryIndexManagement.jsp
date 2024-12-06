<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>기본급 항목 관리 : 피플윙</title>
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
	href="/resources/template/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="/resources/template/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="/resources/template/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/resources/template/css/style.css" rel="stylesheet">

<!-- 커스텀 스타일 -->
<style>
body {
	font-family: "Noto Sans KR", sans-serif;
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

/*뱃지 컬러 : 반려*/
.bg-danger {
	background-color: #F8D7DA !important;
	color: #58151C;
}

/*뱃지 컬러 : 진행중*/
.bg-success {
	background-color: #D1E7DD !important;
	color: #0A3622;
}
/*뱃지 컬러 : 결재 대기*/
.bg-warning {
	background-color: #FFF3CD !important;
	color: #664D03;
}
/*뱃지 컬러 : 승인 완료*/
.bg-info {
	background-color: #CFF4FC !important;
	color: #055160;
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
			<div class="container container-fluid pt-4 px-4">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<h4>기본급 항목 관리</h4>
				</div>
				<div class="col">
					<div class="bg-white rounded p-4">

						<div class="row">
							<div class="col mb-3">
								<div class="bg-light rounded p-4">
									<h5 class="mb-4 text-center">기본급 목록</h5>
									<div class="table-responsive" style="height: 550px">
										<table class="table table-hover">
											<thead>
												<tr>
													<th scope="col">기본급 번호</th>
													<th scope="col">기본급 이름</th>
													<th scope="col">금액 액수</th>
												</tr>
											</thead>
											<tbody id="tableBody">
												<c:forEach var="salary" items="${salaryList}">
													<tr>
														<td id="salaryId">${salary.id}</td>
														<td id="salaryName">${salary.name}</td>
														<td id="amount">${salary.amount}</td>
														<input id="companyId" type="hidden" value="${salary.companyId}">
													</tr>

												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="bg-light rounded p-4 mb-2 justify-content-center">
									<h5 class="mb-4 text-center">기본급 추가 / 편집</h5>
									<div class="row mb-3">
										<label for="name"
											class="col-sm-3 col-form-label fw-bold">이름</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" id="nameInput">
										</div>
									</div>
									<div class="row mb-3">
										<label for="amount"
											class="col-sm-3 col-form-label fw-bold">금액 액수</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" id="amountInput">
										</div>
									</div>

									<div class="d-flex align-items-center justify-content-between">
										<div class="form-check">
											<input type="checkbox" class="form-check-input"
												id="checked"> <label class="form-check-label"
												for="checked">신규 추가</label>
												
												
										</div>
										<span
												class="form-check-label" id="idLabel">선택 번호 : 없음</span>
									</div>

									<div class="row">
										<div class="d-flex rounded h-100 mx-1 justify-content-center">

											<div class="d-flex justify-content-center h-50 w-25">
												<button type="button" id="saveButton"
													class="btn btn-primary w-75 text-nowrap">저장</button>
											</div>

											<div class="d-flex justify-content-center h-50 w-25">
												<button type="button" id="deleteButton"
													class="btn btn-outline-primary  w-75 text-nowrap">삭제</button>
											</div>

										</div>
									</div>
								</div>



								<div class="row">
									<div class="col">
										<div class="bg-light rounded p-4 mt-2 justify-content-center">
											<h5 class="mb-4 text-center">선택 기본급 사원 목록</h5>
											<div class="table-responsive" style="height: 260px">
												<table  class="table table-hover">
													<thead>
														<tr>
															<th scope="col">부서명</th>
															<th scope="col">사원 이름</th>
															<th scope="col">기본급 이름</th>
															<th scope="col">금액</th>
														</tr>
													</thead>
													<tbody id="staffTableBody">
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- 본문 끝 (body end) -->


				<!-- @@@ Footer Include @@@ -->
				<jsp:include page="/common_layout/footer.jsp">
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
		<script src="/resources/salary/js/salaryIndexManagement.js"></script>
</body>

</html>
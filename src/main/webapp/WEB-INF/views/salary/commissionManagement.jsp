<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>수당 관리 : 피플윙</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />

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
					<h4>수당 관리</h4>
				</div>
				<div class="col">
					<div class="bg-white rounded p-4">
						<div class="row">

							<div class="col">
								<div class="row">
									<div class="col">
										<div class="bg-light rounded p-4">
											<h5 class="mb-4 text-center">수당 목록</h5>
											<div class="table-responsive" style="height: 550px">
												<table class="table table-hover">
													<thead>
														<tr class="align-middle">
															<th scope="col"><input type="checkbox"
																class="form-check-input" id="allCheck"></th>
															<th scope="col">추가수당 이름</th>
															<th scope="col">기본 액수</th>
														</tr>
													</thead>
													<tbody id="commissionListBody">
														<c:forEach var="commission" items="${commissionList}">

															<tr class="align-middle">
																<input type="hidden" value="${commission.id}"
																	id="commissionId" name="commissionId">
																<th><input type="checkbox" class="form-check-input"
																	id="checked"></th>
																<td>${commission.name}</td>
																<td class="w-50"><input class="form-control"
																	type="text" id="defaultAmount" name="defaultAmount"
																	value="${commission.defaultAmount}"></td>
																<input type="hidden" value="${commission.companyId}"
																	id="companyId">
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="row mb-3">
									<div class="d-flex rounded h-100 mt-3 justify-content-center">
										<div class="d-flex px-1 justify-content-end h-50">
											<button type="button" class="btn btn-primary text-nowrap"
												id="commissionAddButton">추가</button>
										</div>
										<div class="d-flex px-1 justify-content-end h-50">
											<button type="button" class="btn btn-primary text-nowrap"
												id="commissionModifyButton">선택 변경 사항 저장</button>
										</div>

									</div>
								</div>

								<!-- 추가 버튼 모달 -->
								<div class="modal fade" id="addAllowanceModal" tabindex="-1"
									aria-labelledby="addAllowanceModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="addAllowanceModalLabel">추가
													수당 입력</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<form id="addAllowanceForm">
													<div class="mb-3">
														<label for="allowanceName" class="form-label">추가
															수당 이름</label> <input type="text" class="form-control"
															id="allowanceName" placeholder="수당 이름을 입력하세요">
													</div>
													<div class="mb-3">
														<label for="defaultAmount" class="form-label">기본
															액수</label> <input type="number" class="form-control"
															id="defaultAmountModalInput" placeholder="기본 액수를 입력하세요">
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-primary"
													id="saveAllowanceButton">추가</button>
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">닫기</button>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div
								class="col-sm-1 d-flex align-items-center justify-contet-center">
								<div class="col d-flex justify-content-center">
									<button type="button" class="btn btn-primary" id="searchButton">
										조회<br> →
									</button>
								</div>
							</div>

							<div class="col">
								<div class="row">
									<div class="col">
										<div class="bg-light rounded p-4 justify-content-center">
											<h5 class="mb-4 text-center">수당 지급 사원 목록</h5>
											<div class="table-responsive" style="height: 550px">
												<table class="table table-hover">
													<thead>
														<tr class="align-middle">
															<th scope="col"><input type="checkbox"
																class="form-check-input" id="allCheck2"></th>
															<th scope="col">사원</th>
															<th scope="col">추가수당</th>
															<th scope="col">금액</th>
															<th scope="col">기본액수</th>
														</tr>
													</thead>
													<tbody id="staffCommissionListBody">
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="d-flex rounded h-100 mt-3 justify-content-center">
										<div class="d-flex pe-2 justify-content-end h-50 w-25">
											<button type="button" class="btn btn-primary text-nowrap"
												data-bs-toggle="modal" data-bs-target="#modal">수당
												지급 추가</button>
										</div>
										<div class="d-flex px-1 justify-content-end h-50">
											<button type="button"
												class="btn btn-outline-primary text-nowrap"
												id="commissionDeleteButton">수당 지급 삭제</button>
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

			<div class="modal fade" id="modal" tabindex="-1"
				aria-labelledby="formModalLabel" aria-hidden="true">
				<div
					class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="formModalLabel">수당 지급 추가</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">


							<div class="row">
								<div class="col-md-4 ms-auto">

									<div class="row g-2">
										<h5 class="mb-4 text-center">사원 목록</h5>
										<div class="col-md-10">
											<input type="text" class="form-control" id="search_input"
												value="" placeholder="이름 또는 부서 검색"
												onkeypress="show_name(event)">
										</div>
										<div class="col-md-2">
											<button type="button" id="search_btn"
												class="btn btn-primary mb-3">선택</button>
										</div>
									</div>

									<!-- 트리구조 조직도 -->
									<div class="tree_div overflow-scroll" style="height: 550px">
										<div id="jstree">
											<ul>
												<!-- 회사 -->
												<li id="root">${rootCompany.name}
													<ul>
														<!-- 부서 -->
														<c:forEach var="department"
															items="${rootCompany.departments}">
															<li class="group" id="group${department.id}">${department.name}
																<ul>
																	<!-- 직원 -->
																	<c:forEach var="staff" items="${department.staffs}">
																		<li staffId="${staff.staffId}"
																			id="child${staff.staffId}">${staff.staffName}</li>
																	</c:forEach>
																</ul>
															</li>
														</c:forEach>
													</ul>
												</li>
											</ul>
										</div>

									</div>
								</div>
								<div class="col-md-2 ms-auto my-auto">
									<div class="row justify-content-center">
										<!-- 이전 검색 도구의 값을 유지 -->
										<select class="form-select mb-3 w-75" id="commissionOption">
											<c:forEach var="commission" items="${commissionList}">
												<option value="${commission.id}"
													defaultAmount="${commission.defaultAmount}">${commission.name}</option>
											</c:forEach>
										</select>
									</div>

									<!-- 추가 버튼 -->
									<div class="row justify-content-center">
										<button type="button" id="includeButton"
											class="btn btn-primary mb-3 w-75">
											대상 추가<i class="bi bi-caret-right-fill"></i>
										</button>
									</div>

									<!-- 제외 버튼 -->
									<div class="row justify-content-center">
										<button type="button" id="excludeButton"
											class="btn btn-outline-primary mb-3 w-75">
											<i class="bi bi-caret-left-fill"></i>대상 제외
										</button>
									</div>
								</div>
								<div class="col-md-6 ms-auto mr-2">
									<h5 class="mb-4 text-center">신규 지급 대상 목록</h5>
									<div class="table-responsive" style="height: 550px">
										<table class="table table-hover">
											<thead>
												<tr class="align-middle">
													<th scope="col"><input type="checkbox"
														class="form-check-input" id="modalAllCheck"></th>
													<th scope="col">이름</th>
													<th scope="col">추가수당</th>
													<th scope="col">금액</th>
													<th scope="col">기본액수</th>
												</tr>
											</thead>
											<tbody id="staffCommissionListBodyModal">
											</tbody>
										</table>
									</div>

								</div>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button type="button" id="addCommission" class="btn btn-primary">저장</button>
						</div>
					</div>
				</div>
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
		<script src="/resources/salary/js/commissionManagement.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
		<!-- jstree js -->
		<script type="text/javascript"
			src="/resources/salary/js/jstreeCustom.js"></script>
</body>

</html>
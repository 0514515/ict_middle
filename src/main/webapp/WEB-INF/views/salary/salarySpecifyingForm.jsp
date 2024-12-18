<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>급여 명세 : 피플윙</title>
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

#main_table {
	height: 952px;
}

#main_table th {
	width: 200px;
}

#main_table th:has(.form-check-input) {
	width: 20px;
}

#main_table td:has(.form-check-input) {
	width: 20px;
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

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script>
	$(function() {
		let count = $('#main_table thead tr th').length;
		let resultWidth = count * 130;

		$('#main_table').width(resultWidth);
	});
</script>

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
			<div class="container pt-4 px-4">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<h4>급여 명세</h4>
				</div>
				<div class="d-flex align-items-center justify-content-between mx-4">
					<div class="align-bottom">
						<span>단위 : 원</span>
					</div>
					<div class="d-flex rounded h-100 justify-content-center">
						<div class="d-flex pe-1 justify-content-end h-50">
							<button type="button" id="add_button"
								class="btn btn-primary text-nowrap" data-bs-toggle="modal"
								data-bs-target="#modal">사원 추가</button>
						</div>
						<div class="d-flex ps-1 justify-content-start h-50 ">
							<button type="button" class="btn btn-outline-primary text-nowrap" id="deleteButton">선택
								삭제</button>
						</div>
					</div>
				</div>
				<div class="col p-4">
					<div class="bg-light rounded min-vh-100 p-4 table-responsive">

						<!-- 이 테이블에 데이터 뿌리기, 없으면 목록이 없다는 라벨 하나 보여줘야 함 -->
						<div id="main_table">
							<table class="table table-hover">
								<thead>
									<tr>
										<th><input type="checkbox" class="form-check-input"
											id="allCheck"></th>
										<th scope="col">사원 번호</th>
										<th scope="col">사원 이름</th>
										<th scope="col">합계</th>
										<th scope="col">기본급</th>
										<c:forEach var="commission" items="${commissionList}">
											<th scope="col" id="commission_${commission.id}">${commission.name}</th>
										</c:forEach>
									</tr>
								</thead>
								<tbody id="tableBody">	
								
								</tbody>
							</table>

						</div>

					</div>
				</div>
				<div class="d-grid gap-2 d-md-flex justify-content-center mx-4 my-4">
					<button class="btn btn-primary px-5" type="button" id="specifyButton">발급</button>
				</div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="modal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="exampleModalLabel">사원 추가</h4>

							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col">
									<div class="bg-white rounded p-4">
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
								</div>
							</div>
						</div>

						<div class="modal-footer">
							<div class="mx-auto">
								<button type="button" class="btn btn-primary"
									id="modalAddButton">추가</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

	<script type="text/javascript"
		src="/resources/salary/js/jstreeCustom.js"></script>
	<script type="text/javascript"
		src="/resources/salary/js/salarySpecifyingForm.js"></script>
</body>

</html>
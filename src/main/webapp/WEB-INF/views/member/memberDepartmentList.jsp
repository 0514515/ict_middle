<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>사원 부서 관리 : 피플윙</title>
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

#tableContainer {
	height: 650px;
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
			<div class="container pt-4 px-4">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<h4>사원 부서 관리</h4>
				</div>
				<div class="col p-4">
					<div class="d-flex align-items-center justify-content-end mb-4">
						<!-- 검색 도구 start -->
						<form action="/member/department" method="GET">
							<div class="d-flex align-items-center justify-content-start">
								<div class="d-flex justify-content-start w-75">
									<!-- 이전 검색 도구의 값을 유지 -->
									<select class="form-select w-100" name="searchOption"
										id="searchOption">
										<option value="departmentName"
											${"departmentName".equals(searchOption) ? "selected" : ""}>부서명
										</option>
										<option value="staffName"
											${"staffName".equals(searchOption) ? "selected" : ""}>사원
											이름</option>
										<option value="rank"
											${"rank".equals(searchOption) ? "selected" : ""}>직급
										</option>
									</select>
								</div>
								<input type="text" class="form-control ms-2"
									value="${searchKeyword != null ? searchKeyword : ''}"
									name="searchKeyword" id="searchKeyword">
								<button type="submit" id="searchButton"
									class="btn btn-primary ms-2 px-4 text-nowrap">검색</button>
							</div>
						</form>
						<!-- 검색 도구 end -->
					</div>
					<div id="tableContainer" class="bg-light rounded p-4">

						<!-- 이 테이블에 데이터 뿌리기, 없으면 목록이 없다는 라벨 하나 보여줘야 함 -->
						<table class="table table table-hover">
							<thead>
								<tr>
									<th><input type="checkbox" class="form-check-input"
										id="allCheck"></th>
									<th scope="col">직급</th>
									<th scope="col">사원 이름</th>
									<th scope="col">부서명</th>
								</tr>
							</thead>
							<tbody id="tableBody">
								<c:forEach var="staff" items="${staffList}">
									<tr class="align-middle">
										<input type="hidden" value="${staff.staffId}" id="staffId"
											name="staffId">
										<td><input type="checkbox" class="form-check-input"
											id="checked"></td>
										<td>${staff.rank}</td>
										<td>${staff.staffName}</td>
										<td><select class="form-select w-100"
											name="department" id="department">
												<c:forEach var="department" items="${departmentList}">
													<option value="${department.id}"
														${staff.departmentId.equals(department.id) ? "selected" : ""}>${department.name}
													</option>
												</c:forEach>
										</select></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<!-- pagination start -->
				<div class="d-flex align-items-center justify-content-center">
					<nav aria-label="Page navigation">
						<ul class="pagination pt-3 pr-3">
							<!-- 현재 페이지가 1페이지일 경우 "이전" 버튼 없음 -->
							<c:if test="${pageNum != 1}">
								<li class="page-item"><a class="page-link"
									href="/member/department?searchOption=${searchOption}&searchKeyword=${searchKeyword}&pageNum=${pageNum-1}">이전</a>
								</li>
							</c:if>

							<!-- pageNum-2가 0보다 작으면 1로 설정 -->
							<!-- 파라미터 pageNum을 받아와서 로컬 pageNum으로 만들기 -->
							<c:set var="pageNum"
								value="${param.pageNum != null ? param.pageNum : 1 }" />

							<!-- pageNum-2가 1보다 작으면 1로 설정 -->
							<!-- begin 선언 -->
							<c:set var="begin" value="${pageNum-2}" />
							<c:if test="${begin<1 }">
								<c:set var="begin" value="1" />
							</c:if>

							<!-- pageNum이 총 페이지 수를 넘지 않도록 설정 -->
							<c:set var="end" value="${pageNum + 2}" />
							<c:if test="${end > totalPage}">
								<c:set var="end" value="${totalPage}" />
							</c:if>

							<!-- 페이지 번호 출력 -->
							<c:forEach var="i" begin="${begin}" end="${end}" step="1">
								<li class="page-item ${i == pageNum ? 'active' : ''}"><a
									class="page-link"
									href="/member/department?searchOption=${searchOption}&searchKeyword=${searchKeyword}&pageNum=${i}">${i}</a>
								</li>
							</c:forEach>

							<!-- 현재 페이지가 마지막 페이지일 경우 "다음" 버튼 없음 -->
							<c:if test="${pageNum != totalPage}">
								<li class="page-item"><a class="page-link"
									href="/member/department?searchOption=${searchOption}&searchKeyword=${searchKeyword}&pageNum=${pageNum+1}">다음</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
				<!-- pagination end -->
				<div class="d-grid gap-2 d-md-flex justify-content-center mx-4 mt-2">
					<button class="btn btn-primary px-5" type="button"
						id="modifyButton">선택 수정</button>
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
	<script src="/resources/member/js/memberDepartmentList.js"></script>
</body>

</html>
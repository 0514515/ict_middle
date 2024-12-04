<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>내 정보 : 피플윙</title>
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
					<h4>내 정보</h4>
				</div>
				<div class="col p-4">
					<div class="d-flex align-items-center justify-content-end mb-4">
						<button type="button" class="btn btn-primary">정보 수정</button>
						<button type="button" class="btn btn-outline-primary ms-2">목록으로</button>
					</div>
					<div class="rounded min-vh-100 p-4">
						<div class="row justify-content-center">
						<!-- 왼쪽 컬럼 start -->
							<div class="col col-sm-5 bg-white">
								<div class="row mb-3 justify-content-center">
									<label for="inputEmail3" class="col-sm-3 col-form-label h5">이름</label>
									<div class="col-sm-6">
										<label for="inputEmail3" class="col-form-label">${staff.staffName}</label>
									</div>
								</div>
								<div class="row mb-3 justify-content-center">
									<label for="inputEmail3" class="col-sm-3 col-form-label h5">전화번호</label>
									<div class="col-sm-6">
										<label for="inputEmail3" class="col-form-label">${staff.phoneNumber}</label>
									</div>
								</div>
								<div class="row mb-3 justify-content-center">
									<label for="inputEmail3" class="col-sm-3 col-form-label h5">직급</label>
									<div class="col-sm-6">
										<label for="inputEmail3" class="col-form-label h5">${staff.rank}</label>
									</div>
								</div>
								<div class="row mb-3 justify-content-center">
									<label for="inputEmail3" class="col-sm-3 col-form-label h5">주소</label>
									<div class="col-sm-6">
										<label for="inputEmail3" class="col-form-label h5">${staff.address}</label>
									</div>
								</div>
								<div class="row mb-3 justify-content-center">
									<label for="inputEmail3" class="col-sm-3 col-form-label h5">성별</label>
									<div class="col-sm-6">
										<label for="inputEmail3" class="col-form-label">${staff.gender}</label>
									</div>
								</div>
								<div class="row mb-3 justify-content-center">
									<label for="inputEmail3" class="col-sm-3 col-form-label h5">생년월일</label>
									<div class="col-sm-6">
										<label for="inputEmail3" class="col-form-label">${staff.birthdate }</label>
									</div>
								</div>
								<div class="row mb-3 justify-content-center">
									<label for="inputEmail3" class="col-sm-3 col-form-label h5">이메일</label>
									<div class="col-sm-6">
										<label for="inputEmail3" class="col-form-label">${staff.email}</label>
									</div>
								</div>
								<div class="row mb-3 justify-content-center">
									<label for="inputEmail3" class="col-sm-3 col-form-label h5">입사일</label>
									<div class="col-sm-6">
										<label for="inputEmail3" class="col-form-label">${staff.hiredDate}</label>
									</div>
								</div>
							</div>
							<!-- 왼쪽 컬럼 end -->

							<!-- 오른쪽 컬럼 start -->
							<div class="col col-sm-5 bg-white">
								<!-- 사원 사진 start -->
								<div class="row mb-3 justify-content-center">
									<h5 class="col-sm-3">사진</h5>
									<div class="col-sm-6">
										<img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgKm1v1NZfQDYxjXhOJZxdGMzff1-pRVIojAUTzdapA4FySgjo0mcLaLhJ4fL1Q5BQmgp2_KDhbkx11TaNY3ijlMPkTbXnoWqfO6EzJzL6xnsuv8xYLXCe1NjUGccOIBO53FxX_HXXOkCM/s800/character_boy_normal.png" class="img-thumbnail">
									</div>
								</div>
								<!-- 사원 사진 end -->
								
								<!-- 사원 도장 start -->
								<div class="row mb-3 justify-content-center">
									<h5 class="col-sm-3">도장</h5>
									<div class="col-sm-6">
										<img src="https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/5lSD/image/UDF5Zbg4Joe84NQHijQrfVFfaNg.png" class="img-thumbnail">
									</div>
								</div>
								<!-- 사원 도장 end -->
								
							</div>
							<!-- 오른쪽 컬럼 end -->
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
</body>

</html>
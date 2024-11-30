<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>People Wing - 로그인</title>

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
	href="resources/template/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="resources/template/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="resources/template/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="resources/template/css/style.css" rel="stylesheet">

<!-- 커스텀 스타일 -->
<style>
body {
	font-family: "Noto Sans KR", sans-serif;
}

.fa-hashtag:before {
	display: none;
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


		<!-- Sign In Start -->
		<div class="container-fluid">

			<div class="row h-100 align-items-center justify-content-center"
				style="min-height: 100vh;">
				<div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
					<div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
						<div
							class="d-flex align-items-center justify-content-between mb-3">
							<a href="index.html" class="">
								<h3 class="text-primary">
									<i class="fa fa-hashtag me-2"></i>People Wing
								</h3>
							</a>
							<h3>로그인</h3>
						</div>
						<!-- form start -->
						<form action="login" method="POST">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="loginId"
									name="loginId" placeholder="아이디 입력"> <label
									for="loginId">아이디</label>
							</div>
							<div class="form-floating mb-4">
								<input type="password" class="form-control" id="password"
									name="password" placeholder="패스워드 입력"> <label
									for="password">비밀번호</label>
							</div>

							<div
								class="d-flex align-items-center justify-content-between mb-4">
								<div class="form-check">
									<input type="checkbox" class="form-check-input"
										id="id_save_check"> <label class="form-check-label"
										for="id_save_check">아이디 저장</label>
								</div>
							</div>
							<button type="submit" class="btn btn-primary py-3 w-100 mb-4">
								로그인</button>
						</form>
						<!-- form end -->
					</div>
				</div>
			</div>

		</div>
		<!-- Sign In End -->
	</div>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="resources/template/lib/chart/chart.min.js"></script>
	<script src="resources/template/lib/easing/easing.min.js"></script>
	<script src="resources/template/lib/waypoints/waypoints.min.js"></script>
	<script src="resources/template/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="resources/template/lib/tempusdominus/js/moment.min.js"></script>
	<script
		src="resources/template/lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script
		src="resources/template/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="resources/template/js/main.js"></script>
</body>
</html>
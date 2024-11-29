<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>나의 근태 현황</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Calendar -->
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css'>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css'>
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/@fullcalendar/core@4.2.0/main.min.css'>
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@4.3.0/main.min.css'>
<link rel="/resources/calendar_template/css/style.css">

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

<!-- Icon Font Stylesheet 달력 -->
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

	<!-- 공통 커스텀 스타일 -->
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
	
	<!-- 개인 커스텀 -->
	<style>
	.card-header {
		text-align: center;
	}
	
	.card-text {
		text-align: center;
	}
	
	.card-text span:nth-child(1) {
		font-size: 4rem;
	}
	
	.card-text span:nth-child(2) {
		font-size: 3rem;
	}
	
	table {
		text-align: center;
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
	
	.mb-3>h4 {
		color: #14A4FF;
	}
	
	.mb-3>h4>span {
		font-size: smaller;
	}
	
	.card {
		margin: 0 auto;
	}
	
	.card-header {
		font-weight: bold;
		font-size: larger;
		color: #191C24;
	}
	
	.fc-header-toolbar .fc-center {
	  display: flex;
	  justify-content: space-between;  /* 아이템들 사이에 공간을 분배 */
	  align-items: center;  /* 세로 가운데 정렬 */
	}
	
	.fc-header-toolbar .fc-center .fc-prev-button,
	.fc-header-toolbar .fc-center .fc-title,
	.fc-header-toolbar .fc-center .fc-next-button {
	  display: inline-block;  /* 각 요소들이 가로로 나열되도록 설정 */
	}
	
	.fc {
		padding: inherit;
		padding-top : 0px;
		margin-bottom: 40px;
	}
	
	.fc-day-grid .fc-row {
		height: 80px !important;
	}
	
	.fc-scroller {
		height: auto !important;
	}
	
	.fc-prev-button,
	.fc-next-button {
		padding : 5px;
	}
	
	/* 달력 버튼 컬러 */
	.fc-button-primary {
	    color: #14A4FF;
	    background-color: #ffffff;
	    border-color: #14A4FF;
	}
	
	.fc-center h2 {
		color: #14A4FF;
	    margin: 0px 10px;
	}
	
	.row .col {
		 width: 232px;
	}
	
	.subtitle_1 h4 {
		color:#009CFF;
	}
	
	.subtitle_1 a {
		color:#009CFF;
	}
	
/* 모달 커스텀 */
	#modal {
		text-align : center;
		position: fixed;
		left: 50%;
		top: 55%;
		transform: translate(-50%, -50%);
	}

	.modal-title {
		color :  #009CFF;
	}
	
	.modal table {
		color: #191C24;
      
      }
      
	
	.modal-body {
	    padding: 2rem;
	}
	
	.modal-dialog {
		display : inline-block;
		text-align : left;
		font-size : 0.9em;
		vertical-align : middle;
		width : 80%;
		height : auto;
		margin : 0;
		padding : 0;
	}
	
	.modal-content {
		heigh : auto;
		min-height : 100%;
		border-radius : 10px;
		border: 2px solid #009CFF;
	}
	
	@media screen and (min-width: 78px) {
		#modal : before {
			display : inline-block;
			vertical-align : middle;
			content: " ";
			height: 50%;
		}
	}
	
	.modal-footer {
	    justify-content: center;
	} 


	.modal-body tr th {
	 	width:40%;
	 	padding: .3rem .3rem;
	}
	
	.modal-body tr td {
	 	padding: .3rem .3rem;
	}

	/* 요청 후 출퇴근 시간 간격 */

	
	.form-control{
		margin-bottom: 1rem;		
	}
	
	.modal-body table:nth-child(3) td input {
		border: 1px solid #000;
	    padding: 0px 15px;
	}
	
	.cs-form .form-control{
		padding : 0px;
		margin-bottom : 0px;
	}
	
	label {
	    display: inline-block;
	    font-size: 15px;
	    font-weight: 600;
	    color: #191C24;
	}
	
	.btn-group {
		padding-right : 200px;
	}
	
	.btn-group>.btn {
	    position: relative;
	    flex: 1 1 auto;
	    font-weight: 500;
	}

	p {
	    margin-top: 0;
	    margin-bottom: 0rem;
	    font-size: large;
	    font-weight: bold;
	    color: #191C24;
	}
	
	.modal-body .d-flex:nth-of-type(1) {
	    margin-right: 35px;
	}
	

	
	
		/* 모달 끝 */	
	
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
			
			<!-- 휴가 생성 모달 팝업 시작 -->
      
			     <div class="modal" id="modal" tabindex="-1">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
					        	<h5 class="modal-title">휴가 신청</h5>
					       		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					     	</div>
					      	<div class="modal-body">
					      		<div>
					          	  <table class="table table-bordered">
					          	  		<tr>
					          	  			<th>신청자</th><td>정준하 과장</td>
					          	  		</tr>
										 <tr>
					          	  			<th>승인자</th><td>이동욱 과장</td>
					          	  		</tr>
								  </table>
								 </div>
								 <div class="d-flex align-items-center mb-3"> 
					          		<p>휴가 구분</p>
					          		<div>
										<select class="form-select form-select-sm" aria-label=".form-select-sm example">
										  <option selected>Open this select menu</option>
										  <option value="1">One</option>
										  <option value="2">Two</option>
										  <option value="3">Three</option>
										</select>
									</div>
								 </div>
								  
								 <div> 
					          		<p>사용 일자</p>
								 </div> 
								 <!-- timepicker start -->
								 <div class="d-flex align-items-center justify-content-between mb-3">
					          	  	<p>시간 선택</p>
				          	  		<div class="cs-form">
										<input type="time" class="form-control"/>
									</div>	
			          	  			<label>~</label>
				          	  		<div class="cs-form">
										<input type="time" class="form-control"/>
								     </div>
								  </div>	       	          	 
								  <!-- timepicker end -->

								  <div>
				    	  			<h6>사유</h6>
				    	  			<textarea class="form-control" placeholder="필수 입력 사항입니다." id="text_area" style="height: 50px;"></textarea>
				    	  		  </div>
					     	</div> 
					     	
					     	<!-- end of modal body -->
					     	
					     	<!-- start of modal footer -->
					     	
					      	<div class="modal-footer">
					        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        	<button type="button" class="btn btn-primary">휴가요청</button>
					      	</div>
					      	
					      	<!-- end fo modal footer -->
					      	
					    </div>
					 </div>
				 </div>
			
			       <!-- 모달 팝업 끝-->
					

			<!-- 본문 여백 -->
			<div class="container container-fluid pt-4 px-4">

				<div class="title mx-4 my-4">
					<h4>나의 일정</h4>
				</div>
				
				<div id='calendar'></div>

				<!-- Add modal -->

				<div class="modal fade edit-form" id="form" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header border-bottom-0">
								<h5 class="modal-title" id="modal-title">Add Event</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<form id="myForm">
								<div class="modal-body">
									<div class="alert alert-danger " role="alert" id="danger-alert"
										style="display: none;">End date should be greater than
										start date.</div>
									<div class="form-group">
										<label for="event-title">Event name <span
											class="text-danger">*</span></label> <input type="text"
											class="form-control" id="event-title"
											placeholder="Enter event name" required>
									</div>
									<div class="form-group">
										<label for="start-date">Start date <span
											class="text-danger">*</span></label> <input type="date"
											class="form-control" id="start-date" placeholder="start-date"
											required>
									</div>
									<div class="form-group">
										<label for="end-date">End date - <small
											class="text-muted">Optional</small></label> <input type="date"
											class="form-control" id="end-date" placeholder="end-date">
									</div>
									<div class="form-group">
										<label for="event-color">Color</label> <input type="color"
											class="form-control" id="event-color" value="#3788d8">
									</div>
								</div>
								<div
									class="modal-footer border-top-0 d-flex justify-content-center">
									<button type="submit" class="btn btn-success"
										id="submit-button">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>

				<!-- Delete Modal -->
				<div class="modal fade" id="delete-modal" tabindex="-1"
					role="dialog" aria-labelledby="delete-modal-title"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="delete-modal-title">Confirm
									Deletion</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body text-center" id="delete-modal-body">
								Are you sure you want to delete the event?</div>
							<div class="modal-footer border-0">
								<button type="button" class="btn btn-secondary rounded-sm"
									data-dismiss="modal" id="cancel-button">Cancel</button>
								<button type="button" class="btn btn-danger rounded-lg"
									id="delete-button">Delete</button>
							</div>
						</div>
					</div>
				</div>



		<!-- 테이블 시작 -->
			<div class="row g-5">
				<div class="col-md-7 ps-5">
					<div class="subtitle_1 d-flex justify-content-between mb-3">
						<div>
							<h4>휴가 신청 내역</h4>
						</div>
						<div>
							<a href="">더보기</a>
						</div>
					</div>
						
					<table class="table table-striped">
						<tr>
							<th class="table-light">번호</th>
							<th class="table-light">휴가종류</th>
							<th class="table-light">신청일자</th>
							<th class="table-light">진행상태</th>
						</tr>
						<tr>
							<th>1</th>						
							<td>2024-11-19</td>
							<td>08:51:11</td>
							<td></td>
						</tr>
						<tr>
							<th>2</th>
							<td>2024-11-18</td>
							<td>10:55:27</td>
							<td><span class="badge bg-danger">근태이상</span></td>
						</tr>
						<tr>
							<th>3</th>
							<td>2024-11-17</td>
							<td>09:00:00</td>
							<td><span class="badge bg-info">승인완료</span></td>
						</tr>
						<tr>
							<th>4</th>
							<td>2024-11-16</td>
							<td>08:54:12</td>
							<td></td>
						</tr>
						<tr>
							<th>5</th>
							<td>2024-11-16</td>
							<td></td>
							<td></td>
						</tr>						
						<tr>
							<th>6</th>
							<td>2024-11-16</td>
							<td></td>
							<td></td>
						</tr>	
						<tr>
							<th>7</th>
							<td>2024-11-16</td>
							<td></td>
							<td></td>
						</tr>							
						<tr>
							<th>8</th>
							<td>2024-11-16</td>
							<td></td>
							<td></td>
						</tr>						
					</table>
				</div>
				
		         <div class="col-md-5">		         
			        <div class="d-flex justify-content-between mb-3">
			        	<h4>전체 현황</h4>
			        </div>
		            <div class="row row-cols-3 g-4">		            	
		              <div class="col">
		                <div class="card border-primary">
		                 <div class="card-header">승인 완료</div>
		                 <div class="card-body text-primary">
		                   <p class="card-text"><span>1</span><span>건</span></p>
		                 </div>
		               </div>
		              </div>
		              <div class="col">
		                 <div class="card border-primary">
		                 <div class="card-header">결재 대기</div>
		                 <div class="card-body text-primary">
		                   <p class="card-text"><span>1</span><span>건</span></p>
		                 </div>
		               </div>
		              </div>
		              <div class="col">
		                 <div class="card border-primary">
		                 <div class="card-header">반려</div>
		                 <div class="card-body text-primary">
		                   <p class="card-text"><span>2</span><span>건</span></p>
		                 </div>
		               </div>
		              </div>
		              <div class="col">
		                 <div class="card border-primary">
		                 <div class="card-header">잔여 연차</div>
		                 <div class="card-body text-primary">
		                   <p class="card-text"><span>1/</span><span>12</span></p>
		                 </div>
		               </div>
		              </div>
		            </div>
		           </div>
				</div>

			</div>
			<!-- end of class = container-fluid -->

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
	<script src="/resources/attendence/js/holiday.js"></script>

	<!-- Calendar -->
	<script
		src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js'></script>
	<script
		src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@4.2.0/main.min.js'></script>
	<script
		src='https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@4.2.0/main.js'></script>
	<script
		src='https://cdn.jsdelivr.net/npm/@fullcalendar/interaction@4.2.0/main.js'></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js'></script>
	<script
		src='https://cdn.jsdelivr.net/npm/uuid@8.3.2/dist/umd/uuidv4.min.js'></script>
		
	<script src='/resources/calendar_template/js/script.js'></script>
	
	
	<!-- dropdown  Bootstrap JS (최소한 Popper.js 포함)  -->
	<script src="/static/js/bootstrap.bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

</body>

</html>
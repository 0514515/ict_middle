<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>근태 관리-나의 근태 현황</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/resources/template/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/resources/template/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/resources/template/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/resources/template/css/style.css" rel="stylesheet">
    
    <!-- 커스텀 스타일 -->
    <style> 
        
  	 	body{
 			font-family: "Noto Sans KR", sans-serif;	   	
    	}
    	
    	.navbar{
    		border-bottom : 1px solid #14A4FF;
    		height:60px; 
    	} 
    
    	.fa-hashtag:before{
    		display:none; 
    	}
    	
    	.sidebar .navbar .dropdown-item{
    		padding-left:35px; 
    	}

    	.sidebar .navbar .navbar-nav .nav-link{
    	
    		font-weight: 600;
    	}
    	
    	.ms-4{
    		margin-top: 1rem; 
    	}
    	
    	
    </style>
    
    <!-- 나의 커스텀  -->
    
    <style>
    
		.card {
			    padding: 15px;
			    height : 282px;
		}
	
	    .col-md-8 {
	        padding: 15px 25px 0px 0px;
	    }
	    
	    
		.start_title, .end_title {
	 	   text-align: left;
	 	   color : #009CFF;
		}
		
		.card-body {
		   align-items: center;
		}
		    
    	.start_body, .end_body {
			text-align: -webkit-right;
    		font-size: 20px;
    	}
		
		.main_total_context_div{
			padding: 10px;
		}
		
    	
    	.main_total_time_div > h2{
   			text-align: left;
   			color : #009CFF;
    	}
    	
    	.main_work_type_div{
    		margin : 70px 0px 15px 0px;
    	}
    	
    	.main_work_type_div > h3{
   			text-align: left;
   			color : #6C757D;
    	}
    	
    	.main_total_context_div > h5{
    	   			text-align: left;
   			color : #6C757D;
    	}
    	
		.btn_start, .btn_modify {
		    font-size: 20px;
		}

    
    	.mb-0{
    		color : #009CFF;
    	}
    	

    	/* 휴가 신청 내역, 최근 출/퇴근 기록과 표 사이 마진 */
    	.mb-2 {
		    margin-bottom: .50rem !important;
		}

       /*뱃지 컬러 : 반려*/
       .bg-danger{
          background-color:#F8D7DA !important;
          color:#58151C;
       }
       
       /*뱃지 컬러 : 진행중*/
       .bg-success{
          background-color:#D1E7DD !important;
          color:#0A3622;
       }
       /*뱃지 컬러 : 결재 대기*/
       .bg-warning{
          background-color:#FFF3CD !important;
          color:#664D03;
       }
       /*뱃지 컬러 : 승인 완료*/
       .bg-info{
          background-color:#CFF4FC !important;
          color:#055160;
       }
    
    	/* 프로그래스 바 커스텀 시작 */

		.progress-bar {
		  position: relative;  /* 내부 텍스트 위치를 상대적으로 설정 */
		  height: 100%;
		  background-color: #009CFF;  /* 프로그레스 바의 색 */
		}
		
		.progress-text {
		  color: #fff;
		  font-size: 15px;  /* 텍스트 크기 조정 */
		}
		
		/* 프로그래스 바 커스텀 끝  */

    	
    </style>
    
    
</head>

<body>
    <div class="container-fluid position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


		<!-- @@@ Menu Tab Include @@@ -->
        <jsp:include page="/common_layout/menu_tab.jsp">
        	<jsp:param name="menu_tab" value="menu_tab"/>
        </jsp:include>
		<!-- @@@@@@@@@@@@@@@@@@@@@@@@ -->

        <!-- Content Start -->
        <div class="content">
            
			<!-- @@@ Navigation Bar Include @@@ -->
	        <jsp:include page="/common_layout/nav_bar.jsp">
	        	<jsp:param name="nav_bar" value="nav_bar"/>
	        </jsp:include>
			<!-- @@@@@@@@@@@@@@@@@@@@@@@@ -->
			
			
			<!-- 본문 작성 (body start) -->
	       <form a> 
			<div class="container container-fluid pt-5 px-4">
				
				<div class="mx-4 my-4">
					<h4>나의 근태 현황</h4>
				</div>
				
				 <div class="mx-4 my-4">
				<div class="bg-light text-center rounded p-4">
					<div class="row g-0">
						<div class="col-sm-6 col-md-8">
							<div class="progress" style="position: relative; height:25px">
							  <div class="progress-bar" role="progressbar" style="width: 70%;" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"> 
							  										<!-- aira-valuenow=현재 진행률, width=진행된 프로그래스 바의 길이(파란색), aria-valuemax=최대값 -->
							  <span class="progress-text" style="position: absolute; top: auto; left: 50%; transform: translateX(-50%);">70%</span> <!-- 70% 프로그래스바 위에 나타나는 수치 -->
							  </div>
							</div>
							<div class="main_total_context_div">
								<div class="main_total_time_div">
									<h2>24시간 17분</h2>
								</div>
								<div class="main_work_type_div">
									<h3 class="main_work_type">
										정시 근무 시간 [ 정준하 과장 / 마케팅 팀] <br /> 09:00 ~ 18:00
									</h3>
								</div>
								<h5>남은 근무 시간 : 15h 43m</h5>
							</div>
						</div>
						<div class="col-6 col-md-4">
							<div class="card">
								<div class="d-grid gap-2 col-12 mx-auto">
									<input type='hidden' name='staff_id' id='staff_id' value=24>
									<button type='button' class="btn btn_start btn-primary" data-staff-id="${staff_id}" value="출근">출근</button>										
								</div>
								<div class="row card-body">
									<h5 class="col-5 start_title">출근 시간</h5><p id="start_body" class="col-7 start_body">${attendance.start_at}</p>
									<h5 class="col-5 end_title">퇴근 시간</h5><p id="end_body" class="col-7 end_body">${attendance.end_at}</p>
								</div>
								<div class="d-grid gap-2 col-12 mx-auto">
									<a href="#" class="btn btn_modify btn-primary">출/퇴근 관리</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		
			<div class="container-fluid pt-2 px-4">
				<div class="row g-4">
					<div class="col-sm-12 col-xl-6">
						<div class="bg-light_list text-center rounded p-4">
							<div class="d-flex align-items-center justify-content-between mb-2">
								<h4 class="mb-0">휴가 신청 내역</h4>
								<a href="">더보기</a>
							</div>
							<div class="mt-3">
								<table class="table">
	                                <thead>
	                                    <tr>
	                                        <th scope="col">번호</th>
	                                        <th scope="col">요청명</th>
	                                        <th scope="col">신청일</th>
	                                        <th scope="col">진행상태</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <tr>
	                                        <td>1</td>
	                                        <td>연차</td>
	                                        <td>2024-11-19</td>
	                                        <td><span class="badge bg-warning text-dark">결재대기</span></td>
	                                    </tr>
	                                    <tr>
	                                        <td>2</td>
	                                        <td>연차</td>
	                                        <td>2024-10-02</td>
	                                        <td><span class="badge bg-danger">반려</span></td>
	                                    </tr>
	                                    <tr>
	                                        <td>3</td>
	                                        <td>반차</td>
	                                        <td>2024-07-21</td>
	                                        <td><span class="badge bg-info">승인완료</span></td>
	                                    </tr>
	                                    <tr>
	                                        <td>4</td>
	                                        <td>반차</td>
	                                        <td>2024-06-01</td>
	                                        <td><span class="badge bg-info">승인완료</span></td>
	                                    </tr>
	                                    <tr>
	                                        <td>5</td>
	                                        <td>반반차</td>
	                                        <td>2024-05-09</td>
	                                        <td><span class="badge bg-info">승인완료</span></td>
	                                    </tr>	                                    	                                    
	                                </tbody>
                           		 </table>
                           	</div>							
						</div>
					</div>
					<div class="col-sm-12 col-xl-6">
						<div class="bg-light_list text-center rounded p-4">
							<div class="d-flex align-items-center justify-content-between mb-2">
								<h4 class="mb-0">최근 출/퇴근 기록</h4>
								<a href="">더보기</a>
							</div>
							<div class="mt-3">
								<table class="table">
	                                <thead>
	                                    <tr>
	                                        <th scope="col">일자</th>
	                                        <th scope="col">출근시간</th>
	                                        <th scope="col">퇴근시간</th>
	                                        <th scope="col">근태이상</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <tr>
	                                        <td>2024-11-19</td>
	                                        <td>08:51:11</td>
	                                        <td>18:12:45</td>
	                                        <td></td>
	                                    </tr>
	                                    <tr>
	                                        <td>2024-11-18</td>
	                                        <td>10:55:27</td>
	                                        <td>18:01:14</td>
	                                        <td><span class="badge bg-danger">근태이상</span></td>
	                                    </tr>
	                                    <tr>
	                                        <td>2024-11-17</td>
	                                        <td>09:00:00</td>
	                                        <td>18:00:00</td>
	                                        <td><span class="badge bg-info">승인완료</span></td>
	                                    </tr>
	                                    <tr>
	                                        <td>2024-11-16</td>
	                                        <td>09:00:00</td>
	                                        <td>18:00:00</td>
	                                        <td><span class="badge bg-info">승인완료</span></td>
	                                    </tr>
	                                    <tr>
	                                        <td>2024-11-15</td>
	                                        <td>08:55:12</td>
	                                        <td>18:21:47</td>
	                                        <td></td>
	                                    </tr>	                                    	                                    
	                                </tbody>
                           	 </table>
                           	</div>							
						</div>
					</div>
				</div>
			</div>
		</div>
	
			<!-- 본문 끝 (body end) -->




            <!-- @@@ Footer Include @@@ -->
	        <jsp:include page="/common_layout/footer.jsp">
	        	<jsp:param name="footer" value="footer"/>
	        </jsp:include>
			<!-- @@@@@@@@@@@@@@@@@@@@@@@@ -->
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/template/lib/chart/chart.min.js"></script>
    <script src="/resources/template/lib/easing/easing.min.js"></script>
    <script src="/resources/template/lib/waypoints/waypoints.min.js"></script>
    <script src="/resources/template/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/resources/template/lib/tempusdominus/js/moment.min.js"></script>
    <script src="/resources/template/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="/resources/template/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="/resources/template/js/main.js" type="text/javascript"></script>
	<script src="/resources/attendance/js/main.js" type="text/javascript"></script>
</body>

</html>
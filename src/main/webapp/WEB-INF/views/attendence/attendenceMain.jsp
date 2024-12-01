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
		}
	
	    .col-md-8 {
	        padding: 15px 25px 0px 0px;
	    }
	    
	    .card-body {
	    	padding: 1rem 1rem 5rem;
		}
	    
		.card-title {
	 	   text-align: left;
	 	   color : #009CFF;
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
    	
		.btn-primary{
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

			<div class="container container-fluid pt-4 px-4">
				<div class="bg-light text-center rounded p-4">
					<div class="row g-0">
						<div class="col-sm-6 col-md-8">
							<div class="progress">
							  <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
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
									<button class="btn btn-primary" type="button">출근</button>
								</div>
								<div class="card-body">
									<h5 class="card-title">출근 시간</h5>
									<h5 class="card-title">퇴근 시간</h5>
									<p class="card-text"></p>
								</div>
								<div class="d-grid gap-2 col-12 mx-auto">
									<a href="#" class="btn btn-primary">출/퇴근 관리</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
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
	                                        <th scope="row">1</th>
	                                        <td>연차</td>
	                                        <td>2024-11-19</td>
	                                        <td><span class="badge bg-warning text-dark">결재대기</span></td>
	                                    </tr>
	                                    <tr>
	                                        <th scope="row">2</th>
	                                        <td>연차</td>
	                                        <td>2024-10-02</td>
	                                        <td><span class="badge bg-danger">반려</span></td>
	                                    </tr>
	                                    <tr>
	                                        <th scope="row">3</th>
	                                        <td>반차</td>
	                                        <td>2024-07-21</td>
	                                        <td><span class="badge bg-info">승인완료</span></td>
	                                    </tr>
	                                    <tr>
	                                        <th scope="row">4</th>
	                                        <td>반차</td>
	                                        <td>2024-06-01</td>
	                                        <td><span class="badge bg-info">승인완료</span></td>
	                                    </tr>
	                                    <tr>
	                                        <th scope="row">5</th>
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
	                                        <th scope="row">2024-11-19</th>
	                                        <td>08:51:11</td>
	                                        <td>18:12:45</td>
	                                        <td></td>
	                                    </tr>
	                                    <tr>
	                                        <th scope="row">2024-11-18</th>
	                                        <td>10:55:27</td>
	                                        <td>18:01:14</td>
	                                        <td><span class="badge bg-danger">근태이상</span></td>
	                                    </tr>
	                                    <tr>
	                                        <th scope="row">2024-11-17</th>
	                                        <td>09:00:00</td>
	                                        <td>18:00:00</td>
	                                        <td><span class="badge bg-info">승인완료</span></td>
	                                    </tr>
	                                    <tr>
	                                        <th scope="row">2024-11-16</th>
	                                        <td>09:00:00</td>
	                                        <td>18:00:00</td>
	                                        <td><span class="badge bg-info">승인완료</span></td>
	                                    </tr>
	                                    <tr>
	                                        <th scope="row">2024-11-15</th>
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
    <script src="/resources/template/js/main.js"></script>
</body>

</html>
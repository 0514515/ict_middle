<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>관리자-근태/휴가관리</title>
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
    
    <!-- 공통 커스텀 스타일 -->
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
    
    <!-- 개인 커스텀 -->
    <style>
       
       .card-header{
          text-align:center;
       }
       .card-text{
          text-align:center;
       }
       .card-text span:nth-child(1){
          font-size:4rem;
       }
       .card-text span:nth-child(2){
          font-size:3rem;
       }
       
       table{
          text-align:center; 
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
       
       .mb-3 > h4 {
       	  	color: #14A4FF;
       }
       
       .mb-3 > h4 > span {
       		font-size:smaller;
       }
       
       .card {
       	margin : 0 auto;
       }
       
       .card-header {
		    font-weight: bold;
		    font-size: larger;
		    color: #191C24;
		}
		
		/* 정정 요청 모달 커스텀 */
		#modal_modify {
			text-align : center;
			position: fixed;
			left: 50%;
			top: 55%;
			transform: translate(-50%, -50%);
		}		
		

		.modal-title_modify {
			color :  #009CFF;
		}
		
		#modal_modify table {
			color: #191C24;
       
       }
       
		
		.modal-body_modify {
		    padding: 2rem;
		}
		
		.modal-dialog_modify {
			display : inline-block;
			text-align : left;
			font-size : 0.9em;
			vertical-align : middle;
			width : 80%;
			height : auto;
			margin : 0;
			padding : 0;
		}
		
		.modal-content_modify {
			heigh : auto;
			min-height : 100%;
			border-radius : 10px;
			border: 2px solid #009CFF;
		}
		
		@media screen and (min-width: 78px) {
			#modal_modify : before {
				display : inline-block;
				vertical-align : middle;
				content: " ";
				height: 50%;
			}
		}
			
		
		.modal-footer_modify {
		    justify-content: center;
		} 


		.modal-body_modify tr th {
		 	width:40%;
		 	padding: .3rem .3rem;
		}
		
		.modal-body_modify tr td {
		 	padding: .3rem .3rem;
		}

		/* 요청 후 출퇴근 시간 간격 */
		.modal-body_modify .d-flex {
			border: 1px solid rgba(0, 0, 0, 0.2);
    		padding: 15px;
		}
		
		.form-control_modify {
			margin-bottom: 1rem;		
		}
		
		.modal-body_modify table:nth-child(3) td input {
			border: 1px solid #000;
		    padding: 0px 15px;
		}
		
/* 정정요청 모달 커스텀 끝 */

/* 휴가신청 모달 커스텀 시작 */

	#modal_holiday {
		text-align : center;
		position: fixed;
		left: 50%;
		top: 55%;
		transform: translate(-50%, -50%);
	}

	.modal-title_holiday {
		color :  #009CFF;
	}
	
	.modal_holiday table {
		color: #191C24;
      
      }
      
	
	.modal-body_holiday {
	    padding: 2rem;
	}
	
	.modal-dialog_holiday {
		display : inline-block;
		text-align : left;
		font-size : 0.9em;
		vertical-align : middle;
		width : 80%;
		height : auto;
		margin : 0;
		padding : 0;
	}
	
	.modal-content_holiday {
		heigh : auto;
		min-height : 100%;
		border-radius : 10px;
		border: 2px solid #009CFF;
	}
	
	@media screen and (min-width: 78px) {
		#modal_holiday : before {
			display : inline-block;
			vertical-align : middle;
			content: " ";
			height: 50%;
		}
	}
	
	.modal-footer_holiday {
	    justify-content: center;
	} 


	.modal-body_holiday tr th {
	 	width:40%;
	 	padding: .3rem .3rem;
	}
	
	.modal-body_holiday tr td {
	 	padding: .3rem .3rem;
	}

	/* 요청 후 출퇴근 시간 간격 */

	
	.form-control_holiday {
		margin-bottom: 1rem;		
	}
	
	.modal-body_holiday table:nth-child(3) td input {
		border: 1px solid #000;
	    padding: 0px 15px;
	}
	
	.cs-form .form-control_holiday {
		padding : 0px;
		margin-bottom : 0px;
	}

	
	.btn-group {
		padding-right : 200px;
	}
	
	.btn-group>.btn {
	    position: relative;
	    flex: 1 1 auto;
	    font-weight: 500;
	}

	.modal-body_holiday p {
	    margin-top: 0;
	    font-size: large;
	    font-weight: bold;
	    color: #191C24;
	}
	
	/* <p> 사용일자 */
	.modal-body_holiday div:nth-child(3) p {
		    width: 300px;
	}
	
	.table_holiday {
		margin-bottom : 3.0rem;
	}
	
	/* 셀렉트 박스 시작 */

	
/* 	.form-select {
		color : #009CFF;
		width: 150px;
    	text-align: center;
	}	
	
	select option {
		color : #757575;
	}
 */
/* 	
	.datepicker_div{
	    margin-right: 2px;
	 } */
	
	
	/* 셀렉트 박스 끝 */
	
	.form-control[id='datePicker_start']{
		margin-bottom: 0rem;
		height: 31px;
    	width: 150px;
    	padding: .25rem;
    	text-align: center;
    	color: #009CFF;
	}
	
	.form-control[id='datePicker_end']{
		margin-bottom: 0rem;
		height: 31px;
    	width: 150px;
    	padding: .25rem;
    	text-align: center;
    	color: #009CFF;
	}

	
	 
/* 	.form-control[type='time'] {
		height: 31px;
   		width: 150px;
   		color: #009CFF;
   		text-align : center;
  
	} */
	/* 모달 끝 */	



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
        <jsp:include page="../../../common_layout/menu_tab.jsp">
           <jsp:param name="menu_tab" value="menu_tab"/>
        </jsp:include>
      <!-- @@@@@@@@@@@@@@@@@@@@@@@@ -->

        <!-- Content Start -->
        <div class="content">
            
         <!-- @@@ Navigation Bar Include @@@ -->
           <jsp:include page="../../../common_layout/nav_bar.jsp">
              <jsp:param name="nav_bar" value="nav_bar"/>
           </jsp:include>
         <!-- @@@@@@@@@@@@@@@@@@@@@@@@ -->
         
         
   <!-- 본문 작성 (body start) -->
         
         
         
         <!-- 정정 요청 모달 팝업 시작 -->
	     <div class="modal modal_modify" id="modal_modify" tabindex="-1">
			<div class="modal-dialog modal-dialog_modify">
				<div class="modal-content modal-content_modify">
					<div class="modal-header modal-header_modify">
			        	<h5 class="modal-title modal-title_modify">출/퇴근 정정요청서</h5>
			       		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			     	</div>
			      	<div class="modal-body modal-body_modify">
				      	<h6>요청자 정보</h6>
			          	  <table class="table table_modify table-bordered">
			          	  		<tr>
			          	  			<th>요청자</th><td>정준하 과장</td>
			          	  		</tr>
								 <tr>
			          	  			<th>근무일</th><td>2024-11-20</td>
			          	  		</tr>
						  </table>
						  <h6>요청 전</h6>
			          	  <table class="table table_modify table-bordered md-3">
			          	  		<tr>
			          	  			<th>출근 시간</th><td>10:55:27</td>
			          	  		</tr>
								 <tr>
			          	  			<th>퇴근 시간</th><td>18:01:54</td>
			          	  		</tr>
						  </table>
						 <h6>요청 후</h6>
			          	 <table class="table table_modify table-bordered md-3">
			          	 	<tr>
			          	  		<th>출근 시간</th><td>기안자의선택시간</td>
			          	  	</tr>
								<tr>
			          	  			<th>퇴근 시간</th><td>기안자의선택시간</td>
			          	  		</tr>
						 </table>	       	          	  
						 <h6>승인자 정보</h6>
			          	 <table class="table table_modify table-bordered">
			          	 	<tr>
	          	  				<th>승인권자</th><td>이동욱 인사 담당자</td>
			          	  	</tr>	          	  			
						 </table>
						  <div>
		    	  			<h6>사유</h6>
		    	  			<textarea class="form-control form-control_modify" id="text_area" style="height: 50px;" readonly></textarea>
		    	  		  </div>
		    	  		 <div>
		    	  		 <h6>증빙 서류</h6>
			    	  		 <table class="table table_modify table-bordered md-3">
			    	  		 	<tr>
					          		<th>파일</th><td>기안자가 올린 파일</td>
					          	</tr>
							 </table>
						 </div>
			     	</div> <!--  end of modal body -->
			      	<div class="modal-footer modal-footer_modify">
			        	<button type="button" class="btn btn_modify btn-secondary" data-bs-dismiss="modal">닫기</button>
			        	<button type="button" class="btn btn_modify btn-primary">승인</button>
			      	</div>
			    </div>
			 </div>
		 </div>

         <!-- 모달 팝업 끝-->
            
            
            
            
            
	<!-- 휴가 승인 모달 팝업 시작 -->
      
			     <div class="modal modal_holiday" id="modal_holiday" tabindex="-1">
					<div class="modal-dialog modal-dialog_hoilday">
						<div class="modal-content modal-content_holiday">
							<div class="modal-header modal-header_holiday">
					        	<h5 class="modal-title modal-title_holiday">휴가 신청</h5>
					       		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					     	</div>
					      	<div class="modal-body modal-body_holiday">
					      		<div class="table_holiday">
					          	  <table class="table table-bordered">
					          	  		<tr>
					          	  			<th>신청자</th><td>정준하 과장</td>
					          	  		</tr>
										 <tr>
					          	  			<th>승인자</th><td>이동욱 과장</td>
					          	  		</tr>
								  </table>
								 </div>
									 <div class="row d-flex align-items-center mb-3"> 
						          		<div class="col-3">
						          		<p>휴가 구분</p>
						          		</div>
						          		<div class="col-9 holiday_selcect">
											<input class="form-control form-control_holiday" readonly>
										</div>
									 </div>
									  
									  
									 <div class="row d-flex align-items-center mb-3"> 
						          		<div class="col-3">
						          			<p>사용 일자</p>
										</div>
										<!-- 시작시 기본 날짜 설정은 value를 이용 -->
										<div class="col-9 d-flex align-items-center">	
											<input class="form-control  form-control_holiday" readonly >
											<label class="mx-2"> ~ </label>
											<input class="form-control  form-control_holiday" readonly>
									 	</div>
									 </div> 
									 
									 <!-- timepicker start -->
									 <div class="row timepicker_holiday d-flex align-items-center justify-content-between mb-3">
						          	  <div class="col-3">
						          	  	<p>시간 선택</p>
						          	  </div>		
						          	  		<div class="col-9 d-flex align-items-center">
							          	  		
												<input class="form-control  form-control_holiday" readonly/>
													
						          	  			<label class="mx-2">~</label>
							          	  		
												<input class="form-control  form-control_holiday" readonly/>
											    
										    </div>
									  </div>	       	          	 
									<!--   timepicker end -->
	
									  <div class="row d-flex justify-content-between mb-2">
					    	  			<p class="col-2 mb-3">사유</p>
					    	  			<div>
					    	  			<textarea class="form-control  form-control_holiday" placeholder="필수 입력 사항입니다." id="text_area" style="height: 100px;" readonly></textarea>
					    	  		  	</div>
					    	  		  </div>

					     	</div> 
					     	
					     	<!-- end of modal body -->
					     	
					     	<!-- start of modal footer -->
					     	
					      	<div class="modal-footer modal-footer_holiday">
					        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        	<button type="button" class="btn btn-primary">휴가요청</button>
					      	</div>
					      	
					      	<!-- end of modal footer -->
					      	
					    </div>
					 </div>
				 </div>
			
			       <!-- 모달 팝업 끝 -->
         
		<!-- 본문 여백 -->
         <div class="container container-fluid pt-4 px-4">
         
         <div class="mx-4 my-4">   
            <h4>근태/휴가 관리</h4>
         </div>
            
         <div class="mx-4 my-4">
            <div class="row row-cols-1 row-cols-md-4 g-4">
              <div class="col">
                <div class="card border-primary mb-4 " style="max-width: 18rem;">
                 <div class="card-header">근태 정정</div>
                 <div class="card-body text-primary">
                   <p class="card-text"><span>1</span><span>건</span></p>
                 </div>
               </div>
              </div>
              <div class="col">
                 <div class="card border-primary mb-4 " style="max-width: 18rem;">
                 <div class="card-header">휴가 신청</div>
                 <div class="card-body text-primary">
                   <p class="card-text"><span>1</span><span>건</span></p>
                 </div>
               </div>
              </div>
              <div class="col">
                 <div class="card border-primary mb-4 " style="max-width: 18rem;">
                 <div class="card-header">결재 대기</div>
                 <div class="card-body text-primary">
                   <p class="card-text"><span>2</span><span>건</span></p>
                 </div>
               </div>
              </div>
              <div class="col">
                 <div class="card border-primary mb-4 " style="max-width: 18rem;">
                 <div class="card-header">승인 완료</div>
                 <div class="card-body text-primary">
                   <p class="card-text"><span>6</span><span>건</span></p>
                 </div>
               </div>
              </div>
            </div>
           </div>
         
         <!-- 테이블 시작 -->
         <div class="mx-4 my-4">
            <table class="table table-hover">
                 <tr>
                    <th class="table-light">종류</th>
                    <th class="table-light">기안일자</th>
                    <th class="table-light">승인일자</th>
                    <th class="table-light">기안자</th>
                    <th class="table-light">진행상태</th>
                 </tr>
                 <tr>
                    <td>근태 정정</td>
                    <td>2024-11-20</td>
                    <td>2024-11-20</td>
                    <td>정준하</td>
                    <td><span class="badge bg-warning">결재대기</span></td>
                 </tr>
                 <tr>
                    <td>근태 정정</td>
                    <td>2024-08-13</td>
                    <td>-</td>
                    <td>박명수</td>
                    <td><span class="badge bg-danger">반려</span></td>
                 </tr> 
                 <tr>
                    <td>휴가 신청</td>
                    <td>2024-07-28</td>
                    <td>2024-07-28</td>
                    <td>남창희</td>
                    <td><span class="badge bg-warning">결재대기</span></td>
                 </tr>
                 <tr>
                    <td>휴가 신청</td>
                    <td>2024-07-11</td>
                    <td>-</td>
                    <td>조세호</td>
                    <td><span class="badge bg-danger">반려</span></td>
                 </tr>
                 <tr>
                    <td>근태 정정</td>
                    <td>2024-06-24</td>
                    <td>2024-06-24</td>
                    <td>홍진경</td>
                    <td><span class="badge bg-info">승인완료</span></td>
                 </tr>
                 <tr>
                    <td>휴가 신청</td>
                    <td>2024-05-05</td>
                    <td>2024-05-05</td>
                    <td>양세찬</td>
                    <td><span class="badge bg-info">승인완료</span></td>
                 </tr>
                 <tr>
                    <td>test</td>
                    <td>test</td>
                    <td>test</td>
                    <td>test</td>
                    <td>test</td>
                 </tr>
                 <tr>
                    <td>test</td>
                    <td>test</td>
                    <td>test</td>
                    <td>test</td>
                    <td>test</td>
                 </tr>
                 <tr>
                    <td>test</td>
                    <td>test</td>
                    <td>test</td>
                    <td>test</td>
                    <td>test</td>
                 </tr>
                 <tr>
                    <td>test</td>
                    <td>test</td>
                    <td>test</td>
                    <td>test</td>
                    <td>test</td>
                 </tr>
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
         
         </div> <!-- end of class = container-fluid -->
        
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
    <script src="/resources/attendance/js/request.js" type="text/javascript"></script>
</body>

</html>
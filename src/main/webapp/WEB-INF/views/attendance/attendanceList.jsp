<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>휴가 신청 내역</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

	<!-- datepicker Stylesheet -->
	<link href="/resources/datepicker_template/css/datepicker.css" rel="stylesheet">
    
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

	
	.btn-group {
		padding-right : 200px;
	}
	
	.btn-group>.btn {
	    position: relative;
	    flex: 1 1 auto;
	    font-weight: 500;
	}

	.modal-body p {
	    margin-top: 0;
	    margin-bottom: 0rem;
	    font-size: large;
	    font-weight: bold;
	    color: #191C24;
	}
	
	/* <p> 사용일자 */
	.modal-body div:nth-child(3) p {
		    width: 300px;
	}
	
	.table_div {
		margin-bottom : 3.0rem;
	}
	
	/* 셀렉트 박스 시작 */
	.holiday_select {
		margin-left : 35px;
	}
	
	.form-select {
		color : #009CFF;
		width: 150px;
    	text-align: center;
	}	
	
	select option {
		color : #757575;
	}

	
/* 	.datepicker_div{
	    margin-right: 2px;
	 }
	 */
	
	/* 셀렉트 박스 끝 */
	
	#datePicker_start, #datePicker_end {
		background-image : url('/resources/datepicker_template/img/icon.png');
		background-repeat : no-repeat;
		background-size : 20px;
	    background-position: 122px center;
   		margin-bottom: 0rem;
		height: 31px;
    	width: 150px;
    	padding-left: 20px;
    	color: #009CFF;
    	cursor : pointer;	
	}
	
	.datepicker_div, .timepicker_div {
	    margin-right: 2px;
	 }
	 
	 
	.form-control[type='time'] {
		height: 31px;
   		width: 150px;
   		color: #009CFF;
   		text-align : center;
   		cursor : pointer;	
  
	}
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
   
   
		<!-- 휴가 생성 모달 팝업 시작 -->
      
			     <div class="modal" id="modal" tabindex="-1">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
					        	<h5 class="modal-title">휴가 신청</h5>
					       		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					     	</div>
					      	<div class="modal-body">
					      		<div class="table_div">
					          	  <table id="requestInfoTable" class="table table-bordered">
					          	  		<tr>
					          	  			<th>신청자</th><td id="requestFromName">${holiday.name}</td>
					          	  		</tr>
										 <tr>
					          	  			<th>승인자</th><td id="requestToName">${holiday.managerName}</td>
					          	  		</tr>
								  </table>
								  <input id="requestedFromId" type="hidden" value="${holiday.requestedFromId}">
								  <input id="requestedToId" type="hidden" value="${holiday.requestedToId}">								 
								 </div>
									 <div class="d-flex align-items-center mb-3"> 
						          		<p>휴가 구분</p>
						          		<div class="holiday_select">
											<select  name='holidaySelectBox' class="form-select form-select-sm" aria-label=".form-select-sm example">
											  <option selected value='' disabled>휴가 구분</option>
											  <option value="연차">연차</option>
											  <option value="반차">반차</option>
											  <option value="반반차">반반차</option> 
											</select>
										</div>
									 </div>
									  
									  
									 <div class="d-flex align-items-center mb-3"> 
						          		<p>사용 일자</p>
										<!-- 시작시 기본 날짜 설정은 value를 이용 -->
										<div class="datepicker_div d-flex align-items-center">	
											<input type="text" id="datePicker_start" class="form-control" >
											<label class="mx-2"> ~ </label>
											<input type="text" id="datePicker_end" class="form-control">
									 	</div>
									 </div> 
									 
									 <!-- timepicker start -->
									 <div class="timepicker_div d-flex align-items-center justify-content-between mb-5">
						          	  	<p>시간 선택</p>
						          	  		<div class="d-flex align-items-center justify-content-between">
							          	  		<div class="cs-form">
													<input id='holidayTimePickerStart' type="time" class="form-control"/>
												</div>	
						          	  			<label class="mx-2">~</label>
							          	  		<div class="cs-form">
													<input id='holidayTimePickerEnd' type="time" class="form-control"/>
											     </div>
										    </div>
									  </div>	       	          	 
									  <!-- timepicker end -->
	
									  <div class=" row d-flex justify-content-between mb-2">
					    	  			<p class="mb-3">사유</p>
					    	  			<div>
					    	  			<textarea class="form-control" placeholder="필수 입력 사항입니다." id="text_area" style="height: 100px;"></textarea>
					    	  		  	</div>
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
       
         <div class="container container-fluid pt-4 px-4">           
	         <div class="d-flex align-items-center justify-content-between mx-4 my-4">   	
            	<h4>휴가 신청 내역</h4>
            	<button type="button" class="list_btn btn btn-primary">휴가신청</button>
	         </div>      
         <!-- 테이블 시작 -->

 
	         <div class="mx-4 my-4">
	            <table class="table table-hover">
	                 <tr>
	                    <th class="table-light">휴가종류</th>
	                    <th class="table-light">신청일자</th>                    
	                    <th class="table-light">처리일자</th>
	                    <th class="table-light">승인자</th>
	                    <th class="table-light">진행상태</th>
	                 </tr>
	                 <c:forEach var="holidayList" items="${holidayList}">
		                 <tr>
		                    <td>${holidayList.type}</td>
		                    <td>${holidayList.createdAt}</td>
		                    <td>${holidayList.processedAt}</td>
		                    <td>${holidayList.managerName}</td>
		                    <td><span class="badge bg-warning text-dark">결재대기</span></td>
		                 </tr>
	                 </c:forEach>
	            </table>
	            </div>
	             <!-- 페이징 버튼 -->
					<div class="d-flex align-items-center justify-content-center">
	                     <nav aria-label="Page navigation">
	                        <ul id="paginationDefault" class="pagination pt-3 pr-3">
	                        <!-- 현재 페이지가 1페이지일 경우 "이전" 버튼 없음 -->
		                    <c:if test="${pageNum != 1}">
	                           <li class="page-item"><a class="page-link" 
	                           							href="/attendance/list?pageNum=${pageNum-1}">이전</a>
	                           </li>
	                        </c:if> 
	                           <!-- pageNum-2가 0보다 작으면 1로 설정 -->
                 			   <!-- 파라미터 pageNum을 받아와서 로컬 pageNum으로 만들기 -->
	                            <c:set var="pageNum"
                          			 value="${param.pageNum != null ? param.pageNum : 1 }"/> 
	                        <%--    <c:set var="pageNum"
                          			 value="${param.pageNum != null && param.pageNum > 0 ? param.pageNum : 1 }"/> --%>
	                           <!-- pageNum-2가 1보다 작으면 1로 설정 -->
			                    <!-- begin 선언 -->
			                    <c:set var="begin" value="${pageNum-2}"/>
			                    <c:if test="${begin<1 }">
			                        <c:set var="begin" value="1"/>
			                    </c:if>
			                    
			                    <!-- pageNum이 총 페이지 수를 넘지 않도록 설정 -->
			                    <c:set var="end" value="${pageNum + 2}"/>
			                    <c:if test="${end > totalPage}">
			                        <c:set var="end" value="${totalPage}"/>
			                    </c:if>
			                    
			                    <!-- 페이지 번호 출력 -->
			                    <c:forEach var="i" begin="${begin}" end="${end}" step="1">
			                        <li class="page-item ${i == pageNum ? 'active' : ''}"><a
			                                class="page-link"
			                                href="/attendance/list?pageNum=${i}">${i}</a>
			                        </li>
			                    </c:forEach>
			                    
			                    <!-- 현재 페이지가 마지막 페이지일 경우 "다음" 버튼 없음 -->
			                   	<c:if test="${pageNum != totalPage}">
			                       <li class="page-item"><a class="page-link"
			                                                href="/attendance/list?pageNum=${pageNum+1}">다음</a>
			                       </li>
			                   	</c:if>
	                        </ul>
	                     </nav>
	                 </div> <!-- end of pagination -->
	                 
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

	<!-- datepicker-->
	<script src="/resources/datepicker_template/js/bootstrap-datepicker.min.js"></script> 
	<script src="/resources/datepicker_template/js/datepicker.js"></script>


    <!-- Template Javascript -->
    <script src="/resources/template/js/main.js" type="text/javascript"></script>
    <script src="/resources/attendance/js/list.js" type="text/javascript"></script>
</body>

</html>
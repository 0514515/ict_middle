<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>관리자-근무제 설정</title>
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

		
		.form-check {		
		    min-height: 0px;
		    padding-left: 0px;
		    margin-bottom: 0px;
		    margin-left: 1rem !important;
		    display: inline-block;
		}
 		
 		.table-light {      
	        color: #14A4FF;
    		border-color: #14A4FF;
    		--bs-table-bg: fff;
		}
		
		.table_th {
   		    border-block-color: #14A4ff;
   		    color: #14A4FF;
		}
		
		.check_total {
		   border: 1.5px solid #14A4ff;
		}
		
		.worksystem_select {
			width : fit-content;
		}
		
		.worksystem_select select {
		    width: 114.33px;
		    height: 38px;
		    color: #009CFF;
		}

		
		.work_start, .work_end, .work_system {
		    margin: 0 auto;
		    height: 30px !important;
		}

		.form-check .form-check-input {
		    float: left;
		    margin-left: -0.5em;
		}
		
		
		.workSystemBtn {
			width : 114.55px;
		}
		
		.workStartTime {
			width : 150px;
		}
		
			
/* 모달 커스텀 */
	#modal_workSystem {
		text-align : center;
		position: fixed;
		left: 50%;
		top: 75%;
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
		#modal_workSystem : before {
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

	
	.table_div {
		margin-bottom : 3.0rem;
	}
	
	/* 셀렉트 박스 시작 */
	.selectWorkSystem {
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
	
	.timepicker_div p {
		margin-right : 14px
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
      
			     <div class="modal" id="modal_workSystem" tabindex="-1">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
					        	<h5 class="modal-title">근무제 생성</h5>
					       		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					     	</div>
					      	<div class="modal-body">
									 <div class="d-flex align-items-center justify-content-center mb-4"> 
						          		<p>근무제 이름</p>
						          		<div class="selectWorkSystem">
											<select name='selectWorkSystemName' class="selectWorkSystemName form-select form-select-sm" aria-label=".form-select-sm example">
											  <option value="" selected disabled>근무제 선택</option>
											  <option class="option" value="정시 근무">정시 근무</option>
											  <option class="option" value="탄력 근무">탄력 근무</option>
											</select>
										</div>
									 </div>
									  
									 <!-- timepicker start -->
									 <div class="timepicker_div d-flex align-items-center justify-content-center mb-1">
							          	  <div class="workSystemTimePicker">	
							          	  	<div>
						          	  			<div class="d-flex align-items-center mb-2 ">
								          	  		<div>
								          	  			<p>출근 시간 설정</p>
									          	  	</div>
									          	  	<div class="cs-form">
														<input type="time" id="timePickerStart" class="form-control" required/>
													</div>	 
												 </div>
							          	  	</div>
							          	  		<div class="d-flex align-items-center mb-2">
  									          	  	<p>퇴근 시간 설정</p>
								          	  		<div class="cs-form">
														<input type="time" id="timePickerEnd" class="form-control"  required/>
													</div>	
											    </div>
											</div>        									    
									  </div>	       	          	 
									  <!-- timepicker end -->
					     	</div> 
					     	
					     	<!-- end of modal body -->
					     	
					     	<!-- start of modal footer -->
					     	
					      	<div class="modal-footer">
					        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        	<button type="button" class="insertWorkBtn btn btn-primary">근무제생성</button>
					      	</div>
					      	
					      	<!-- end fo modal footer -->
					      	
					    </div>
					 </div>
				 </div>
			
			       <!-- 모달 팝업 끝-->   

       
         <div class="container container-fluid pt-4 px-4">
         <div class="mx-4 my-4">
         	<h4>근무제 설정</h4>           
	      </div>   	
           <div class="mx-4 my-2">   	
    			 <div class="d-flex align-items-center justify-content-between mb-1"> 
	          		<div class="worksystem_select">
						<select name="departmentSelect" class="form-select form-select-sm" aria-label=".form-select-sm example">
						  <option selected value="전체부서">전체부서</option>
						  <option value="대표이사">대표이사</option>
						  <option value="경영지원부">경영지원부</option>
						  <option value="디자인부">디자인부</option>
						  <option value="영업부">영업부</option>
						</select>
					</div>
					<div  class="d-flex align-items-center justify-content-between mb-1">
	                    <div class="worksystem_select" style ="margin-right : 10px;">
							<select name="workSystemName" class="workSystem form-select form-select-sm" aria-label=".form-select-sm example">
							  		<option selected value='' disabled>근무유형</option>
							  		<option value="정시 근무">정시근무</option>
							  		<option value="탄력 근무">탄력근무</option>
							 </select>
						</div>
						<div class="worksystem_select" style ="margin-right : 10px;">
							<select name="workStartTime" class="workStartTime form-select form-select-sm" aria-label=".form-select-sm example" style=" width: 150px;">
								<option selected value='' disabled>시간선택</option>				  
								<!-- <option value="1"></option>
								<option value="2"></option>
								<option value="3"></option> -->
							</select>
						</div>
<!-- 						<div class="worksystem_select" style ="margin : 0 auto;">
							<select name="workEndTime" class="workEndTime form-select form-select-sm" aria-label=".form-select-sm example">
								  <option selected value='' disabled>종료시간</option>
								  <option value="1"></option>
								  <option value="2"></option>
								  <option value="3"></option>
							</select>
						</div> -->
						<div>
							<button type="button" class="saveInformation list_btn btn btn-primary">변경사항저장</button>
						</div>
					 </div>	
					 
					 	<div style="display: inline-flex; ">	
							<div class="workSystem" >
								<button type="button" class="workSystemBtn list_btn btn btn-primary">근무제생성</button>
					 		</div>	
				 		</div>
				 </div>
	        </div>      
         <!-- 테이블 시작 -->

 
	         <div class="mx-4 my-3">
	            <table class="table">
	                 <tr class="table_th" style="border-block-width: 1px;">
	                 	<td class="table-light">
		                 	<div class="form-check">
								<input class="check_total form-check-input" type="checkbox" value="" id="flexCheckDefaultAll">
							</div>
						</td>
	                    <th class="table-light">사원아이디</th>
	                    <th class="table-light">부서명</th>                    
	                    <th class="table-light">사원명</th>
	                    <th class="table-light">근무유형
	                    </th>
	                    <th class="table-light">근무시작</th>        
	                    <th class="table-light">근무종료</th>  	                 
	                 </tr>

	                 <tbody id = "defaultStaffTableBody">
   	                 <%-- <c:forEach var="staff" items="${staffList}" varStatus="status"> --%>
   	                 <c:forEach var="workSystemList" items="${workSystemList}"> 
	                 <tr>
	                 	<td>
	                 	<div id="staffListByDepartment" class="form-check">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
						</div>
						</td>
<%-- 		                    <td>${staff.staffId}</td>
		                    <td>${staff.departmentName}</td>
		                    <td>${staff.staffName}</td>
		                    <td>${workSystemList[status.index].workSystemName}</td>
		                    <td>${workSystemList[status.index].workSystemStartedAt}</td>
		                    <td>${workSystemList[status.index].workSystemEndedAt}</td> --%>
	                 		<td>${workSystemList.staffId}</td>
		                    <td>${workSystemList.departmentName}</td>
		                    <td>${workSystemList.staffName}</td>
		                    <td>${workSystemList.workSystemName}</td>
		                    <td>${workSystemList.workSystemStartedAt}</td>
		                    <td>${workSystemList.workSystemEndedAt}</td>
	                 
	                 </tr>
	                 </c:forEach>
	                 </tbody> 
	                 <tbody id="staffTableBody">
        <!-- 동적으로 행이 추가될 곳 -->
    				 </tbody>
	            </table>
	            </div>
	            
	            <!-- 페이징 버튼 -->
	            <div class="d-flex align-items-center justify-content-center">
	                     <nav aria-label="Page navigation">
	                        <ul id="paginationDefault" class="pagination pt-3 pr-3">
	                        <!-- 현재 페이지가 1페이지일 경우 "이전" 버튼 없음 -->
		                    <c:if test="${pageNum != 1}">
	                           <li class="page-item"><a class="page-link" 
	                           							href="/management/worksystem?pageNum=${pageNum-1}">이전</a>
	                           </li>
	                        </c:if> 
	                           <!-- pageNum-2가 0보다 작으면 1로 설정 -->
                 			   <!-- 파라미터 pageNum을 받아와서 로컬 pageNum으로 만들기 -->
	                            <c:set var="pageNum"
                          			 value="${param.pageNum != null ? param.pageNum : 1 }"/>
	                           
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
			                                href="/management/worksystem?pageNum=${i}">${i}</a>
			                        </li>
			                    </c:forEach>
			                    
			                    <!-- 현재 페이지가 마지막 페이지일 경우 "다음" 버튼 없음 -->
			                   	<c:if test="${pageNum != totalPage}">
			                       <li class="page-item"><a class="page-link"
			                                                href="/management/worksystem?pageNum=${pageNum+1}">다음</a>
			                       </li>
			                   	</c:if>
	                           
	                          <!--  <li class="page-item active"><a class="page-link" href="#">1</a></li>
	                           <li class="page-item"><a class="page-link" href="#">2</a></li>
	                           <li class="page-item"><a class="page-link" href="#">3</a></li>
	                           <li class="page-item"><a class="page-link" href="#">4</a></li>
	                           <li class="page-item"><a class="page-link" href="#">5</a></li>
	                           <li class="page-item"><a class="page-link" href="#">다음</a></li> -->
	                        </ul>
	                     </nav>
	                 </div>

				<!-- ajax에서 부서별로 페이징 구현 될 부분 -->
				<div class="d-flex align-items-center justify-content-center">
					<nav aria-label="Page navigation">
						<ul class="pagination pt-3 pr-3" id="pagination">
							<!-- 페이징 버튼은 여기에 동적으로 삽입됩니다 -->
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
    <script src="/resources/attendance/js/worksystem.js" type="text/javascript"></script>
</body>

</html>
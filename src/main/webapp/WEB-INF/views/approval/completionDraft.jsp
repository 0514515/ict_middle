<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>결재 상세보기</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/resources/template/img/favicon.ico" rel="icon">

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
 			font-family: "Noto Sans KR", sans-serif !important;	   	
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
    
    	/* 본문 높이값 _ footer올라오는 현상 방지 */
/*     	.container{
    		height:83%;
    	} */
    	
    	table{
    		text-align:center; 
    	}
    	
    	
    	/*뱃지 컬러 : 임시저장*/
    	.bg-success{
    		background-color:#D1E7DD !important;
    		color:#0A3622;
    	}
    	/*뱃지 컬러 : 회수*/
    	.bg-warning{
    		background-color:#FFF3CD !important;
    		color:#664D03;
    	}
    	
    	.form-select{
    		display:inline-block;
    		width:35%;
    	}
    	
    	.search_form{
    		text-align:right;
    	}
    	
    	.search_form form{
    		display:inline-block;
    	}
    	
    	.border-0{
    		border:1px solid #ced4da !important; 
    	}
    	
    	.form-check{
    		min-height:0px;
    		padding-left:0px;
    		margin-bottom:0px;
    		margin-left:0px !important; 
    		display:inline-block;
    	}
    	
    	.form-check-input{
    		margin-left:0px !important;
    	}
    	
    	.choice_list{
    		border:1px solid #14A4FF;
    		background-color:#fff;
    		color:#14A4FF;
    		font-weight:500;
    	}
    	
    	.pdf_btn, .print_btn{
    		border:1px solid #14A4FF;
    		background-color:#14A4FF;
    		color:#fff;
    		font-weight:500;
    	}
    	
    	.btn:hover{
    		color: #00539d;
    	}
    	
    	.list_btn{
    		text-align:right;
    	}
    	
    	.form_box{
    		border:1px solid #14A4FF;
    		background-color:#F3F6F9;
    		border-radius:10px;
    	}
    	
    	.col-form-label{
    		color:#14A4FF;
    	 	font-size:1.2em;
    		font-weight:500;
    	}
    	
    	.html_view{
    		overflow:scroll;
	    	padding: 30px;
		    border: 1px solid #ccc;
		    height: 500px;
		    background-color:#fff;	
    	}
    	
    	.title_div{
    		align-items :center;
    	}
    	
    	.title_txt{
    		color:#191C24;
    		font-size:18px;
    		font-weight:500;
    	}
    	
    	/* 프린트 영역 */
    	@media print {
		    /* 페이지 배경색 제거 */
		    body {
		        background: none !important;
		    }
		
		    /* 다른 스타일도 추가 가능 */
		    .html_view {
		        background: none; /* 배경색 제거 */
		    }
		
		    #pdf_view {
		        background: none;  /* PDF 보기 div의 배경색 제거 */
		    }
		}
		
		#pdf_view h2{
			text-align:center;
			margin-bottom:50px;
		}
		
		#approval_table, #approval_table th, #approval_table td{
			 border: 1px solid black; /* 테이블 테두리 확인 */
    		 border-collapse: collapse;
		}
    	
    	#approval_table th, #approval_table td{
    		padding: 8px 10px; 
    		text-align:left; 
    	}
    	
    	#approval_table tbody tr td{
    		width:135px;
    	}
    	
    	#approvalLine_table, #approvalLine_table th, #approvalLine_table td{
			 border: 1px solid black; /* 테이블 테두리 확인 */
    		 border-collapse: collapse;
		}
    	
    	#approvalLine_table th, #approvalLine_table td{
    		padding: 8px 10px; 
    		text-align:center; 
    	}
    	
    	.inline_div{
    		display:inline-block;

    	}
    	
    	.inline_div:nth-of-type(1) {
		    margin-right: 20px;
		}
    	
    	#approvalLine_table tbody .tr_height{
    		height:82px;
    	}
    	
    	#approvalLine_table tbody .tr_height td{
    		width:108px;
    	}
    	
    	#table_wrapper{
    		text-align:center;
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
			
		<!-- 본문 여백 -->
		<div class="container container-fluid pt-4 px-4">
			
			<div class="row g-0">	
		     <div class="col-sm-6 col-md-4">
				  <!-- 페이지 타이틀 -->
				  <div class="mx-4 mt-4">	
					<h4>결재 상세보기</h4>
				  </div>
		     </div>
			 <div class="col-sm-6 col-md-8"> 
				<!-- 목록 버튼 -->
	             <div class="mx-4 mt-4 list_btn">
				 	 <button class="btn choice_list" type="button">목록</button>
				 </div>
		     </div>
	     
		</div>
			
			<!-- 본문박스 -->
			
			<div class="form_box mx-4 my-4 px-5 py-5">
				
			  <div class="mb-3 row title_div">
			    <label for="inputTitle" class="col-sm-1 col-form-label">제목</label>
			    <div class="col-sm-11 title_txt">
			      <input type="text" class="form-control" id="inputTitle" name="title" value=" ${approval.title}">
			    </div>
			  </div>
				
			  <!-- html 출력 -->	
			  <div class="html_view">
			  	<div id="pdf_view">
			  	<h2>${approval.formTitle}</h2>
				<div id="table_wrapper">
					<div class="inline_div">
				  		<table id="approval_table">
				  			<tr>
				  				<th>기안자</th>
				  				<td>${approvalLine[0].staffName}</td>
				  			</tr>
				  			<tr>
				  				<th>소속부서</th>
				  				<td>${approvalLine[0].departmentName}</td>
				  			</tr>
				  			<tr>
				  				<th>기안일</th>
				  				<td>${approval.createdAt.split(" ")[0]}</td>
				  			</tr>
				  			<tr>
				  				<th>문서번호</th>
				  				<td>${approval.documentNumber}</td>
				  			</tr>
				  		</table>
				  	  </div>
					
					  <div class="inline_div">
					  	<table id="approvalLine_table">
					  		<tr>
					  			<td rowspan='3'>기<br/>안<br/>자</td>
					  			<td>${approvalLine[0].staffName} ${approvalLine[0].staffRank}</td>
					  			<td rowspan='3'>승<br/>인<br/>자</td>
					  			<td>${approvalLine[1].staffName} ${approvalLine[1].staffRank}</td>
					  			<td>${approvalLine[2].staffName} ${approvalLine[2].staffRank}</td>
					  		</tr>
					  		<tr class="tr_height">		  			
					  			<td></td>
					  			<td></td>
					  			<td></td>
					  		</tr>
					  		<tr>	  			
					  			<td>${approval.createdAt.split(" ")[0]}</td>
					  			<td>${approvalLine[1].signedAt}</td>
					  			<td>${approvalLine[2].signedAt}</td>
					  		</tr>
					  
					  	</table>
					  </div>
					</div>

			  		
			  		${ApprovalContent}
			  	</div>
			  </div>

			</div>	
     
             <!-- 버튼 -->
             <div class="d-grid gap-2 d-md-flex justify-content-md-center mx-4 my-4">
			 	 <button class="btn pdf_btn" type="button">PDF 다운로드</button>
			 	 <button class="btn print_btn" type="button">인쇄하기</button>
			 </div>
				
			
		</div> <!-- end of class = container-->
			
		
			<!-- 본문 끝 (body end) -->


            <!-- @@@ Footer Include @@@ -->
	        <jsp:include page="../../../common_layout/footer.jsp">
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
    
    <!-- SmartEditor2 라이브러리  --> 
	<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>

    <!-- Template Javascript -->
    <script src="/resources/template/js/main.js"></script>
    
    <!-- SmartEditor2 -->
	<script type="text/javascript" src = "/resources/template/js/notice-write.js"></script>
	
	    <!-- html 영역 pdf 다운로드 (jspdf, html2canvas)-->
 	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
	<script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
    <script type="text/javascript" src ="/resources/approval/js/pdf_print.js"></script>

    
</body>

</html>
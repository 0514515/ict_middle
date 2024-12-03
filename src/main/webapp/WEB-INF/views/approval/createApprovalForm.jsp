<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>DASHMIN - Bootstrap Admin Template</title>
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
    	.container{
    		height:83%;
    	}
    	
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
    	
    	.choice_del, .choice_list{
    		border:1px solid #14A4FF;
    		background-color:#fff;
    		color:#14A4FF;
    		font-weight:500;
    	}
    	
    	.choice_plus{
    		border:1px solid #14A4FF;
    		background-color:#14A4FF;
    		color:#fff;
    		font-weight:500;
    	}
    	
    	.btn{
    		width:9%;
    	}
    	.btn:hover{
    		color: #00539d;
    	}
    	
    	.form_box{
    		border:1px solid #14A4FF;
    		border-radius:10px;
    	}
    	
    	.col-form-label{
    		color:#191C24;
    	 	font-size:1.2em;
    		font-weight:500;
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
			
			<div class="mx-4 my-4">	
				<h4>결재 양식 관리</h4>
			</div>
			
			<!-- 버튼 -->
             <div class="d-grid gap-2 d-md-flex justify-content-md-end mx-4 my-4">
			 	 <button class="btn choice_list" type="button">목록</button>
			 </div>
			
			<!-- 본문박스 -->
			
			<div class="form_box mx-4 my-4 px-5 py-5">
				<form id="createForm" action="/form_save" method="post">
				  <div class="mb-3 row">
				    <label for="inputTitle" class="col-sm-2 col-form-label">결재 양식명</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="inputTitle" name="title">  <!-- input name 필수기입 -->
				    </div>
				  </div>
				  <div class="mb-3 row">
				    <label for="inputTitle" class="col-sm-2 col-form-label">문서 구분</label>
				    <div class="col-sm-10">
				      <select class="form-select" aria-label="Default select example" name="documentType">
						  <option selected>선택</option>
						  <option value="기안 문서">기안 문서</option>
						  <option value="인사 문서">인사 문서</option>
					  </select>
				    </div>
				  </div>
				
			<!-- SmartEditor2  -->
				<div class="jsx-2303464893 editor">
					<div class="fr-box fr-basic fr-top" role="application">
						<div class="fr-wrapper show-placeholder" dir="auto" >  <!-- style="overflow: scroll;" 제외 -->
							<textarea name="formContent" id="smartEditor"
								style="width: 100%; height: 412px;"></textarea>
						</div>
					</div>
				</div>

			</div>	
     
             <!-- 버튼 -->
             <div class="d-grid gap-2 d-md-flex justify-content-md-center mx-4 my-4">
			 	 <button class="btn choice_del" type="button">취소</button>
			 	 <button class="btn choice_plus" type="button">생성</button>
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

	<script type="text/javascript">
		
	// 생성 버튼 클릭시 실행될 함수 
	$('.choice_plus').click(function(){
	    // SmartEditor에서 textarea에 내용 업데이트
	    oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []); // 이 명령이 `textarea`의 값을 업데이트함
		
	    var htmlContent = document.getElementsByName("formContent")[0].value;
	    console.log(htmlContent);  // 콘솔에서 HTML 값 확인
	    
		// 폼 제출 (textarea 값은 자동으로 폼에 포함됨)
	    $('#createForm').submit(); // form 제출 
	})
	
	</script>

    
</body>

</html>
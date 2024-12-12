<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>DASHMIN - Bootstrap Admin Template</title>
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
   color: #191C24;
   font-weight: 500;
}

.card-header span {
   font-size: 13px;
   color: #14A4FF;
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

         <!-- 본문 여백 -->
         <div class="container container-fluid pt-4 px-4">

            <div class="mx-4 my-4">
               <h4>전자결재 현황</h4>
            </div>

            <!--    
         <div class="mx-4 my-4">
            <div class="row row-cols-1 row-cols-md-4 g-4">
              <div class="col">
                <div class="card border-primary mb-4 " style="max-width: 18rem;">
                 <div class="card-header"><span>[ 결재 받을 문서 ]</span><br/>결재 진행중</div>
                 <div class="card-body text-primary">
                   <p class="card-text"><span>3</span><span>건</span></p>
                 </div>
               </div>
              </div>
              <div class="col">
                 <div class="card border-primary mb-4 " style="max-width: 18rem;">
                 <div class="card-header"><span>[ 결재 받을 문서 ]</span><br/>승인 완료</div>
                 <div class="card-body text-primary">
                   <p class="card-text"><span>3</span><span>건</span></p>
                 </div>
               </div>
              </div>
              <div class="col">
                 <div class="card border-primary mb-4 " style="max-width: 18rem;">
                 <div class="card-header"><span>[ 결재 받을 문서 ]</span><br/>반려</div>
                 <div class="card-body text-primary">
                   <p class="card-text"><span>3</span><span>건</span></p>
                 </div>
               </div>
              </div>
              
              <div class="col">
                 <div class="card border-primary mb-4 " style="max-width: 18rem;">
                 <div class="card-header"><span>[ 결재 할 문서 ]</span><br/>승인할 문서</div>
                 <div class="card-body text-primary">
                   <p class="card-text"><span>3</span><span>건</span></p>
                 </div>
               </div>
              </div>
            </div>
           </div>
          -->
            <!-- 네비바 -->
            <!-- 
            <div class="mx-4 my-4">
               <div class="row g-0">
                  <div class="col-sm-6 col-md-6">
                     <ul class="nav nav-pills nav-fill">
                        <li class="nav-item"><a class="nav-link active"
                           aria-current="page" href="#">전체</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">결재 대기</a>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="#">진행중</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">승인 완료</a>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="#">반려</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">참조 문서</a>
                        </li>
                     </ul>
                  </div>
                  <div class="col-6 col-md-4"></div>
               </div>
            </div>
 -->
            <!-- 테이블 시작 -->
            <div class="mx-4 my-4">
               <table class="table table-hover" id="tableBody">
                  <tr>
                     <th class="table-light">문서번호</th>
                     <th class="table-light">제목</th>
                     <th class="table-light">기안자</th>
                     <th class="table-light">기안일</th>
                  </tr>
                  <c:forEach var="approval" items="${approvalList}">
                     <tr id="select_tr" data-id="${approval.id}" class="tableRow">
                        <td>${approval.id}</td>
                        <td>${approval.title}</td>
                        <td>${approval.staffName}</td>
                        <td>${approval.createdAt}</td>
                        <td></td>
                     </tr>
                  </c:forEach>
               </table>
            </div>

            <!-- pagination start -->
            <div class="d-flex align-items-center justify-content-center">
               <nav aria-label="Page navigation">
                  <ul class="pagination pt-3 pr-3">
                     <!-- 현재 페이지가 1페이지일 경우 "이전" 버튼 없음 -->
                     <c:if test="${pageNum != 1}">
                        <li class="page-item"><a class="page-link"
                           href="/approval?pageNum=${pageNum-1}">이전</a>
                        </li>
                     </c:if>

                     <!-- pageNum-2가 0보다 작으면 1로 설정 -->
                     <!-- 파라미터 pageNum을 받아와서 로컬 pageNum으로 만들기 -->
                     <c:set var="pageNum"
                        value="${param.pageNum != null ? param.pageNum : 1 }" />

                     <!-- pageNum-2가 1보다 작으면 1로 설정 -->
                     <!-- begin 선언 -->
                     <c:set var="begin" value="${pageNum-2}" />
                     <c:if test="${begin<1 }">
                        <c:set var="begin" value="1" />
                     </c:if>

                     <!-- pageNum이 총 페이지 수를 넘지 않도록 설정 -->
                     <c:set var="end" value="${pageNum + 2}" />
                     <c:if test="${end > totalPage}">
                        <c:set var="end" value="${totalPage}" />
                     </c:if>

                     <!-- 페이지 번호 출력 -->
                     <c:forEach var="i" begin="${begin}" end="${end}" step="1">
                        <li class="page-item ${i == pageNum ? 'active' : ''}"><a
                           class="page-link"
                           href="/approval?pageNum=${i}">${i}</a>
                        </li>
                     </c:forEach>

                     <!-- 현재 페이지가 마지막 페이지일 경우 "다음" 버튼 없음 -->
                     <c:if test="${pageNum != totalPage}">
                        <li class="page-item"><a class="page-link"
                           href="/approval?pageNum=${pageNum+1}">다음</a>
                        </li>
                     </c:if>
                  </ul>
               </nav>
            </div>
            <!-- pagination end -->

         </div>
         <!-- end of class = container-fluid -->







         <!-- 본문 끝 (body end) -->


         <!-- @@@ Footer Include @@@ -->
         <jsp:include page="../../../common_layout/footer.jsp">
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
   <script>
   // 행 선택시 상세 화면(완료화면)으로 전환 
   $(document).on('click', '#select_tr', function(){
      var id = $(this).data('id');  // 클릭한 행의 data-id 값을 가져옴 
      console.log(id);
      // 해당 trId를 가지고 상세화면으로 이동 
      window.location.href = "approval/writeDraft/completionDraft?approvalId=" + id; 
   })
   </script>
</body>

</html>
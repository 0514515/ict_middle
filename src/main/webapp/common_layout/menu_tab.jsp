<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Sidebar Start -->
<div class="sidebar pe-4 pb-3">
	<nav class="navbar bg-light navbar-light">
		<a href="/member/detail" class="navbar-brand mx-4 mb-3">
			<h3 class="text-primary">
				<i class="fa fa-hashtag me-2"></i>PEOPLE WING
			</h3>
		</a>
		<div class="d-flex align-items-center ms-4 mb-4 w-100"
			id="profileArea">
			<div class="position-relative">
				<img id="profileImage" alt="" src="${menuStaff.picture!=null?menuStaff.picture:'https://icons.iconarchive.com/icons/bootstrap/bootstrap/512/Bootstrap-person-fill-icon.png'}" style="width: 60px; height: 70px;">
			</div>
			<div class="ms-3">
				
				<h6 class="mb-0" id="name">${menuStaff.staffName}</h6>
				<span id="rank">${menuStaff.rank}</span>
			</div>
		</div>
		<div class="navbar-nav w-100">
			<!--  <a href="index.html" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>  -->
			<div class="nav-item dropdown">
				<a href="#" class="nav-link dropdown-toggle"
					data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>근태관리</a>
				<div class="dropdown-menu bg-transparent border-0">
					<a href="/attendance" class="dropdown-item">나의 근태 현황</a> <a href="/attendance/modify"
						class="dropdown-item">출/퇴근 관리 및 근무제 변경</a> <a href="/attendance/holiday"
						class="dropdown-item">휴가 관리 및 신청</a> <a href="/attendance/list"
						class="dropdown-item">휴가 신청 내역</a>
				</div>
			</div>

			<div class="nav-item dropdown">
				<a href="#" class="nav-link dropdown-toggle"
					data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>전자결재</a>
				<div class="dropdown-menu bg-transparent border-0">
					<a href="/approval" class="dropdown-item">전자결재 현황</a>
					<a href="/approval/writeDraft"
						class="dropdown-item">기안 작성하기</a>
				</div>
			</div>
			<div class="nav-item dropdown">
				<a href="#" class="nav-link dropdown-toggle"
					data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>급여</a>
				<div class="dropdown-menu bg-transparent border-0">
					<a href="/salary/specification" class="dropdown-item">급여 조회</a>
				</div>
			</div>

			<div class="nav-item dropdown">
				<a href="#" class="nav-link dropdown-toggle"
					data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>사원</a>
				<div class="dropdown-menu bg-transparent border-0">
					<a href="/member"
							class="dropdown-item">사원 목록</a>
				</div>
			</div>
			<c:if test="${menuStaff.authority>=9999}">
				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle"
						data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>관리자
						설정</a>
					<div class="dropdown-menu bg-transparent border-0">
					<a href="/management/worksystem"
							class="dropdown-item">[근태] 근무제 관리</a>
							<a href="/approval/approvalForm"
							class="dropdown-item">[전자결재] 문서 양식 관리</a>
							<a href="/member"
							class="dropdown-item">[회사] 사원 목록</a>
							<a href="/department"
							class="dropdown-item">[회사] 부서 목록</a>
							<a href="/chart"
							class="dropdown-item">[통계] 차트</a>
							<a href="/salary/base/index"
							class="dropdown-item">[급여] 기본급 항목 관리</a>
							<a href="/salary/base"
							class="dropdown-item">[급여] 사원 기본급 설정</a>
							<a href="/salary/specify"
							class="dropdown-item">[급여] 급여 명세</a>
					</div>
				</div>
			</c:if>
			
			
			<a href="/logout" class="nav-item nav-link"><i
				class="fa fa-keyboard me-2"></i>로그아웃</a>

			<!-- <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="signin.html" class="dropdown-item">Sign In</a>
                            <a href="signup.html" class="dropdown-item">Sign Up</a>
                            <a href="404.html" class="dropdown-item">404 Error</a>
                            <a href="blank.html" class="dropdown-item">Blank Page</a>
                        </div>
                    </div>
                 -->
		</div>
	</nav>
</div>
<!-- Sidebar End -->

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="/resources/menutab.js"></script>
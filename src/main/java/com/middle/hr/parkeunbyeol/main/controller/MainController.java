package com.middle.hr.parkeunbyeol.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	
	// 근태 관리 _ 나의 근태 현황 메인
	@GetMapping("attendance")
	public String attendenceMain() {
		return "attendance/attendanceMain";
	}

	
	// 휴가 관리 및 신청_나의 일정 메인
	@GetMapping("attendance/holiday")
	public String attendenceHoliday() {
		return "attendance/attendanceHoliday";
	}
	
	// 휴가 신청 내역_휴가 신청 내역 메인
	@GetMapping("attendance/list")
	public String attendenceList() {
		return "attendance/attendanceList";
	}

	// 관리자 설정 _ 정정 및 휴가 요청서_ 근태/휴가 관리 메인
	@GetMapping("management/request")
	public String managementRequest() {
		return "attendance/managementRequest";
	}
	
	// 관리자 설정 _ 근무제 설정 메인
	@GetMapping("management/worksystem")
	public String managementWorksystem() {
		return "attendance/managementWorksystem";
	}	
	
}

package com.middle.hr.parkeunbyeol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	
	// 근태 관리 _ 나의 근태 현황 메인
	@GetMapping("attendence")
	public String attendenceMain() {
		return "attendence/attendenceMain";
	}
	
	// 출퇴근 관리 및 근무제 변경_출퇴근 현황 메인
	@GetMapping("attendence/modify")
	public String attendenceModify() {
		return "attendence/attendenceModify";
	}
	
	// 휴가 관리 및 신청_나의 일정 메인
	@GetMapping("attendence/holiday")
	public String attendenceHoliday() {
		return "attendence/attendenceHoliday";
	}
	
	// 휴가 신청 내역_휴가 신청 내역 메인
	@GetMapping("attendence/list")
	public String attendenceList() {
		return "attendence/attendenceList";
	}

	// 관리자 설정 _ 정정 및 휴가 요청서_ 근태/휴가 관리 메인
	@GetMapping("management/request")
	public String managementRequest() {
		return "attendence/managementRequest";
	}
	
	// 관리자 설정 _ 근무제 설정 메인
	@GetMapping("management/worksystem")
	public String managementWorksystem() {
		return "attendence/managementWorksystem";
	}	
	
}

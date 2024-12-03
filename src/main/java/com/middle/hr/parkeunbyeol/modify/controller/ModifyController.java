package com.middle.hr.parkeunbyeol.modify.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ModifyController {

	// 출퇴근 관리 및 근무제 변경_출퇴근 현황 메인
	@GetMapping("attendance/modify")
	public String attendenceModify() {
		return "attendance/attendanceModify";
	}
	

	
}

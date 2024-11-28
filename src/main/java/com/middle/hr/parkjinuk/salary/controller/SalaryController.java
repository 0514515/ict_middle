package com.middle.hr.parkjinuk.salary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SalaryController {

	// 기본급 항목 관리 페이지
	@GetMapping("salary/base/index")
	public String getSalaryIndexManagement() {
		return "salary/salaryIndexManagement";
	}
	
	// 사원 기본급 설정 페이지
	@GetMapping("salary/base")
	public String getSalarySettingList() {
		return "salary/salarySettingList";
	}
	
	// 수당 관리 페이지
	@GetMapping("commission")
	public String getCommissinManagement() {
		return "commission/commissionManagement";
	}
}

package com.middle.hr.parkeunbyeol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("attendence")
	public String attendenceMain() {
		return "attendence/attendenceMain";
	}
	

	@GetMapping("attendence/modify")
	public String attendenceModify() {
		return "attendence/attendenceModify";
	}
	
	@GetMapping("attendence/holiday")
	public String attendenceHoliday() {
		return "attendence/attendenceHoliday";
	}
	
	@GetMapping("attendence/list")
	public String attendenceList() {
		return "attendence/attendenceList";
	}
	
	
	@GetMapping("management/request")
	public String managementRequest() {
		return "attendence/managementRequest";
	}
	
	
	
}

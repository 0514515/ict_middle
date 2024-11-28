package com.middle.hr.parkeunbyeol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("attendence")
	public String attendenceMain() {
		return "attendence/attendenceMain";
	}
	
	@GetMapping("attendence/record")
	public String attendenceRecord() {
		return "attendence/attendenceRecord";
	}

	@GetMapping("attendence/modify")
	public String attendenceModify() {
		return "attendence/attendenceModify";
	}
	
	@GetMapping("attendence/holiday")
	public String attendenceHoliday() {
		return "attendence/attendenceHoliday";
	}
	
}

package com.middle.hr.parkjinuk.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class MemberController {
	
	@GetMapping("member")
	public String getMemberList() {
		return "member/memberList";
	}
	
	@GetMapping("member/registration")
	public String getMemberRegistrationForm() {
		
		return "member/memberRegistrationForm";
	}
	
	@GetMapping("member/modification")
	public String getMemberModificationForm() {
		return "member/memberModificationForm";
	}
	
	@GetMapping("member/permission")
	public String getMemberPermissionList() {
		return "member/memberPermissionList";
	}
}

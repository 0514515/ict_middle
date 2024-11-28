package com.middle.hr.parkjinuk.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class MemberController {
	
	// 사원 목록 페이지
	@GetMapping("member")
	public String getMemberList() {
		return "member/memberList";
	}
	
	// 사원 등록 페이지
	@GetMapping("member/registration")
	public String getMemberRegistrationForm() {
		
		return "member/memberRegistrationForm";
	}
	
	// 사원 수정 페이지
	@GetMapping("member/modification")
	public String getMemberModificationForm() {
		
		return "member/memberModificationForm";
	}
	
	// 사원 권한 관리 페이지
	@GetMapping("member/permission")
	public String getMemberPermissionList() {
		return "member/memberPermissionList";
	}
}

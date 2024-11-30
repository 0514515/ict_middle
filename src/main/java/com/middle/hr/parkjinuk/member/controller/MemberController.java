package com.middle.hr.parkjinuk.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.middle.hr.parkjinuk.member.controller.dto.Login;

@Controller
public class MemberController {
	
	// 사원 목록 페이지
	@GetMapping("member")
	public String getMemberList() {
		return "member/memberList";
	}
	
	// 사원 등록 페이지
	@GetMapping("member/new")
	public String getMemberRegistrationForm() {
		
		return "member/memberRegistrationForm";
	}
	
	// 사원 수정 페이지
	@GetMapping("member/modify")
	public String getMemberModificationForm() {
		
		return "member/memberModificationForm";
	}
	
	// 사원 권한 관리 페이지
	@GetMapping("member/permission")
	public String getMemberPermissionList() {
		return "member/memberPermissionList";
	}
	
	// 사원 정보 조회 페이지
	@GetMapping("member/detail")
	public String getMemberDetail(HttpSession httpSession, Model model) {
		
		/**
		 * To-Do
		 * 
		 * 서비스 레이어에서 회원 정보 가져와서 모델에 추가하기
		 */
		
		return "member/memberDetail";
	}
	
	// 로그인
	@PostMapping("login")
	public String login(Login login, HttpSession session) {
		
		//로그인 아이디가 공백이거나 null이면 로그인 페이지에서 안넘어감
		if(login.getLoginId() == null || login.getLoginId().isBlank()) {
			return "redirect:index.jsp";
		}
		
		/**
		 * To-Do
		 * 
		 * 서비스 레이어에서 아이디와 비밀번호를 바탕으로 회원 정보 검사하기
		 */
		
		//세션에 로그인 아이디 저장
		session.setAttribute("loginId", login.getLoginId());

		//로그인 아이디를 포함한 세션을 가지고 페이지 이동
		return "redirect:member/detail";
	}
	
	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:index.jsp";
	}
}

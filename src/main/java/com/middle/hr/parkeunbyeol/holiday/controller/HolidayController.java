package com.middle.hr.parkeunbyeol.holiday.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.middle.hr.parkjinuk.staff.service.StaffService;

@Controller
public class HolidayController {

	
	@Autowired
	StaffService staffService;
	
	// 휴가 관리 및 신청_나의 일정 메인
	@GetMapping("attendance/holiday")
	public String attendenceHoliday(HttpSession httpSession, Model model) {
		
		// 1. 세션으로부터 로그인 id 얻어오기 
		String loginId = httpSession.getAttribute("loginId").toString();
		System.out.println("세션에 저장된 로그인 사원의 id : " + loginId);
		
		// 2. 로그인id로 사원id 조회
		Integer staff_id = staffService.searchStaffIdByLoginId(loginId);
		// 사원 id 잘 받아왔는지 확인하기
		System.out.println("스태프아이디:" + staff_id);
		
		// 3. 사원id로 사원 정보 가져오기 (관리자 id와 회사 id-휴가 테이블 정보 출력 용도)
		
		
		// 4. 가져온 회사 id로 휴가 테이블 정보 가져오기 
		
		return "attendance/attendanceHoliday";

	} // end of attendenceHoliday

	
	// 휴가 요청
	
	
	
	
}// end of holidayController

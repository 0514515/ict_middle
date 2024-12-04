package com.middle.hr.parkeunbyeol.attendance.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.middle.hr.parkeunbyeol.attendance.service.AttendanceService;
import com.middle.hr.parkeunbyeol.attendance.vo.Attendance;
import com.middle.hr.parkjinuk.staff.service.StaffService;

@Controller
public class AttendanceController {
	
	@Autowired
	AttendanceService attendanceService;
	
	@Autowired
	StaffService staffService;
	
	// 근태 관리 _ 나의 근태 현황 메인 페이지
	@GetMapping("attendance")
	public String attendanceMain() {
		
		return "attendance/attendanceMain";
	}
	
	// 출근 시간 db에 입력하기
	@GetMapping("recode")
	@ResponseBody
	public String insertStartAt(HttpSession httpSession) {
		// 출근 시간 잘 넘어가는지 확인
		System.out.println("출근 시간 입력 확인:" );
		
		String loginId = (String)httpSession.getAttribute("loginId");
		
		System.out.println(loginId);
		
		// 로그인 아이디로 staff의 기본키 id값 받아오기
		
//		System.out.println(staff_id);
		
//		attendanceService.insertStartAt(staff_id);
		
		
		 // 서비스 단으로 인자 보냄
		return "ok"; // js파일의 ajax의 result로 넘어감
	}

	// 출근 시간 조회
	@RequestMapping("selectRecode")
	public String selectStartAt(Integer staff_id) {
		System.out.println("출근 시간 출력 하기" + staff_id );
		
		attendanceService.selectStartAt(staff_id); 
		
		return null;
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

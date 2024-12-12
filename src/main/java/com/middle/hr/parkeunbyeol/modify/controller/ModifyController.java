package com.middle.hr.parkeunbyeol.modify.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.middle.hr.parkeunbyeol.holiday.service.HolidayService;
import com.middle.hr.parkeunbyeol.holiday.vo.Holiday;
import com.middle.hr.parkeunbyeol.modify.service.ModifyService;
import com.middle.hr.parkeunbyeol.modify.vo.Modify;
import com.middle.hr.parkjinuk.staff.service.StaffService;

@Controller
public class ModifyController {

	@Autowired
	ModifyService modifyservice;
	
	@Autowired
	HolidayService holidayservice;
	
	@Autowired
	StaffService staffService;
	
	// 출퇴근 관리 및 근무제 변경_출퇴근 현황 메인
	@GetMapping("attendance/modify")
	public String attendenceModify(HttpSession httpSession, Model model) {

		// 1. 세션으로부터 로그인 id 얻어오기 
		String loginId = httpSession.getAttribute("loginId").toString();
		System.out.println("세션에 저장된 로그인 사원의 id : " + loginId);
		
		// 2. 로그인id로 사원id 조회
		Integer staff_id = staffService.searchStaffIdByLoginId(loginId);
		// 사원 id 잘 받아왔는지 확인하기
		System.out.println("스태프아이디:" + staff_id);
		
		// 3. 사원id로 사원 정보 가져오기 (관리자 id와 회사 id-휴가 테이블 정보 출력 용도)
		Holiday holiday = holidayservice.getStaffInfoByStaffId(staff_id);
		
		Integer companyId = holiday.getCompanyId();
		System.out.println("회사 id : " +  companyId);
		
		// 3. 사원id와 회사id로 근무 기록 테이블 조회
		List<Modify> historyByCompanyIdStaffId = modifyservice.getWorkHistoryByCompanyIdStaffId(companyId, staff_id);
		System.out.println("근무 기록 테이블 조회 : " + historyByCompanyIdStaffId );
		
		model.addAttribute("historyByCompanyIdStaffId", historyByCompanyIdStaffId);
		model.addAttribute("holiday", holiday);
		
		return "attendance/attendanceModify";
	}
	
	 
	  @PostMapping("insertModify") 
	  public String insertModify(HttpSession httpSession , @RequestParam String modifyTimePickerStartInput, @RequestParam String modifyTimePickerEndInput, @RequestParam String managerNameInput, @RequestParam String reasonInput) {
	  
		  //회사 id 요청자 id 허가자id
		  // 1. 세션으로부터 로그인 id 얻어오기 
		  String loginId = httpSession.getAttribute("loginId").toString();
		  System.out.println("세션에 저장된 로그인 사원의 id : " + loginId);
			
		  // 2. 로그인id로 사원id 조회
		  Integer staff_id = staffService.searchStaffIdByLoginId(loginId);
		  // 사원 id 잘 받아왔는지 확인하기
		  System.out.println("스태프아이디:" + staff_id);
		 
		  // 3. 사원id로 사원 정보 가져오기 (관리자 id와 회사 id-휴가 테이블 정보 출력 용도)
		  Holiday holiday = holidayservice.getStaffInfoByStaffId(staff_id);
		
		  Integer requestedToId = holiday.getRequestedToId();
		  Integer companyId = holiday.getCompanyId();
		  System.out.println("회사 id : " +  companyId);
		  
		  // 시간만 포함된 입력값을 처리하기 위한 DateTimeFormatter
		  DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
		    
		  // 문자열로 들어온 시간을 LocalTime으로 파싱
		  LocalTime startTime = LocalTime.parse(modifyTimePickerStartInput, timeFormatter);
		  LocalTime endTime = LocalTime.parse(modifyTimePickerEndInput, timeFormatter);
		    
		  // 현재 날짜와 결합하여 LocalDateTime 생성
		  LocalDate currentDate = LocalDate.now(); // 현재 날짜 가져오기
		  LocalDateTime startDateTime = LocalDateTime.of(currentDate, startTime); // 날짜와 시간 결합
		  LocalDateTime endDateTime = LocalDateTime.of(currentDate, endTime); // 날짜와 시간 결합

		  // 데이터를 DB에 저장할 때 'YYYY-MM-DD HH:mm:ss' 형식으로 변환
		  DateTimeFormatter dbFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		  String formattedStartTime = startDateTime.format(dbFormatter); // DB에 저장할 시작 시간
		  String formattedEndTime = endDateTime.format(dbFormatter);     // DB에 저장할 종료 시간

		  
		  Modify modify = new Modify();
		  modify.setAfterStartingTime(formattedStartTime);
		  modify.setAfterEndingTime(formattedEndTime); 
		  modify.setManagerName(managerNameInput);
		  modify.setReasonOfModification(reasonInput);
		  modify.setRequestedToId(requestedToId);
		  modify.setRequestedFromId(staff_id);
		  modify.setCompanyId(companyId);
		  
		  System.out.println("==========" + modify.toString());
		  
		  modifyservice.insertModify(modify);
	  
	  
		 return "redirect:/attendance/modify";
	  
	  }
	  
	   
	   
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	
}

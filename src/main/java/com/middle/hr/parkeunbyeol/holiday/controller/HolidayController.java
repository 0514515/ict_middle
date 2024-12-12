package com.middle.hr.parkeunbyeol.holiday.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.middle.hr.parkeunbyeol.holiday.service.HolidayService;
import com.middle.hr.parkeunbyeol.holiday.vo.Holiday;
import com.middle.hr.parkjinuk.staff.service.StaffService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class HolidayController {

	@Autowired
	HolidayService holidayservice;
	
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
		Holiday holiday = holidayservice.getStaffInfoByStaffId(staff_id);
		System.out.println("사원id로 해당 사원의 이름과 담당자 id뽑아오기 : " + holiday);
		
		model.addAttribute("holiday", holiday);
		
		// 4. 가져온 회사 id와 사원id로 휴가 테이블 정보 가져오기 
		Integer companyIdByStaffId = holiday.getCompanyId();
		System.out.println("사원id로 얻어온 companyId 확인 : " + companyIdByStaffId);
		
		List<Holiday> holidayList = holidayservice.getHolidayListByCompanyId(companyIdByStaffId, staff_id);
		System.out.println("가져온 휴가 테이블 확인 : " + holidayList);
		
		model.addAttribute("holidayList", holidayList);
				
		
		return "attendance/attendanceHoliday";

	} // end of attendenceHoliday

	
	
	
	  // 휴가 요청 입력 후 리스트에 붙이기 
	  @PostMapping("insertHoliday")
	  @ResponseBody
	  public Map<String, Object> insertHoliday(HttpSession httpSession,Model model, @RequestBody Holiday holidayRequest){
		  
			// 1. 세션으로부터 로그인 id 얻어오기 
			String loginId = httpSession.getAttribute("loginId").toString();
			System.out.println("세션에 저장된 로그인 사원의 id : " + loginId);
			
			// 2. 로그인id로 사원id 조회
			Integer staff_id = staffService.searchStaffIdByLoginId(loginId);
			// 사원 id 잘 받아왔는지 확인하기
			System.out.println("스태프아이디:" + staff_id);
			
			// 3. 사원id로 사원 정보 가져오기 (관리자 id와 회사 id-휴가 테이블 정보 출력 용도)
			Holiday staffInfo = holidayservice.getStaffInfoByStaffId(staff_id);
			System.out.println("사원id로 해당 사원의 이름과 담당자 id뽑아오기 : " + staffInfo);
						
			// 4. 가져온 회사 id와 사원id로 휴가 테이블 정보 가져오기 
			Integer companyIdByStaffId = staffInfo.getCompanyId();

			// 
			Holiday holiday = new Holiday();
			holiday.setCompanyId(companyIdByStaffId);							// 회사id
			holiday.setEndedAt(holidayRequest.getEndedAt());					// 휴가 종료 일시
			holiday.setStartedAt(holidayRequest.getStartedAt());				// 휴가 시작 일시
			holiday.setEndedTime(holidayRequest.getEndedTime());				// 휴가 시작 시간
			holiday.setStartedTime(holidayRequest.getStartedTime());			// 휴가 종료 시간
			holiday.setRequestedFromId(holidayRequest.getRequestedFromId());	// 휴가 신청자
			holiday.setRequestedToId(holidayRequest.getRequestedToId());		// 휴가 승인자
			holiday.setType(holidayRequest.getType());							// 휴가 종류
			holiday.setReasonOfRequest(holidayRequest.getReasonOfRequest());	// 휴가 사유
			
			System.out.println("============" + holiday.toString());
			
			// 휴가 테이블에 휴가 생성하기
			holidayservice.insertHolidayList(holiday);
			
			// JSON 응답 반환
		    Map<String, Object> response = new HashMap<String, Object>();
		    response.put("status", "success");  // 상태를 success로 설정
		    response.put("message", "휴가가 성공적으로 등록되었습니다.");
		  
		  return response;
	  }
	 	
	
		
	  // 휴가 신청 내역_휴가 신청 내역 메인
	  @GetMapping("attendance/list")
	  public String attendenceList(HttpSession httpSession, Model model, Integer pageNum) {
		  	
			// 기본값
			if (pageNum == null || pageNum < 0) {
				pageNum = 1;
			}
		  
		  	// 1. 세션으로부터 로그인 id 얻어오기 
			String loginId = httpSession.getAttribute("loginId").toString();
			System.out.println("세션에 저장된 로그인 사원의 id : " + loginId);
			
			// 2. 로그인id로 사원id 조회
			Integer staff_id = staffService.searchStaffIdByLoginId(loginId);
			// 사원 id 잘 받아왔는지 확인하기
			System.out.println("스태프아이디:" + staff_id);
			
			// 3. 사원id로 사원 정보 가져오기 (관리자 id와 회사 id-휴가 테이블 정보 출력 용도)
			Holiday holiday = holidayservice.getStaffInfoByStaffId(staff_id);
			System.out.println("사원id 회사id 담당자id : " + holiday);
			
			model.addAttribute("holiday", holiday);
			
			// 4. 회사id
			Integer companyId = holiday.getCompanyId();
			System.out.println("사원id로 얻어온 companyId 확인 : " + companyId);
			
			Map<String, Object> holidayListPagination = holidayservice.getHolidayListPagination(companyId, staff_id, pageNum, 10);
			
			model.addAttribute("holidayList", holidayListPagination.get("holidayList"));
			model.addAttribute("totalPage", holidayListPagination.get("totalPage"));
			model.addAttribute("pageNum", pageNum + "");	// 현재 페이지
			
			System.out.println("======holidayListPaginaton model 확인 : " + model.toString());

		  return "attendance/attendanceList";   
		 
	  }

		 

	  
	
}// end of holidayController

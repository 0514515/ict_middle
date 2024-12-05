package com.middle.hr.parkeunbyeol.attendance.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String attendanceMain(HttpSession httpSession, Model model) {
		
		// 세션에서 workingStatus 값 받아오기
		String workingStatus = (String) httpSession.getAttribute("workingStatus");
		
		// 만약 세션에 workingStatus 값이 없다면
		if( workingStatus == null ) {
			
		//세션으로부터 로그인 id 얻어와서
		String loginId = httpSession.getAttribute("loginId").toString();
			System.out.println("아이디 받아옴?" +  loginId);
		
		// 세션에서 얻어온 로그인 아이디로 staffId 얻어온 다음에
		Integer staffId = staffService.searchStaffIdByLoginId(loginId);
		System.out.println("인자로 넘길 수 있음?" + staffId);
		
		// (1) 위에서 얻어온 staffId를 인자로 넘겨서 db에 있는 그 해당 staffId의 workingStatus(상태)를 가져온다.
		// 가져온 그 workingStatus를 dbworkingStatus이라 칭한다.
		String dbworkingStatus = attendanceService.getWorkingStatusByLoginId(staffId);
		
			System.out.println("getWorkingStatusByLoginId() " + dbworkingStatus);
		// (2) 위에서 얻어온 staffId를 인자로 넘겨서 db에 있는 그 해당 staffId를 통해 해당 사원의 정보를 가져온다.
		/*
		 * Attendance attendance = new Attendance(); attendance.setStaffId(staffId);
		 * 
		 * System.out.println("인자로 넘길 수 있음?" + attendance.toString());
		 */		
		
		Attendance staffInfo = attendanceService.getStaffInfoByLoginId(staffId);
		//System.out.println("StaffInfo => getStaffInfoByLoginId 값 확인:  " + staffInfo.toString());
		
		// 만약 working_history 테이블에 staffId가 없어서 null값 오류가 뜬다면
		
		if( staffInfo == null ) {
			// 직접 해당 사원의 staffId값을 working_history 테이블에 넣어주기 
			attendanceService.insertDefaultStaffIdByLoginId(staffId);
			System.out.println("if문 안에서의 staffId : " + staffId); 
		}
		
		// 만약 db에서 가져온 workingStatus의 값인 dbworkingStatus가 null 값이라면? ( 다시말해 해당 사원의 workingStatus의 값이 db에 없다면)
		if( dbworkingStatus == null ) {
			// 기본 값으로 "퇴근"을 준다. -> 그래야 실행했을 때 출근을 누를 수 있는 버튼이 나옴. 이게 없다면 페이지를 켰을 때 받아온 값이 없으므로 버튼이 아예 안나옴
			dbworkingStatus = "퇴근";
		}
		// null일 경우 여기에 "출근"이라 찍힘 -> 디폴트 값이 잘 먹혔는지 확인
		System.out.println("세션에 저장된 workingStatus db에서 확인, null값이면 퇴근 찍힘:" + dbworkingStatus);
				
		// 세션에 workingStautus 값을 저장 / 44행에서 가져온 값을 세션에 저장해줌 
		httpSession.setAttribute("workingStatus", dbworkingStatus); 
		
		// jsp에서 사용할 수 있도록 모델에 추가함
		model.addAttribute("staffId",staffId); 
		
		} // end of first it{}
		
		model.addAttribute("workingStatus", workingStatus); //--1
		
		
		return "attendance/attendanceMain"; // 이 jsp의 페이지로 리턴
	}
	
	// 출근 시간 db에 입력하기
	@GetMapping("recode")
	@ResponseBody
	public String insertStartAt(HttpSession httpSession, @RequestParam String workingStatus) {
		// 출근 시간 잘 넘어가는지 확인
		System.out.println("출근 시간 입력 확인:");
		
		// 세션에서 로그인 아이디 받아오기
		String loginId = (String)httpSession.getAttribute("loginId");
		// 세션에서 로그인 아이디 잘 받아왔는지 확인하기
		System.out.println("로그인 아이디: " + loginId);
		
		// 로그인 아이디로 staff의 기본키 id값 받아오기
		// 로그인 아이디로 스태프아이디를 검색해서 그걸 staff_id에 넣는다.-> 이 코드는 반장님이 자체적으로 만들어서 우리는 그냥 그걸 갖다 쓰는것
		Integer staff_id = staffService.searchStaffIdByLoginId(loginId);
		// 스태프 아이디를 잘 받아왔는지 확인하기
		System.out.println("스태프아이디:" + staff_id);
		
		// workin_status 값 확인하기
		System.out.println("ajax에서 넘어온 working_status 값 :" +  workingStatus);
		
		// 세션에 workingStautus 상태 저장하기
		httpSession.setAttribute("workingStatus", workingStatus);
		
		// 세션에서 얻어온 스태프 아이디와 ajax에서 넘어온 working_status를 넘기기
		attendanceService.insertStartAt(staff_id, workingStatus);		
		 // 서비스 단으로 인자 보냄
		return "ok"; // js파일의 ajax의 result로 넘어감
	
	}

	// db에서 출근 시간, 사원명, 직책 받아오기
	@RequestMapping("selectRecode")
	@ResponseBody
	public Attendance selectStartAt(HttpSession httpSession, Model model) {	
		
		  // 세션에서 로그인 아이디 받아오기 String loginId =
		  String loginId = (String)httpSession.getAttribute("loginId"); // 세션에서 로그인 아이디 잘 받아왔는지 확인하기
		  System.out.println(loginId);
		 
		 // 로그인 아이디로 staff의 기본키 id값 받아오기 // 로그인 아이디로 스태프아이디를 검색해서 그걸 staff_id에 넣는다.->
		// 이 코드는 반장님이 자체적으로 만들어서 우리는 그냥 그걸 갖다 쓰는것 Integer staffId =
		 Integer staff_id = staffService.searchStaffIdByLoginId(loginId); // 스태프 아이디를 잘 받아왔는지 확인하기
		 System.out.println(staff_id);

		 
		// 얻어온 스태프 아이디를 넘겨서 출근 시간 조회 하기 
		Attendance attendance = new Attendance();
		attendance.setStaffId(staff_id);
		 
		Attendance attendanceStartAt = attendanceService.selectStartAt(attendance);	
		System.out.println("selectStartAt :" + attendanceStartAt.toString());
		
		model.addAttribute("attendanceStartAt", attendanceStartAt); // 여기의  attendanceStartAt는 뷰페이지의 이름이 됨
		
		return attendanceStartAt;
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

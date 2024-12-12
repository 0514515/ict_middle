package com.middle.hr.parkeunbyeol.attendance.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.middle.hr.parkeunbyeol.attendance.service.AttendanceService;
import com.middle.hr.parkeunbyeol.attendance.vo.Attendance;
import com.middle.hr.parkeunbyeol.holiday.service.HolidayService;
import com.middle.hr.parkeunbyeol.holiday.vo.Holiday;
import com.middle.hr.parkjinuk.staff.service.StaffService;

@Controller
public class AttendanceController {

	@Autowired
	AttendanceService attendanceService;

	@Autowired
	StaffService staffService;
	
	@Autowired
	HolidayService holidayservice;

	// 근태 관리 _ 나의 근태 현황 메인 페이지
	@GetMapping("attendance")
	public String attendanceMain(HttpSession httpSession, Model model) {

		// 세션에서 workingStatus 값 받아오기
		String workingStatus = (String) httpSession.getAttribute("workingStatus");
		
		System.out.println("d워킹 스테이터스==========="+ workingStatus +"=========");

		// 만약 세션에 workingStatus 값이 없다면?
		if ( workingStatus == null || workingStatus.equals("출근") ) {
			
			// 세션으로부터 로그인 id 얻어와서
			String loginId = httpSession.getAttribute("loginId").toString();
			System.out.println("아이디 받아옴? 세션에서 받아온 loginId : " + loginId);

			// 세션에서 얻어온 로그인 아이디로 staffId 얻어온 다음에
			Integer staffId = staffService.searchStaffIdByLoginId(loginId);
			System.out.println("인자로 넘길 수 있음? staffId : " + staffId);

			// (1) 해당 사원의 출근 상태 db로부터 가져오기 = dbworkingStatus
			// 가져온 그 workingStatus를 dbworkingStatus이라 칭한다.
			String dbworkingStatus = attendanceService.getWorkingStatusByLoginId(staffId);
			System.out.println("getWorkingStatusByLoginId() db단의 초기 출근 상태 값: " + dbworkingStatus);			
			System.out.println("아이디 확인 : " + staffId);
			 
			 // (2) 해당 사원의 기본 정보 가져오기
			Attendance defaultStaffInfo = attendanceService.getStaffInfoByLoginId(staffId);
			System.out.println("defaultStaffInfo 첫번째 확인 : " + defaultStaffInfo);
		
	
			// (2)-1 기본 사원 정보 없을 시 => 테이블에 staffId가 없어서 사원 정보 조회가 안된다면
			if ( defaultStaffInfo == null) {
				// 직접 해당 사원의 staffId 값을 working_history 테이블에 넣어주기
				attendanceService.insertDefaultStaffIdByLoginId(staffId);
								
				// staffId를 넣어준 뒤 다시 사원 정보 출력하기
				Attendance afterInsertStaffId = attendanceService.getStaffInfoByLoginId(staffId);
				System.out.println("db에 staffId 입력 후 getStaffInfoByLoginId() 호출 :  " + afterInsertStaffId.toString() );
				
				// 신규 및 정보 없는 사원 - 회사 id 가져와서 휴가 리스트 출력
				Integer afterInsertCompanyId = afterInsertStaffId.getCompanyId();
				System.out.println("afterInsertCompanyId  : " +  afterInsertCompanyId);
				
				// 가져온 회사 id와 사원id로 휴가 테이블 정보 가져오기(holiday 서비스단에서 넘겨 받는 인자 => afterInsertCompanyId = companyIdByStaffId, staffId = staffId)			
				List<Holiday> newStaffHolidayList = holidayservice.getHolidayListByCompanyId(afterInsertCompanyId, staffId);
				System.out.println("가져온 휴가 테이블 확인 : " + newStaffHolidayList);
				
				
				httpSession.setAttribute("afterInsertStaffId", afterInsertStaffId); // 받아온 값들 세션에 저장하기				
				model.addAttribute("afterModel", afterInsertStaffId); // jsp 파일에 사용하기 위해 model에 저장
				model.addAttribute("newStaffHolidayList", newStaffHolidayList); // 신규 직원 휴가 리스트

			} 
				
			// (2)-2 만약 기본 사원 정보가 있다면
			if ( defaultStaffInfo != null ) {
				// ( working_status에 staffId가 있어서 조회가 가능할 경우) 사원 정보 불러오기
				Attendance getDefaultStaffInfo = attendanceService.getStaffInfoByLoginId(staffId); 		
				System.out.println("insertDefaultStaffIdByLoginId이 not null 일 때 getStaffInfoByLoginId() 호출 :" + getDefaultStaffInfo.toString());
				
				// 기존 사원 - 회사id 가져와서 휴가 리스트 출력
				Integer defaultCompanyId = getDefaultStaffInfo.getCompanyId();
				System.out.println("defaultCompanyId : " + defaultCompanyId);
				
				// 가져온 회사 id와 사원id로 휴가 테이블 정보 가져오기 ( holiday 서비스단에서 넘겨 받는 인자 => defaultCompanyId = companyIdByStaffId, staffId = staffId)			
				List<Holiday> defaultStaffHolidayList = holidayservice.getHolidayListByCompanyId(defaultCompanyId, staffId);
				System.out.println("가져온 휴가 테이블 확인 : " + defaultStaffHolidayList);
				
				httpSession.setAttribute("getDefaultStaffInfo", getDefaultStaffInfo); // 받아온 값을 세션에 저장하기		
				model.addAttribute("getModel", getDefaultStaffInfo); //// jsp 파일에 사용하기 위해 model에 저장
				model.addAttribute("defaultStaffHolidayList", defaultStaffHolidayList); // 기존 직원의 경우 휴가 리스트 입력

			}
 
			// ==== 사원 정보 입력 및 조회 후 workingStatus 기준으로 버튼 CSS 새로 고침 시 고정 값 주기 ======
			
			// 만약 db에서 가져온 workingStatus의 값인 dbworkingStatus가 null 값이라면? ( 다시말해 해당 사원의workingStatus의 값이 db에 없다면)
			
			// (1)-1 workingStatus의 값이 db에 없다면
			if (dbworkingStatus == null) {
				// 기본 값으로 "퇴근"을 준다. -> 그래야 실행했을 때 출근을 누를 수 있는 버튼이 나옴. 이게 없다면 페이지를 켰을 때 받아온 값이 없으므로 버튼이 아예 안나옴
				dbworkingStatus = "퇴근";
			}
			
			// null일 경우 여기에 "출근"이라 찍힘 -> 디폴트 값이 잘 먹혔는지 확인
			System.out.println("세션에 저장된 workingStatus db에서 확인, null값이면 퇴근 찍힘:" + dbworkingStatus);

			// 세션에 workingStautus 값을 저장 / 44행에서 가져온 값을 세션에 저장해줌
			httpSession.setAttribute("defaultWorkingStatus", dbworkingStatus);

			// jsp에서 사용할 수 있도록 모델에 추가함
			model.addAttribute("staffId", staffId);

		} // end of first if{}
		
		model.addAttribute("defaultWorkingStatus", workingStatus); // --1
		
		return "attendance/attendanceMain"; // 이 jsp의 페이지로 리턴
	}

	
	// 출근 시간 db에 입력하기
	@GetMapping("recode")
	@ResponseBody
	public String insertStartAt(HttpSession httpSession, @RequestParam String workingStatus, @RequestParam String staffId) {
		// 출근 시간 잘 넘어가는지 확인
		System.out.println("출근 시간 입력 확인:");

		// 세션에서 로그인 아이디 받아오기
		String loginId = (String) httpSession.getAttribute("loginId");
		// 세션에서 로그인 아이디 잘 받아왔는지 확인하기
		System.out.println("로그인 아이디: " + loginId);

		// 로그인 아이디로 staff의 기본키 id값 받아오기
		// 로그인 아이디로 스태프아이디를 검색해서 그걸 staff_id에 넣는다.-> 이 코드는 반장님이 자체적으로 만들어서 우리는 그냥 그걸 갖다
		// 쓰는것
		Integer staff_id = staffService.searchStaffIdByLoginId(loginId);
		// 스태프 아이디를 잘 받아왔는지 확인하기
		System.out.println("스태프아이디:" + staff_id);
	
		// 오늘 날짜 기준 "출근"인 데이터가 있는지 조회
		String searchRecode = attendanceService.searchWorkingHistoryByStaffId(staff_id).toString();
		 System.out.println("오늘 날짜기준으로 startAt(출근기록)이 있으면 false 없으면 true : " + searchRecode);
		  
		if ( searchRecode.equals("true") ) {
			

		/*		if( workingStatus.equals("출근") )  {
					
					System.out.println( "ajax에서 넘어온 workingStatus 값 (if=출근) :   " + workingStatus);
					
					// 세션에서 얻어온 스태프 아이디와 ajax에서 넘어온 working_status를 넘기기
					attendanceService.insertRecode(staff_id, workingStatus);
					
				}
		*/		
				System.out.println( "ajax에서 넘어온 workingStatus 값 (if=출근) :   " + workingStatus);
				
				// 세션에서 얻어온 스태프 아이디와 ajax에서 넘어온 working_status를 넘기기
				attendanceService.insertRecode(staff_id, workingStatus);

				
		}	else if ( searchRecode == "false") {
			
			
/*			if ( workingStatus.equals("퇴근") ) {
				
				System.out.println( "ajax에서 넘어온 workingStatus 값  (if=퇴근) :   " + workingStatus);
				
				// 세션에서 얻어온 스태프 아이디와 ajax에서 넘어온 working_status를 넘기기
				attendanceService.updateRecode(staff_id, workingStatus);
				
			} 
*/
			System.out.println( "ajax에서 넘어온 workingStatus 값  (if=퇴근) :   " + workingStatus);
			
			// 세션에서 얻어온 스태프 아이디와 ajax에서 넘어온 working_status를 넘기기
			attendanceService.updateRecode(staff_id, workingStatus);
			
			
		}
		
		 
		// workin_status 값 확인하기
		System.out.println("ajax에서 넘어온 working_status 값 :" + workingStatus);

		
	/*	if( workingStatus.equals("출근") )  {
			
			System.out.println( "ajax에서 넘어온 workingStatus 값 (if=출근) :   " + workingStatus);
			
			// 세션에서 얻어온 스태프 아이디와 ajax에서 넘어온 working_status를 넘기기
			attendanceService.insertRecode(staff_id, workingStatus);
			
		}
		
		if ( workingStatus.equals("퇴근") ) {
			
			System.out.println( "ajax에서 넘어온 workingStatus 값  (if=퇴근) :   " + workingStatus);
			
			// 세션에서 얻어온 스태프 아이디와 ajax에서 넘어온 working_status를 넘기기
			attendanceService.updateRecode(staff_id, workingStatus);
			
		} 
	*/
		
		System.out.println("여기는??????????????");
		// 세션에 workingStautus 상태 저장하기
		httpSession.setAttribute("workingStatus", workingStatus);

		// 서비스 단으로 인자 보냄
		return searchRecode; // js파일의 ajax의 result로 넘어감

	}

	// db에서 출근 시간, 사원명, 직책 받아오기
	@RequestMapping("selectRecode")
	@ResponseBody
	public Attendance selectStartAt(HttpSession httpSession, Model model) {

		// 세션에서 로그인 아이디 받아오기 String loginId =
		String loginId = (String) httpSession.getAttribute("loginId"); // 세션에서 로그인 아이디 잘 받아왔는지 확인하기
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

		
//		String timeOnlyStart = attendanceStartAt.getStartAt().substring(11,19);
//		System.out.println("시간 substirng 확인 : " + timeOnlyStart);
		
		
//		model.addAttribute("timeOnlyStart", timeOnlyStart);
		model.addAttribute("attendanceStartAt", attendanceStartAt); // 여기의 attendanceStartAt는 뷰페이지의 이름이 됨
		/* model.addAttribute("attendanceStartAt", timeOnlyStart); */
	
		return attendanceStartAt;
	}

	@PostMapping("sendData")
	@ResponseBody
//	public Attendance getStaffInfo(HttpSession httpSession,@RequestParam("workingStatus") String workingStatus, @RequestParam("staffId") String staffId) {
	public Attendance getStaffInfo(HttpSession httpSession, @RequestParam("staffId") String staffId) {		
		// 세션에서 로그인 아이디 받아오기 String loginId =
		String loginId = (String) httpSession.getAttribute("loginId");
		
		Integer staff_id = staffService.searchStaffIdByLoginId(loginId);
		
		Attendance staffInfo = attendanceService.getStaffInfoByLoginId(staff_id);
		System.out.println("jsp에 보낼 StaffInfo 값 확인 : " + staffInfo.toString());
		
//		String timeOnlyStart = StaffInfo.getStartAt().substring(11, 19);
//		System.out.println("페이지에 넘길 시간 확인 : " + timeOnlyStart);
	
		
		//System.out.println(workingStatus);
		System.out.println(staffInfo.getStaffId());
		
		return staffInfo;
	}
	
	
	// 관리자 설정 _ 정정 및 휴가 요청서_ 근태/휴가 관리 메인
	@GetMapping("management/request")
	public String managementRequest() {
		return "attendance/managementRequest";
	}



}

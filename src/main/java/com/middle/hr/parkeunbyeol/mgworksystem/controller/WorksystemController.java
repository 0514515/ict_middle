package com.middle.hr.parkeunbyeol.mgworksystem.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.deser.impl.CreatorCandidate.Param;
import com.middle.hr.parkeunbyeol.mgworksystem.service.WorksystemService;
import com.middle.hr.parkeunbyeol.mgworksystem.vo.Worksystem;
import com.middle.hr.parkjinuk.staff.service.StaffService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class WorksystemController {

	@Autowired
	WorksystemService worksystemservice;
	
	@Autowired
	StaffService staffService;
	
	// 관리자 설정 _ 근무제 설정 메인
	@GetMapping("management/worksystem")
	public String managementWorksystem(HttpSession httSession, Model model, Integer pageNum) {
		
		// 기본값
		if (pageNum == null || pageNum < 0) {
			pageNum = 1;
		}
		//if (pageSize == null || pageSize <= 0) pageSize = 10; // 페이지 사이즈가 0 이하일 경우 기본값 10
		
		// 1. 세션으로부터 로그인 id 얻어오기 
		String loginId = httSession.getAttribute("loginId").toString();
		System.out.println("세션에 저장된 로그인 사원의 id : " + loginId);
		
		// 2. 세션에서 얻어온 로그인 id로 해당 사원의 company 아이디 가져오기
		Integer companyId = staffService.searchCompanyIdByLoginId(loginId);
		System.out.println("로그인 id로 가져온 회사id : " + companyId);		
		
		// 화면을 먼저 켰을 때 전체부서에 대한 리스트불러오기
		Map<String, Object> resultList = worksystemservice.searchStaffList(companyId, pageNum, 10); // 10번까지만 페이징
		
		//model.addAttribute("staffList", resultList.get("staffList"));
		model.addAttribute("workSystemList", resultList.get("workSystemList"));
		model.addAttribute("totalPage", resultList.get("totalPage"));
		model.addAttribute("pageNum", pageNum + ""); //현재 페이지  
		
		System.out.println("model 확인========================= :      "  + model.toString());
		
		return "attendance/managementWorksystem";
	
	
	}; // end of managementWorkksystem 


	@PostMapping("insert")
	@ResponseBody 
	public Map<String, String> insert(HttpSession httSession, @RequestParam("selectWorkName") String selectWorkName, @RequestParam("timePickerStart") String timePickerStart, @RequestParam("timePickerEnd")String timePickerEnd ) {

	    Map<String, String> response = new HashMap<String, String>();
		
		//companyId 값 가져오기
		
		try {
	    System.out.println("확인 :  " + selectWorkName);
		
		// 1. 세션으로부터 로그인 id 얻어오기
		String loginId = httSession.getAttribute("loginId").toString();
		System.out.println("세션에 저장된 로그인 사원의 id*********** : " + loginId);
		
		// 2. 세션에서 얻어온 로그인 id로 해당 사원의 company 아이디 가져오기
		Integer companyId = staffService.searchCompanyIdByLoginId(loginId);
		System.out.println("로그인 id로 가져온 회사id************ : " + companyId);

		// vo에 담기
		
		  Worksystem worksystem = new Worksystem(); 
		  worksystem.setCompanyId(companyId);
		  worksystem.setWorkSystemName(selectWorkName);
		  worksystem.setWorkSystemStartedAt(timePickerStart);
		  worksystem.setWorkSystemEndedAt(timePickerEnd);
		 
		// 3. 얻어온 회사 id 입력시키기
		worksystemservice.insertWorkSystemByCompanyId(worksystem); 
		
		 // 성공 응답
        response.put("status", "success");
        response.put("message", "입력 완료되었습니다.");
        
    } catch (Exception e) {
        // 예외 발생 시 실패 응답
        response.put("status", "error");
        response.put("message", "입력 실패: " + e.getMessage());
    }
		
		 
		return response;
	
	}; // end of managementWorkksystem	


	@PostMapping("selectTime")
	@ResponseBody
	public List<Worksystem> selectTimeByWorkName(@RequestParam("workName") String workName, Model model){
		
		//1. ajax에서 넘어온 근무제 이름을 기준으로 근무제 시간 끌어오기	
		List<Worksystem> result = worksystemservice.selectTimeByWorkName(workName);
		System.out.println("회사 id로 근무제 데이터 끌어오는 거 확인 : " + result.toString());
		
		model.addAttribute("list", result) ; // "별칭" 이 별칭이 view페이지에서 사용됨
		System.out.println("==========" + model);
		
		return result;
	}
	
	
	@PostMapping("management/worksystem/department")
	@ResponseBody
	public Map<String, Object> selectDepartment(@RequestParam("department") String department, HttpSession httSession, Model model,  Integer pageNum){
		
		// 기본값
		if (pageNum == null || pageNum < 0) {
			pageNum = 1;
		}
				
		
		// 1. 세션으로부터 로그인 id 얻어오기
		String loginId = httSession.getAttribute("loginId").toString();
		System.out.println("세션에 저장된 로그인 사원의 id : " + loginId);
				
		// 2. 세션에서 얻어온 로그인 id로 해당 사원의 company 아이디 가져오기
		Integer companyId = staffService.searchCompanyIdByLoginId(loginId);
		System.out.println("로그인 id로 가져온 회사id : " + companyId);
		
		// 3. companyId와, paramDepartment 값으로 해당 사원 리스트 출력
		Map<String, Object> result = worksystemservice.searchStaffBycompanIdDeptname(companyId, department, pageNum, 10);
		System.out.println("회사id와 부서명으로 해당 사원 조회 " + result.toString());
		
		model.addAttribute("staffListByDepartment", result.get("staffListByCompanyIdDeptName"));
		model.addAttribute("totalCount", result.get("totalCount"));
		model.addAttribute("pageNum", pageNum + "");
		
		
		System.out.println("****************값 확인 : " + model);
		
		return  result;
		
	}
	
	
	
	
	
	
	
	
	
	
	

} // end of controller



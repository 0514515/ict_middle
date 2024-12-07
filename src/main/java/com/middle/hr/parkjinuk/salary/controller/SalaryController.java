package com.middle.hr.parkjinuk.salary.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.middle.hr.parkjinuk.salary.service.SalaryService;
import com.middle.hr.parkjinuk.salary.vo.Commission;
import com.middle.hr.parkjinuk.salary.vo.Salary;
import com.middle.hr.parkjinuk.salary.vo.StaffCommission;
import com.middle.hr.parkjinuk.staff.service.StaffService;
import com.middle.hr.parkjinuk.staff.vo.Staff;

@Controller
public class SalaryController {

	@Autowired
	SalaryService salaryService;

	@Autowired
	StaffService staffService;

	// 기본급 항목 관리 페이지
	@GetMapping("salary/base/index")
	public String getSalaryIndexManagement(HttpSession session, Model model) {

		// 세션에서 로그인 아이디 받아오기
		String loginId = session.getAttribute("loginId").toString();

		// 로그인 아이디 기본급 목록 가져오기
		List<Salary> salaryList = salaryService.searchAllSalaryByLoginId(loginId);

		model.addAttribute("salaryList", salaryList);

		return "salary/salaryIndexManagement";
	}

	// 로그인 아이디 기본급 목록 가져오기 ajax
	@GetMapping("salary/base/index/refresh")
	@ResponseBody
	public List<Salary> getSalaryIndex(@SessionAttribute("loginId") String loginId) {
		return salaryService.searchAllSalaryByLoginId(loginId);
	}

	// 기본급 항목 추가 ajax
	@PostMapping("/salary/base/index")
	public Integer createBaseSalary(@RequestBody Salary salary, HttpSession session) {
		return salaryService.createSalary(salary);
	}

	// 기본급 항목 업데이트 ajax
	@PatchMapping("/salary/base/index")
	public Integer updateBaseSalary(@RequestBody Salary salary) {
		return salaryService.updateSalary(salary);
	}

	// 기본급 항목 삭제 ajax
	@DeleteMapping("/salary/base/index")
	public Integer deleteBaseSalary(@RequestBody Salary salary) {
		return salaryService.deleteSalary(salary);
	}

	// 해당하는 기본급 항목을 받고 있는 직원 조회
	@GetMapping("salary/base/staff")
	@ResponseBody
	public List<Staff> getStaffByBaseSalary(Salary salary) {
		List<Staff> result = salaryService.searchStaffByBaseSalary(salary);
		return result;
	}

	// 사원 기본급 설정 페이지
	@GetMapping("salary/base")
	public String getSalarySettingList(String searchOption, String searchKeyword, Integer pageNum, Model model,
			HttpSession httpSession) {
		// 기본값 (첫 페이지 로딩 시 searchOption, searchKeyword가 null임)
		if (searchOption == null)
			searchOption = "name";
		if (searchKeyword == null)
			searchKeyword = "";
		if (pageNum == null || pageNum < 0)
			pageNum = 1;

		String loginId = httpSession.getAttribute("loginId").toString();

		// 검색 옵션과 키워드로 페이지네이션 검색 (사원 검색)
		Map<String, Object> result = salaryService.searchStaffWithSalaryByLoginId(loginId, searchOption, searchKeyword,
				pageNum, 10);

		// 회사 번호로 기본급 전체 조회
		List<Salary> salaryList = salaryService.searchAllSalaryByLoginId(loginId);

		model.addAttribute("staffList", result.get("staffList")); // 사원 목록
		model.addAttribute("salaryList", salaryList); // 부서 목록
		model.addAttribute("totalPage", result.get("totalPages")); // 최대 페이지
		model.addAttribute("pageNum", pageNum + ""); // 현재 페이지

		// 검색 도구 값 유지용
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchKeyword", searchKeyword);
		return "salary/salarySettingList";
	}

	// 사원 기본급 수정
	@PatchMapping("salary/base")
	@ResponseBody
	public String updateStaffSalary(@RequestBody List<Staff> staffList) {

		salaryService.updateStaffSalary(staffList);

		return "redirect:/member/permission";
	}

	// 수당 관리 페이지
	@GetMapping("salary/commission")
	public String getCommissionManagement(HttpSession session, Model model) {

		String loginId = session.getAttribute("loginId").toString();

		List<Commission> commissionList = salaryService.searchAllCommissionByLoginId(loginId);

		model.addAttribute("commissionList", commissionList);

		return "salary/commissionManagement";
	}

	// 추가 수당 추가
	@PostMapping("salary/commission")
	@ResponseBody
	public Integer createCommission(@RequestBody Commission commission) {
		return salaryService.createCommission(commission);
	}

	// 추가 수당 목록 refresh용 ajax
	@GetMapping("salary/commission/list")
	@ResponseBody
	public List<Commission> getCommissionList(HttpSession session) {
		String loginId = session.getAttribute("loginId").toString();

		List<Commission> commissionList = salaryService.searchAllCommissionByLoginId(loginId);
		
		return commissionList;
	}
	
	// 추가수당 일괄 업데이트용 ajax
	@PatchMapping("/salary/commission")
	@ResponseBody
	public Integer updateCommissions(@RequestBody List<Commission> commissionList) {
		return salaryService.updateCommission(commissionList);
	}
	
	// 추가수당을 받고 있는 사원 refresh용 ajax
	@PostMapping("salary/commission/staff/list")
	@ResponseBody
	public List<StaffCommission> getStaffCommissionList(@RequestBody List<Commission> commission){
		List<StaffCommission> staffCommissionList = salaryService.searchStaffCommission(commission);
		System.out.println(staffCommissionList);
		return staffCommissionList;
	}

	// 급여 명세 페이지
	@GetMapping("salary/specify")
	public String getSalarySpecifyingForm() {
		return "salary/salarySpecifyingForm";
	}

	// 급여 명세 리스트
	@GetMapping("salary/specification")
	public String getSalarySpecificationList() {
		return "salary/salarySpecificationList";
	}
}

package com.middle.hr.parkjinuk.salary.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.middle.hr.parkjinuk.salary.service.SalaryService;
import com.middle.hr.parkjinuk.salary.vo.Salary;
import com.middle.hr.parkjinuk.staff.vo.Staff;

@Controller
public class SalaryController {

	@Autowired
	SalaryService salaryService;

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
	@PostMapping("salary/base/index")
	public void createBasaSalary(@RequestBody Salary salary, HttpSession session) {
		System.out.println(salary);
	}

	// 기본급 항목 업데이트 ajax
	@PatchMapping("salary/base/index")
	public void updateBasaSalary(@RequestBody Salary salary) {
		System.out.println(salary);
	}

	// 해당하는 기본급 항목을 받고 있는 직원 조회
	@GetMapping("salary/base/staff")
	public List<Staff> getStaffByBaseSalary(Salary salary) {
		return salaryService.searchStaffByBaseSalary(salary);
	}

	// 사원 기본급 설정 페이지
	@GetMapping("salary/base")
	public String getSalarySettingList() {
		return "salary/salarySettingList";
	}

	// 수당 관리 페이지
	@GetMapping("salary/commission")
	public String getCommissinManagement() {
		return "salary/commissionManagement";
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

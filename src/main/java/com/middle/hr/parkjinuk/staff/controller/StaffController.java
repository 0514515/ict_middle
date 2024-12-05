package com.middle.hr.parkjinuk.staff.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.middle.hr.parkjinuk.staff.service.StaffService;
import com.middle.hr.parkjinuk.staff.vo.Department;
import com.middle.hr.parkjinuk.staff.vo.Login;
import com.middle.hr.parkjinuk.staff.vo.Staff;

@Controller
public class StaffController {

	@Autowired
	private StaffService staffService;

	// 사원 목록 페이지
	@GetMapping("member")
	public String getMemberList(String searchOption, String searchKeyword, Integer pageNum, Model model,
			HttpSession httpSession) {
		// 기본값 (첫 페이지 로딩 시 searchOption, searchKeyword가 null임)
		if (searchOption == null)
			searchOption = "name";
		if (searchKeyword == null)
			searchKeyword = "";
		if (pageNum == null || pageNum < 0)
			pageNum = 1;

		String loginId = httpSession.getAttribute("loginId").toString();

		// 검색 옵션과 키워드로 페이지네이션 검색 (회사 검색)
		Map<String, Object> result = staffService.searchStaffList(loginId, searchOption, searchKeyword, pageNum, 10);

		model.addAttribute("staffList", result.get("staffList")); // 회사 목록
		model.addAttribute("totalPage", result.get("totalPages")); // 최대 페이지
		model.addAttribute("pageNum", pageNum + ""); // 현재 페이지

		// 검색 도구 값 유지용
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchKeyword", searchKeyword);

		return "/member/memberList";
	}

	// 사원 등록 페이지
	@GetMapping("member/new")
	public String getMemberRegistrationForm(Model model, HttpSession httpSession) {

		String loginId = httpSession.getAttribute("loginId").toString();
		model.addAttribute("companyId", staffService.searchCompanyIdByLoginId(loginId));

		return "member/memberRegistrationForm";
	}

	// 사원 등록 URI (관리자)
	@PostMapping("member/new")
	public String createMember(Staff staff) {
		
		Integer result = staffService.createStaff(staff);

		if (result == 1) {
			System.out.println("@@@ 등록 성공 @@@");
		}

		return "redirect:/member";
	}
	
	// 부서 목록 페이지
	@GetMapping("department")
	public String getDepartmentList(String searchOption, String searchKeyword, Integer pageNum, Model model,
			HttpSession httpSession) {
		// 기본값 (첫 페이지 로딩 시 searchOption, searchKeyword가 null임)
		if (searchOption == null)
			searchOption = "name";
		if (searchKeyword == null)
			searchKeyword = "";
		if (pageNum == null || pageNum < 0)
			pageNum = 1;

		String loginId = httpSession.getAttribute("loginId").toString();

		// 검색 옵션과 키워드로 페이지네이션 검색 (회사 검색)
		Map<String, Object> result = staffService.searchDepartmentWithtotalStaffCountByLoginId(loginId, searchOption, searchKeyword, pageNum, 10);

		model.addAttribute("departmentList", result.get("departmentList")); // 회사 목록
		model.addAttribute("totalPage", result.get("totalPages")); // 최대 페이지
		model.addAttribute("pageNum", pageNum + ""); // 현재 페이지

		// 검색 도구 값 유지용
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchKeyword", searchKeyword);

		return "/member/departmentList";
	}
	
	// 부서 등록 페이지
	@GetMapping("department/new")
	public String getDepartmentRegistrationForm(Model model, HttpSession httpSession) {

		String loginId = httpSession.getAttribute("loginId").toString();
		model.addAttribute("companyId", staffService.searchCompanyIdByLoginId(loginId));

		return "member/departmentRegistrationForm";
	}
	
	// 부서 등록 URI
	@PostMapping("department/new")
	public String createDepartment(Department department) {
		
		Integer result = staffService.createDepartment(department);

		if (result == 1) {
			System.out.println("@@@ 등록 성공 @@@");
		}

		return "redirect:/department";
		
	}

	// 사원 수정 페이지
	@GetMapping("member/modify")
	public String getMemberModificationForm() {

		return "/member/memberModificationForm";
	}

	// 사원 권한 관리 페이지
	@GetMapping("member/permission")
	public String getMemberPermissionList(String searchOption, String searchKeyword, Integer pageNum, Model model,
			HttpSession httpSession) {
		// 기본값 (첫 페이지 로딩 시 searchOption, searchKeyword가 null임)
		if (searchOption == null)
			searchOption = "name";
		if (searchKeyword == null)
			searchKeyword = "";
		if (pageNum == null || pageNum < 0)
			pageNum = 1;

		String loginId = httpSession.getAttribute("loginId").toString();

		// 검색 옵션과 키워드로 페이지네이션 검색 (회사 검색)
		Map<String, Object> result = staffService.searchStaffAndAuthorityByLoginId(loginId, searchOption, searchKeyword, pageNum, 10);
		
		model.addAttribute("staffList", result.get("staffList")); // 회사 목록
		model.addAttribute("totalPage", result.get("totalPages")); // 최대 페이지
		model.addAttribute("pageNum", pageNum + ""); // 현재 페이지

		// 검색 도구 값 유지용
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchKeyword", searchKeyword);

		return "/member/memberPermissionList";
	}
	
	// 사원 권한 수정
	@PatchMapping("member/permission")
	@ResponseBody
	public String updateMemberPermission(@RequestBody List<Staff> staffList) {
		
		staffService.updateStaffAuthority(staffList);
		
		return "redirect:/member/permission";
	}

	// 사원 정보 조회 페이지
	@GetMapping("member/detail")
	public String getMemberDetail(HttpSession httpSession, Model model) {

		String loginId = httpSession.getAttribute("loginId").toString();

		// 현재 로그인한 loginId로 사원 정보 조회
		Staff staff = staffService.searchStaffInformationByLoginId(loginId);

		model.addAttribute("staff", staff);

		return "/member/memberDetail";
	}
	
	// 사원 부서 관리 페이지
	@GetMapping("member/department")
	public String getMemberDepartmentManagement(String searchOption, String searchKeyword, Integer pageNum, Model model,
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
		Map<String, Object> result = staffService.searchStaffWithDepartmentByLoginId(loginId, searchOption, searchKeyword, pageNum, 10);
		
		// 부서 검색
		// 로그인 아이디로 회사 번호 조회
		Integer companyId = staffService.searchCompanyIdByLoginId(loginId);
		// 회사 번호로 부서 전체 조회
		List<Department> departmentList = staffService.searchDepartmentByCompanyId(companyId); 
		
		model.addAttribute("staffList", result.get("staffList")); // 사원 목록
		model.addAttribute("departmentList", departmentList);	// 부서 목록
		model.addAttribute("totalPage", result.get("totalPages")); // 최대 페이지
		model.addAttribute("pageNum", pageNum + ""); // 현재 페이지

		// 검색 도구 값 유지용
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchKeyword", searchKeyword);

		return "/member/memberDepartmentList";
	}
	
	//사원 부서 업데이트
	@PatchMapping("member/department")
	@ResponseBody
	public String updateMemberDepartment(@RequestBody List<Staff> staffList) {
		
		System.out.println(staffList);
		
		staffService.updateStaffDepartment(staffList);
		
		return "redirect:/member/department";
	}
	
	// 로그인
	@PostMapping("login")
	public String login(Login login, HttpSession session, RedirectAttributes redirectAttributes) {

		String errorMessage = "";

		// 로그인 시도
		String loginId = staffService.login(login);

		// 로그인 아이디가 공백이거나 null이면 로그인 페이지에서 안넘어감
		if (loginId == null || loginId.isBlank()) {
			errorMessage = "아이디 또는 비밀번호가 잘못되었습니다.";
			redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
			return "redirect:index.jsp";
		}

		// 세션에 로그인 아이디 저장
		session.setAttribute("loginId", loginId);

		// 로그인 아이디를 포함한 세션을 가지고 페이지 이동
		return "redirect:/member/detail";
	}

	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:index.jsp";
	}
}

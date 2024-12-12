package com.middle.hr.parkjinuk.staff.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.middle.hr.parkjinuk.staff.service.StaffService;
import com.middle.hr.parkjinuk.staff.vo.Department;
import com.middle.hr.parkjinuk.staff.vo.Login;
import com.middle.hr.parkjinuk.staff.vo.RootCompany;
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
		Integer companyId = staffService.searchCompanyIdByLoginId(loginId);
		List<Department> departmentList = staffService.searchDepartmentByCompanyId(companyId);
		model.addAttribute("companyId", companyId);
		model.addAttribute("departmentList", departmentList);

		return "member/memberRegistrationForm";
	}

	// 사원 등록 URI (관리자)
	@PostMapping("/member/new")
	public String createMember(Staff staff, @RequestParam("pictureFile") MultipartFile pictureFile,
			@RequestParam("signFile") MultipartFile signFile) throws Exception {

		// 네트워크 공유 폴더 경로
		String picturePath = "\\\\DESKTOP-B94HRMS\\file\\staff\\uploads\\picture";
		String signPath = "\\\\DESKTOP-B94HRMS\\file\\staff\\uploads\\sign";

		// UUID 생성 및 파일 저장
		if (!pictureFile.isEmpty()) {
			String pictureFileName = saveFile(pictureFile, picturePath);
			staff.setPicture(picturePath + "\\" + pictureFileName);
		}

		if (!signFile.isEmpty()) {
			String signFileName = saveFile(signFile, signPath);
			staff.setSign(signPath + "\\" + signFileName);
		}

		// DB 저장
		Integer result = staffService.createStaff(staff);

		if (result == 1) {
			System.out.println("@@@ 등록 성공 @@@");
		}

		return "redirect:/member";
	}

	private String saveFile(MultipartFile file, String uploadDir) throws IOException {
		// UUID로 고유 파일명 생성
		String originalFilename = file.getOriginalFilename();
		String uuid = UUID.randomUUID().toString();
		String newFileName = uuid + "_" + originalFilename;

		// 디렉토리 없으면 생성
		File dir = new File(uploadDir);
		if (!dir.exists()) {
			dir.mkdirs();
		}

		// 파일 저장
		Path path = Paths.get(uploadDir, newFileName);
		Files.copy(file.getInputStream(), path);

		return newFileName;
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
		Map<String, Object> result = staffService.searchDepartmentWithtotalStaffCountByLoginId(loginId, searchOption,
				searchKeyword, pageNum, 10);

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
	public String getMemberModificationForm(HttpSession httpSession, Model model) throws Exception {

		String loginId = httpSession.getAttribute("loginId").toString();

		// 현재 로그인한 loginId로 사원 정보 조회
		Staff staff = staffService.searchStaffInformationByLoginId(loginId);

		// 네트워크 공유 폴더에서 이미지 파일 읽기
		if (staff.getPicture() != null) {
			staff.setPicture(readImageFromNetworkShare(staff.getPicture()));
		}

		if (staff.getSign() != null) {
			staff.setSign(readImageFromNetworkShare(staff.getSign()));
		}

		// 날짜 변환 메서드 호출
		staff.setHiredDate(convertDate(staff.getHiredDate())); // 입사일 변환
		staff.setBirthdate(convertDate(staff.getBirthdate())); // 생년월일 변환

		model.addAttribute("staff", staff);

		return "/member/memberModificationForm";
	}

	// 시간 포맷
	private String convertDate(String originalDate) throws Exception {
		if (originalDate == null || originalDate.isEmpty()) {
			return null; // 값이 없으면 변환하지 않음
		}

		try {
			// 시간 정보가 있는 경우 처리: "2024-12-02 00:00:00.000"
			SimpleDateFormat inputFormatWithTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = inputFormatWithTime.parse(originalDate);
			return outputFormat.format(date); // "YYYY-MM-DD" 형식 반환
		} catch (ParseException e) {
			// 시간 정보가 없는 경우 처리: "2024-12-02"
			SimpleDateFormat inputFormatWithoutTime = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = inputFormatWithoutTime.parse(originalDate);
			return outputFormat.format(date); // "YYYY-MM-DD" 형식 반환
		}
	}

	@PostMapping("member/modify")
	public String updateMember(HttpSession httpSession, Staff staff,
			@RequestParam("pictureFile") MultipartFile pictureFile, @RequestParam("signFile") MultipartFile signFile)
			throws Exception {

		// 네트워크 공유 폴더 경로
		String picturePath = "\\\\DESKTOP-B94HRMS\\file\\staff\\uploads\\picture";
		String signPath = "\\\\DESKTOP-B94HRMS\\file\\staff\\uploads\\sign";

		String loginId = httpSession.getAttribute("loginId").toString();

		// 현재 로그인한 loginId로 사원 정보 조회
		Staff tempStaff = staffService.searchStaffInformationByLoginId(loginId);

	    // 프로필 이미지 업데이트
	    staff.setPicture(updateFile(pictureFile, picturePath, tempStaff.getPicture()));

	    // 서명 이미지 업데이트
	    staff.setSign(updateFile(signFile, signPath, tempStaff.getSign()));

	    // ID 주입
	    staff.setStaffId(tempStaff.getStaffId());
	    
		// 업데이트
		Integer result = staffService.updateStaff(staff);

		if (result == 1) {
			System.out.println("@@@ 등록 성공 @@@");
		}

		return "redirect:/member/detail";
	}

	// 파일 업데이트 메서드
	private String updateFile(MultipartFile file, String uploadDir, String existingFilePath) throws IOException {
	    if (!file.isEmpty()) {
	        // 새로운 파일 저장
	        String originalFilename = file.getOriginalFilename();
	        String uuid = UUID.randomUUID().toString();
	        String newFileName = uuid + "_" + originalFilename;

	        // 디렉토리 없으면 생성
	        File dir = new File(uploadDir);
	        if (!dir.exists()) {
	            dir.mkdirs();
	        }

	        // 새로운 파일 저장
	        Files.copy(file.getInputStream(), Paths.get(uploadDir, newFileName));

	        // 기존 파일 삭제 (필요할 경우)
	        if (existingFilePath != null) {
	            File oldFile = new File(existingFilePath);
	            if (oldFile.exists()) {
	                oldFile.delete();
	            }
	        }

	        // 새 파일 경로 반환
	        return uploadDir + "\\" + newFileName;
	    }

	    // 새로운 파일이 없으면 기존 경로 반환
	    return existingFilePath;
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
		Map<String, Object> result = staffService.searchStaffAndAuthorityByLoginId(loginId, searchOption, searchKeyword,
				pageNum, 10);

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
	public String getMemberDetail(HttpSession httpSession, Model model) throws Exception {

		String loginId = httpSession.getAttribute("loginId").toString();

		// 현재 로그인한 loginId로 사원 정보 조회
		Staff staff = staffService.searchStaffInformationByLoginId(loginId);

		// 네트워크 공유 폴더에서 이미지 파일 읽기
		if (staff.getPicture() != null) {
			staff.setPicture(readImageFromNetworkShare(staff.getPicture()));
		}

		if (staff.getSign() != null) {
			staff.setSign(readImageFromNetworkShare(staff.getSign()));
		}

		model.addAttribute("staff", staff);

		return "/member/memberDetail";
	}

	// 이미지 파일을 Base64로 읽어오기
	public String readImageFromNetworkShare(String filePath) throws IOException {
		File file = new File(filePath);
		if (!file.exists()) {
			throw new IOException("파일을 찾을 수 없습니다: " + filePath);
		}

		try (FileInputStream fis = new FileInputStream(file)) {
			byte[] bytes = fis.readAllBytes();
			return "data:image/png;base64," + Base64.getEncoder().encodeToString(bytes);
		}
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
		Map<String, Object> result = staffService.searchStaffWithDepartmentByLoginId(loginId, searchOption,
				searchKeyword, pageNum, 10);

		// 부서 검색
		// 로그인 아이디로 회사 번호 조회
		Integer companyId = staffService.searchCompanyIdByLoginId(loginId);
		// 회사 번호로 부서 전체 조회
		List<Department> departmentList = staffService.searchDepartmentByCompanyId(companyId);

		model.addAttribute("staffList", result.get("staffList")); // 사원 목록
		model.addAttribute("departmentList", departmentList); // 부서 목록
		model.addAttribute("totalPage", result.get("totalPages")); // 최대 페이지
		model.addAttribute("pageNum", pageNum + ""); // 현재 페이지

		// 검색 도구 값 유지용
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchKeyword", searchKeyword);

		return "/member/memberDepartmentList";
	}

	// 사원 부서 업데이트
	@PatchMapping("member/department")
	@ResponseBody
	public String updateMemberDepartment(@RequestBody List<Staff> staffList) {

		System.out.println(staffList);

		staffService.updateStaffDepartment(staffList);

		return "redirect:/member/department";
	}

	// 회사 조직 트리구조 데이터 조회용 ajax
	@GetMapping("company/tree")
	@ResponseBody
	public RootCompany getCompanyTreeData(HttpSession session) {

		RootCompany rootCompany = staffService
				.searchCompanyTreeDataByLoginId(session.getAttribute("loginId").toString());

		return rootCompany;
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

		System.out.println(staffService.searchCompanyTreeDataByLoginId(loginId));

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

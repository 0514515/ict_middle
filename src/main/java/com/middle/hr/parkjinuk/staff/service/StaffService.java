package com.middle.hr.parkjinuk.staff.service;

import java.util.List;
import java.util.Map;

import com.middle.hr.parkjinuk.salary.vo.StaffCommission;
import com.middle.hr.parkjinuk.staff.vo.Department;
import com.middle.hr.parkjinuk.staff.vo.Login;
import com.middle.hr.parkjinuk.staff.vo.RootCompany;
import com.middle.hr.parkjinuk.staff.vo.Staff;

public interface StaffService {

	// 사원 목록 검색
	Map<String, Object> searchStaffList(String loginId, String searchOption, String searchKeyword, Integer pageNum,
			Integer pageSize);

	// 로그인 아이디로 회사 id 조회
	Integer searchCompanyIdByLoginId(String loginId);

	// 로그인 아이디로 사원 기본키 id 조회
	Integer searchStaffIdByLoginId(String loginId);

	// 로그인 아이디로 사원 정보 조회
	Staff searchStaffInformationByLoginId(String loginId);

	// 사원 ID로 사원 정보 조회
	Staff searchStaffInformationById(Long id);

	// 로그인 아이디로 사원 정보, 권한 목록 조회
	Map<String, Object> searchStaffAndAuthorityByLoginId(String loginId, String searchOption, String searchKeyword,
			Integer pageNum, Integer pageSize);

	// 사원들 권한 업데이트
	Integer updateStaffAuthority(List<Staff> staffList);

	// 로그인 아이디로 사원 정보, 사원 부서 조회
	Map<String, Object> searchStaffWithDepartmentByLoginId(String loginId, String searchOption, String searchKeyword,
			Integer pageNum, Integer pageSize);

	// 부서 검색
	List<Department> searchDepartmentByCompanyId(Integer companyId);

	// 부서 목록 페이지네이션
	Map<String, Object> searchDepartmentWithtotalStaffCountByLoginId(String loginId, String searchOption,
			String searchKeyword, Integer pageNum, Integer pageSize);

	// 부서 생성
	Integer createDepartment(Department department);

	// 사원들 부서 업데이트
	Integer updateStaffDepartment(List<Staff> staffList);

	// 사원 생성
	Integer createStaff(Staff staff);

	// 사원 업데이트
	Integer updateStaff(Staff staff);

	// 회사 조직 트리구조 데이터 조회용
	RootCompany searchCompanyTreeDataByLoginId(String loginId);

	// 로그인
	String login(Login login);

}

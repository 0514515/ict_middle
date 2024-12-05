package com.middle.hr.parkjinuk.staff.repository;

import java.util.List;
import java.util.Map;

import com.middle.hr.parkjinuk.staff.vo.Department;
import com.middle.hr.parkjinuk.staff.vo.Login;
import com.middle.hr.parkjinuk.staff.vo.Staff;

public interface StaffRepository {

	// 사원 목록 검색
	Map<String, Object> selectStaffList(String loginId, String searchOption, String searchKeyword, Integer pageNum,
			Integer pageSize);

	// 로그인 아이디로 회사 id 조회
	Integer selectCompanyIdByLoginId(String loginId);

	// 로그인 아이디로 사원 기본키 id 조회
	Integer selectStaffIdByLoginId(String loginId);

	// 로그인 아이디로 사원 정보 조회
	Staff selectStaffInformationByLoginId(String loginId);

	// 로그인 아이디로 사원 정보, 권한 목록 조회
	Map<String, Object> selectStaffAndAuthorityByLoginId(String loginId, String searchOption, String searchKeyword,
			Integer pageNum, Integer pageSize);
	
	// 사원 권한 업데이트
	Integer updateStaffAuthority(List<Staff> staffList);
	
	// 로그인 아이디로 사원 정보, 사원 부서 조회
	Map<String, Object> selectStaffWithDepartmentByLoginId(String loginId, String searchOption, String searchKeyword,
			Integer pageNum, Integer pageSize);
	
	// 회사 번호로 모든 부서 검색
	List<Department> selectDepartmentByCompanyId(Integer companyId);

	// 사원의 부서 업데이트
	Integer updateStaffDepartment(List<Staff> staffList);
	
	// 사원 생성
	Integer insertStaff(Staff staff);
	
	//d

	// 로그인
	String login(Login login);
}

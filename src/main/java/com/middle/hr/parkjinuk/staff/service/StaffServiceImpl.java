package com.middle.hr.parkjinuk.staff.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.middle.hr.parkjinuk.staff.repository.StaffRepository;
import com.middle.hr.parkjinuk.staff.vo.Department;
import com.middle.hr.parkjinuk.staff.vo.Login;
import com.middle.hr.parkjinuk.staff.vo.RootCompany;
import com.middle.hr.parkjinuk.staff.vo.Staff;

@Service
public class StaffServiceImpl implements StaffService {

	@Autowired
	StaffRepository staffRepository;

	// 사원 목록 검색
	@Override
	public Map<String, Object> searchStaffList(String loginId, String searchOption, String searchKeyword,
			Integer pageNum, Integer pageSize) {
		return staffRepository.selectStaffList(loginId, searchOption, searchKeyword, pageNum, pageSize);
	}

	// 로그인 아이디로 회사 id 검색
	@Override
	public Integer searchCompanyIdByLoginId(String loginId) {
		return staffRepository.selectCompanyIdByLoginId(loginId);
	}

	// 로그인 아이디로 사원 기본키 id 조회
	@Override
	public Integer searchStaffIdByLoginId(String loginId) {
		return staffRepository.selectStaffIdByLoginId(loginId);
	}

	// 로그인 아이디로 사원 정보, 권한 목록 조회
	@Override
	public Map<String, Object> searchStaffAndAuthorityByLoginId(String loginId, String searchOption,
			String searchKeyword, Integer pageNum, Integer pageSize) {
		return staffRepository.selectStaffAndAuthorityByLoginId(loginId, searchOption, searchKeyword, pageNum,
				pageSize);
	}

	// 사원 권한 업데이트
	@Override
	public Integer updateStaffAuthority(List<Staff> staffList) {
		return staffRepository.updateStaffAuthority(staffList);
	}

	// 로그인 아이디로 사원 정보 조회
	@Override
	public Staff searchStaffInformationByLoginId(String loginId) {
		return staffRepository.selectStaffInformationByLoginId(loginId);
	}

	// 로그인 아이디로 사원 정보, 사원 부서 목록 조회
	@Override
	public Map<String, Object> searchStaffWithDepartmentByLoginId(String loginId, String searchOption,
			String searchKeyword, Integer pageNum, Integer pageSize) {
		return staffRepository.selectStaffWithDepartmentByLoginId(loginId, searchOption, searchKeyword, pageNum,
				pageSize);
	}

	// 회사 id로 부서 전체 조회
	@Override
	public List<Department> searchDepartmentByCompanyId(Integer companyId) {
		return staffRepository.selectDepartmentByCompanyId(companyId);
	}

	// 사원들 부서 업데이트
	@Override
	public Integer updateStaffDepartment(List<Staff> staffList) {
		return staffRepository.updateStaffDepartment(staffList);
	}

	// 부서 생성
	@Override
	public Integer createDepartment(Department department) {
		return staffRepository.insertDepartment(department);
	};

	// 사원 생성
	@Override
	public Integer createStaff(Staff staff) {
		return staffRepository.insertStaff(staff);
	}

	// 로그인
	@Override
	public String login(Login login) {
		return staffRepository.login(login);
	}

	// 부서 목록 페이지네이션
	@Override
	public Map<String, Object> searchDepartmentWithtotalStaffCountByLoginId(String loginId, String searchOption,
			String searchKeyword, Integer pageNum, Integer pageSize) {
		return staffRepository.selectDepartmentWithtotalStaffCountByLoginId(loginId, searchOption, searchKeyword,
				pageNum, pageSize);
	}

	@Override
	public RootCompany searchCompanyTreeDataByLoginId(String loginId) {
		return staffRepository.selectCompanyTreeDataByLoginId(loginId);
	}

}

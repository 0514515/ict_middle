package com.middle.hr.parkjinuk.salary.service;

import java.util.List;
import java.util.Map;

import com.middle.hr.parkjinuk.salary.vo.Salary;
import com.middle.hr.parkjinuk.staff.vo.Staff;

public interface SalaryService {

	// 로그인 아이디로 기본급 항목 전체 조회
	List<Salary> searchAllSalaryByLoginId(String loginId);

	// 해당하는 기본급 항목을 받고있는 사원들 조회
	List<Staff> searchStaffByBaseSalary(Salary salary);

	// 기본급 생성
	Integer createSalary(Salary salary);

	// 기본급 업데이트
	Integer updateSalary(Salary salary);

	// 기본급 삭제
	Integer deleteSalary(Salary salary);

	// 사원의 기본급 업데이트
	Integer updateStaffSalary(List<Staff> staff);

	// 기본급을 포함하여 사원 정보 조회
	Map<String, Object> searchStaffWithSalaryByLoginId(String loginId, String searchOption, String searchKeyword,
			Integer pageNum, Integer pageSize);
}

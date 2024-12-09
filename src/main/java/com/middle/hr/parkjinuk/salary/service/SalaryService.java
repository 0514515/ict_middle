package com.middle.hr.parkjinuk.salary.service;

import java.util.List;
import java.util.Map;

import com.middle.hr.parkjinuk.salary.vo.Commission;
import com.middle.hr.parkjinuk.salary.vo.Salary;
import com.middle.hr.parkjinuk.salary.vo.StaffCommission;
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

	// 추가수당 항목 전체 조회
	List<Commission> searchAllCommissionByLoginId(String loginId);

	// 추가수당 항목 추가
	Integer createCommission(Commission commission);

	// 추가 수당 업데이트
	Integer updateCommission(List<Commission> commission);

	// 추가 수당을 받는 사원 조회
	List<StaffCommission> searchStaffCommission(List<Commission> commissionList);

	// 사원 추가 수당 지급
	Integer addStaffCommission(List<StaffCommission> staffCommission);

	// 추가 수당 지급 삭제
	Integer deleteStaffCommission(List<StaffCommission> staffCommission);

	// 급여 명세 : 사원의 기본급과 수당들 조회
	List<Staff> searchStaffWithBasicSalaryAndStaffCommissions(List<Staff> staff);
}

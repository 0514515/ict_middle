package com.middle.hr.parkjinuk.salary.repository;

import java.util.List;

import com.middle.hr.parkjinuk.salary.vo.Salary;
import com.middle.hr.parkjinuk.staff.vo.Staff;

public interface SalaryRepository {
	
	// 로그인 아이디로 기본급 항목 전체 조회
	List<Salary> selectAllSalaryByLoginId(String loginId);
	
	// 해당하는 기본급 항목을 받고있는 사원들 조회
	List<Staff> selectStaffByBaseSalary(Salary salary);
}

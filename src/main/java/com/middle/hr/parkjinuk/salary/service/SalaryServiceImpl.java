package com.middle.hr.parkjinuk.salary.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.middle.hr.parkjinuk.salary.repository.SalaryRepository;
import com.middle.hr.parkjinuk.salary.vo.Salary;
import com.middle.hr.parkjinuk.staff.vo.Staff;

@Service
public class SalaryServiceImpl implements SalaryService {

	@Autowired
	SalaryRepository salaryRepository;

	// 로그인 아이디로 기본급 항목 전체 조회
	@Override
	public List<Salary> searchAllSalaryByLoginId(String loginId) {
		return salaryRepository.selectAllSalaryByLoginId(loginId);
	}

	// 해당하는 기본급 항목을 받고있는 사원들 조회
	@Override
	public List<Staff> searchStaffByBaseSalary(Salary salary) {
		return salaryRepository.selectStaffByBaseSalary(salary);
	}
}

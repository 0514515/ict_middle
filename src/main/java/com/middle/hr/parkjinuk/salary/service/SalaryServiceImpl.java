package com.middle.hr.parkjinuk.salary.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.middle.hr.parkjinuk.salary.repository.SalaryRepository;
import com.middle.hr.parkjinuk.salary.vo.Commission;
import com.middle.hr.parkjinuk.salary.vo.Salary;
import com.middle.hr.parkjinuk.salary.vo.StaffCommission;
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

	// 기본급 생성
	@Override
	public Integer createSalary(Salary salary) {
		return salaryRepository.insertSalary(salary);
	}

	// 기본급 업데이트
	@Override
	public Integer updateSalary(Salary salary) {
		return salaryRepository.updateSalary(salary);
	}

	// 사원의 기본급 업데이트
	@Override
	public Integer updateStaffSalary(List<Staff> staff) {
		return salaryRepository.updateStaffSalary(staff);
	}

	// 기본급 삭제
	@Override
	public Integer deleteSalary(Salary salary) {
		return salaryRepository.deleteSalary(salary);
	}

	// 기본급을 포함하여 사원 정보 조회
	@Override
	public Map<String, Object> searchStaffWithSalaryByLoginId(String loginId, String searchOption, String searchKeyword,
			Integer pageNum, Integer pageSize) {
		return salaryRepository.selectStaffWithSalaryByLoginId(loginId, searchOption, searchKeyword, pageNum, pageSize);
	}

	// 추가수당 항목 전체 조회
	@Override
	public List<Commission> searchAllCommissionByLoginId(String loginId) {
		return salaryRepository.selectAllCommissionByLoginId(loginId);
	}

	// 추가수당 항목 추가
	@Override
	public Integer createCommission(Commission commission) {
		return salaryRepository.insertCommission(commission);
	}

	// 추가 수당 업데이트
	@Override
	public Integer updateCommission(List<Commission> commission) {
		return salaryRepository.updateCommission(commission);
	}

	// 추가 수당을 받는 사원 조회
	@Override
	public List<StaffCommission> searchStaffCommission(List<Commission> commissionList) {
		return salaryRepository.selectStaffCommission(commissionList);
	};

	// 사원 추가 수당 지급
	@Override
	public Integer addStaffCommission(List<StaffCommission> staffCommission) {
		return salaryRepository.insertStaffCommission(staffCommission);
	};

	// 추가 수당 지급 삭제
	public Integer deleteStaffCommission(List<StaffCommission> staffCommission) {
		return salaryRepository.deleteStaffCommission(staffCommission);
	};
}

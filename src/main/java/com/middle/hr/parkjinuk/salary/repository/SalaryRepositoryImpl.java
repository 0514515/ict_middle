package com.middle.hr.parkjinuk.salary.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middle.hr.parkjinuk.salary.vo.Salary;
import com.middle.hr.parkjinuk.staff.vo.Staff;

@Repository
public class SalaryRepositoryImpl implements SalaryRepository{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	// 로그인 아이디로 기본급 항목 전체 조회
	@Override
	public List<Salary> selectAllSalaryByLoginId(String loginId) {
		return mybatis.selectList("SalaryRepository.selectBaseSalaryByLoginId",loginId);
	}

	// 해당하는 기본급 항목을 받고있는 사원들 조회
	@Override
	public List<Staff> selectStaffByBaseSalary(Salary salary) {
		return mybatis.selectList("SalaryRepository.selectStaffInfoByBaseSalary",salary);
	}
}

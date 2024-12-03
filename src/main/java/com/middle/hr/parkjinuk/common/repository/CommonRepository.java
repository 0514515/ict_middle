package com.middle.hr.parkjinuk.common.repository;

import java.util.Map;

import com.middle.hr.parkjinuk.common.vo.Administrator;
import com.middle.hr.parkjinuk.common.vo.Company;

public interface CommonRepository {

	// 회사 생성
	Integer insertCompany(Company company);

	// 회사 목록 검색
	Map<String, Object> selectCompanyList(String searchOption, String searchKeyword, Integer pageNum, Integer pageSize);

	// 관리자 생성
	Integer insertCompanyAdministrator(Administrator administrator);
	
	// 관리자 목록 검색
	Map<String, Object> selectCompanyAdministratorList(String searchOption, String searchKeyword, Integer pageNum, Integer pageSize);
}

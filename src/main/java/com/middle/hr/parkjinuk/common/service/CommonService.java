package com.middle.hr.parkjinuk.common.service;

import java.util.Map;

import com.middle.hr.parkjinuk.common.vo.Administrator;
import com.middle.hr.parkjinuk.common.vo.Company;

public interface CommonService {
	
	// 회사 생성
	Integer createCompany(Company company);
	
	// 회사 목록 검색
	Map<String, Object> searchCompanyList(String searchOption, String searchKeyword, Integer pageNum, Integer pageSize);
	
	// 관리자 생성
	Integer createCompanyAdministrator(Administrator administrator);
	
	// 관리자 목록 검색
	Map<String, Object> searchCompanyAdministratorList(String searchOption, String searchKeyword, Integer pageNum, Integer pageSize);
}

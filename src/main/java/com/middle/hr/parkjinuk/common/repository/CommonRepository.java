package com.middle.hr.parkjinuk.common.repository;

import com.middle.hr.parkjinuk.common.vo.Company;

public interface CommonRepository {
	
	// 회사 생성
	Integer insertCompany(Company company);
}

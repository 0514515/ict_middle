package com.middle.hr.parkjinuk.common.repository;

public interface CommonRepository {
	
	// 회사 목록 페이지네이션 검색 결과 반환
	void selectCompanies(String searchOption, String searchKeyword, Integer page);
	
	// 회사 1개 조회
	void selectCompanyById(Long id);	
}

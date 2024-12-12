package com.middle.hr.parkjinuk.common.repository;

import java.util.List;
import java.util.Map;

import com.middle.hr.parkjinuk.common.vo.Administrator;
import com.middle.hr.parkjinuk.common.vo.AgeChart;
import com.middle.hr.parkjinuk.common.vo.ApprovalChart;
import com.middle.hr.parkjinuk.common.vo.Company;
import com.middle.hr.parkjinuk.common.vo.HiredDateChart;
import com.middle.hr.parkjinuk.common.vo.MonthlyLeaveChart;

public interface CommonRepository {

	// 회사 생성
	Integer insertCompany(Company company);

	// 회사 목록 검색
	Map<String, Object> selectCompanyList(String searchOption, String searchKeyword, Integer pageNum, Integer pageSize);

	// 관리자 생성
	Integer insertCompanyAdministrator(Administrator administrator);
	
	// 관리자 목록 검색
	Map<String, Object> selectCompanyAdministratorList(String searchOption, String searchKeyword, Integer pageNum, Integer pageSize);
	
	// 입사 년도 차트 데이터
	List<HiredDateChart> selectHiredDateChartData(String loginId);
	
	// 월별 휴가 사용 비율
	List<MonthlyLeaveChart> selectMonthlyChartData(String loginId);
	
	// 연령대
	List<AgeChart> selectAgeChartData(String loginId);
	
	// 부서별 기안 수
	List<ApprovalChart> selectApprovalChartData(String loginId);
}

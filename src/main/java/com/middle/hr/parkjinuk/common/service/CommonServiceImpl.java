package com.middle.hr.parkjinuk.common.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.middle.hr.parkjinuk.common.repository.CommonRepository;
import com.middle.hr.parkjinuk.common.vo.Administrator;
import com.middle.hr.parkjinuk.common.vo.AgeChart;
import com.middle.hr.parkjinuk.common.vo.ApprovalChart;
import com.middle.hr.parkjinuk.common.vo.Company;
import com.middle.hr.parkjinuk.common.vo.HiredDateChart;
import com.middle.hr.parkjinuk.common.vo.MonthlyLeaveChart;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	CommonRepository commonRepository;

	// 회사 생성
	@Override
	public Integer createCompany(Company company) {

		return commonRepository.insertCompany(company);
	}

	// 회사 목록 검색
	@Override
	public Map<String, Object> searchCompanyList(String searchOption, String searchKeyword, Integer pageNum,
			Integer pageSize) {
		return commonRepository.selectCompanyList(searchOption, searchKeyword, pageNum, pageSize);
	}

	// 관리자 생성
	@Override
	public Integer createCompanyAdministrator(Administrator administrator) {
		return commonRepository.insertCompanyAdministrator(administrator);
	}

	// 관리자 목록 검색
	@Override
	public Map<String, Object> searchCompanyAdministratorList(String searchOption, String searchKeyword,
			Integer pageNum, Integer pageSize) {
		return commonRepository.selectCompanyAdministratorList(searchOption, searchKeyword, pageNum, pageSize);
	}

	// 입사 년도 차트 데이터
	@Override
	public List<HiredDateChart> searchHiredDateChartData(String loginId){
		return commonRepository.selectHiredDateChartData(loginId);
	};
	
	// 월별 휴가 사용 비율
	@Override
	public List<MonthlyLeaveChart> searchMonthlyChartData(String loginId){
		return commonRepository.selectMonthlyChartData(loginId);
	}
	
	// 연령대
	@Override
	public List<AgeChart> searchAgeChartData(String loginId){
		return commonRepository.selectAgeChartData(loginId);
	}
	
	// 부서별 기안 수
	public List<ApprovalChart> searchApprovalChartData(String loginId){
		return commonRepository.selectApprovalChartData(loginId);
	};
}

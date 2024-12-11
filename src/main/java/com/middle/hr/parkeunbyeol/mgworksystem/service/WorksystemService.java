package com.middle.hr.parkeunbyeol.mgworksystem.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.middle.hr.parkeunbyeol.mgworksystem.vo.Worksystem;

public interface WorksystemService {
	
	// 회사 id와 근무제 입력하기
	void insertWorkSystemByCompanyId(Worksystem worksystem);

	// 입력된 근무제 정보 끌어오기
	List<Worksystem> selectTimeByWorkName(String workName);

	// 회사 id로 사원 리스트 조회
	Map<String, Object> searchStaffList(Integer companyId, Integer pageNum, Integer pageSize);
	
	// 회사 id와 부서명으로 해당 직원 조회
	Map<String, Object> searchStaffBycompanIdDeptname(Integer companyId, String department, Integer pageNum,
			Integer pageSize);


	
	

}

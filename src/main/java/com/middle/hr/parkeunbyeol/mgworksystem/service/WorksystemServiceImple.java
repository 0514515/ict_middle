package com.middle.hr.parkeunbyeol.mgworksystem.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.middle.hr.parkeunbyeol.mgworksystem.repository.WorksystemRepository;
import com.middle.hr.parkeunbyeol.mgworksystem.vo.Worksystem;

@Service
public class WorksystemServiceImple implements WorksystemService {

	@Autowired
	WorksystemRepository worksystemRepository;
	
	// 회사 id와 근무제 입력하기
	@Override
	public void insertWorkSystemByCompanyId(Worksystem worksystem) {
		System.out.println( "===> insertWorkSystemByCompanyId() ==> 호출" );
	
		worksystemRepository.insertWorkSystemByCompanyId(worksystem);
	}
	
	// 회사 id로 근무제 정보 끌어오기
	@Override
	public List<Worksystem> selectTimeByWorkName(String workName) {
		System.out.println("=== selectTimeByWorkName() 호출===>");	
		return worksystemRepository.selectTimeByWorkName(workName);
		
	} 

	// 로그인아이디와 companyId로 사원 목록 조회 
	@Override
	public Map<String, Object> searchStaffList(Integer companyId, Integer pageNum, Integer pageSize) {
		System.out.println("=====> searchStaffList() 호출 ===>");
		
		return worksystemRepository.searchStaffList(companyId, pageNum, pageSize); 
	}

	// 회사 id와 부서명으로 해당 사원 조회
	@Override
	public Map<String, Object> searchStaffBycompanIdDeptname(Integer companyId, String department,  Integer pageNum, Integer pageSize) {
	
		return worksystemRepository.searchStaffBycompanIdDeptname(companyId, department, pageNum, pageSize);
	} 

}

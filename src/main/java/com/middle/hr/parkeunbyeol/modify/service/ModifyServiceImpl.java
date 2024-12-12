package com.middle.hr.parkeunbyeol.modify.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.middle.hr.parkeunbyeol.modify.repository.ModifyRepository;
import com.middle.hr.parkeunbyeol.modify.vo.Modify;

@Service
public class ModifyServiceImpl implements ModifyService {
	
	@Autowired
	ModifyRepository modifyRepository;

	@Override
	public List<Modify> getWorkHistoryByCompanyIdStaffId(Integer companyId, Integer staffId) {
		System.out.println("====getWorkHistoryByCompanyIdStaffId()호출====");
		
		return modifyRepository.getWorkHistoryByCompanyIdStaffId(companyId, staffId);
	}

	// 근무 정정 입력
	@Override
	public void insertModify(Modify modify) {
		System.out.println("====insertModify()호출====");
		
		modifyRepository.insertModify(modify);
		
	}

}

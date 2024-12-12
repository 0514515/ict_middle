package com.middle.hr.parkeunbyeol.modify.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middle.hr.parkeunbyeol.modify.vo.Modify;


@Repository
public class ModifyRepositoryImpl implements ModifyRepository {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<Modify> getWorkHistoryByCompanyIdStaffId(Integer companyId, Integer staffId) {
		System.out.println("====getWorkHistoryByCompanyIdStaffId()호출===");
		
		Modify modify = new Modify();
		modify.setCompanyId(companyId);
		modify.setStaffId(staffId);
			
		return mybatis.selectList("Modify.selectWorkHistoryListByCompanyIdStaffId", modify);
	}

	// 근무 정정 요청
	@Override
	public void insertModify(Modify modify) {
		 System.out.println("====insertModify()호출====");
		 
		 mybatis.insert("Modify.insertModify", modify);
		
	}

}

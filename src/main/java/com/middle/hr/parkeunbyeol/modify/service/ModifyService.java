package com.middle.hr.parkeunbyeol.modify.service;

import java.util.List;

import com.middle.hr.parkeunbyeol.modify.vo.Modify;


public interface ModifyService {

	// 근무 기록 리스트
	List<Modify> getWorkHistoryByCompanyIdStaffId(Integer companyId, Integer staffId);

	// 근무 정정 입력
	void insertModify(Modify modify);

}

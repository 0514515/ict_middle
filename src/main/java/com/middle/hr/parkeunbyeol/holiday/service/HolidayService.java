package com.middle.hr.parkeunbyeol.holiday.service;

import java.util.List;
import java.util.Map;

import com.middle.hr.parkeunbyeol.holiday.vo.Holiday;

public interface HolidayService {
	
	// 사원id로 사원 정보 가져오기
	Holiday getStaffInfoByStaffId(Integer staffId);
	
	// 회사id와 사원id로 해당 사원에 대한 휴가 리스트 받아오기
	List<Holiday> getHolidayListByCompanyId(Integer companyIdByStaffId, Integer staffId);
	
	// 휴가 입력
	void insertHolidayList(Holiday holiday);
	
	// 휴가 리스트 페이징
	public Map<String, Object> getHolidayListPagination(Integer companyId, Integer staffId, Integer pageNum, Integer pageSize);
}

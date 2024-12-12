package com.middle.hr.parkeunbyeol.holiday.repository;

import java.util.List;
import java.util.Map;

import com.middle.hr.parkeunbyeol.holiday.vo.Holiday;

public interface HolidayRepository {

	// 사원 id로 사원 정보 얻어오기
	Holiday getStaffInfoByStaffId(Integer staffId);
	
	// 사원id와 회사id로 해당 사원의 휴가 리스트 가져오기
	List<Holiday> getHolidayListByCompanyId(Integer companyIdByStaffId, Integer staffId);
	
	// 휴가 생성
	void insertHolidayList(Holiday holiday);

	// 휴가 리스트 페이징
	Map<String, Object> getHolidayListPagination(Integer companyId, Integer staffId, Integer pageNum, Integer pageSize);
	
}

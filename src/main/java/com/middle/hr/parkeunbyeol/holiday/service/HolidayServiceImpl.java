package com.middle.hr.parkeunbyeol.holiday.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.middle.hr.parkeunbyeol.holiday.repository.HolidayRepository;
import com.middle.hr.parkeunbyeol.holiday.vo.Holiday;

@Service
public class HolidayServiceImpl implements HolidayService {
	
	@Autowired
	HolidayRepository holidayRepository;
	
	// 사원 id로 사원 정보 조회
	@Override
	public Holiday getStaffInfoByStaffId(Integer staffId) {
		System.out.println("====getStaffInfoByStaffId()호출====");
		
		return holidayRepository.getStaffInfoByStaffId(staffId);
	}

	// 회사id와 사원id로 해당 사원의 휴가 리스트 가져오기
	@Override
	public List<Holiday> getHolidayListByCompanyId(Integer companyIdByStaffId, Integer staffId) {
		System.out.println("====getHolidayListByCompanyId()호출===");
		
		return holidayRepository.getHolidayListByCompanyId(companyIdByStaffId, staffId);
	}

	// 휴가 생성
	@Override
	public void insertHolidayList(Holiday holiday) {
		System.out.println("====insertHolidayList()호출====");
		
		holidayRepository.insertHolidayList(holiday);
		
	}

	// 휴가 리스트 페이징
	@Override
	public Map<String, Object> getHolidayListPagination(Integer companyId, Integer staffId, Integer pageNum,
			Integer pageSize) {
		
		System.out.println("====getHolidayListPagination()호출===");
		
		return holidayRepository.getHolidayListPagination(companyId, staffId, pageNum, pageSize); 
	}

}

package com.middle.hr.parkeunbyeol.holiday.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middle.hr.parkeunbyeol.holiday.vo.Holiday;
import com.middle.hr.parkeunbyeol.mgworksystem.vo.Worksystem;

@Repository
public class HolidayRepositoryImpl implements HolidayRepository {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 사원 id로 사원 정보 얻어오기
	@Override
	public Holiday getStaffInfoByStaffId(Integer staffId) {
		System.out.println("== getStaffInfoByStaffId() 호출 ===");
		
		return mybatis.selectOne("Holiday.selectStaffInfoByStaffId", staffId);
	}

	// 사원id와 회사id로 해당 사원의 휴가 리스트 가져오기
	@Override
	public List<Holiday> getHolidayListByCompanyId(Integer companyIdByStaffId, Integer staffId) {
		System.out.println("====getHolidayListByCompanyId()호출====");
		
		Holiday holiday = new Holiday();
		holiday.setCompanyId(companyIdByStaffId);
		holiday.setStaffId(staffId);
		
		return mybatis.selectList("Holiday.selectHolidayListByCompanyId", holiday);
	}

	// 휴가 생성
	@Override
	public void insertHolidayList(Holiday holiday) {
		System.out.println("====insertHolidayList()호출====");
		
		mybatis.insert("Holiday.insertHolidayList", holiday);
		
	}

	// 휴가 리스트 페이징
	@Override
	public Map<String, Object> getHolidayListPagination(Integer companyId, Integer staffId, Integer pageNum,
			Integer pageSize) {
		System.out.println("====getHolidayListPagination()호출====");
		
		Map<String, Object> paramOne = new HashMap<String, Object>();
		paramOne.put("companyId", companyId);
		paramOne.put("staffId", staffId);
		
		// 페이지 수 가져오기
		int totalCount = mybatis.selectOne("Holiday.selectHolidayListCount", paramOne);
		System.out.println("레코드 수 조회 : " + totalCount);
		
		// 전체 페이지 수 계산
		int totalPage = (int) Math.ceil((double) totalCount / pageSize);
		System.out.println("전체 페이지 확인 :  " + totalPage);
		
		// RowBounds를 사용하여 페이지네이션 적용
		RowBounds rowBounds = new RowBounds((pageNum - 1) * pageSize, pageSize);
		
		// 
		Map<String, Object> paramTwo = new HashMap<String, Object>();
	    paramTwo.put("companyId", companyId);
	    paramTwo.put("staffId", staffId);
	    
		// 전체 휴가 리스트
		List<Holiday> holiday = mybatis.selectList("Holiday.selectHolidayListPagination", paramTwo, rowBounds);
		
		// 결과 리스트 hashMap으로 받기
		Map<String, Object> holidayListPagination = new HashMap<String, Object>();
		holidayListPagination.put("holidayList", holiday);
		holidayListPagination.put("totalCount", totalCount); // 전체 레코드 수
		holidayListPagination.put("totalPage", totalPage); // 전체 페이지수
		
		return holidayListPagination;
	}

}

package com.middle.hr.parkeunbyeol.attendance.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middle.hr.parkeunbyeol.attendance.vo.Attendance;

@Repository
public class AttendanceRepositoryImpl implements AttendanceRepository {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	// 출근 기록 등록 
	@Override
	public Integer insertStartAt(Integer staff_id, String workingStatus) {
		System.out.println("==> insertStartAt() 호출");
		
		Attendance attendance = new Attendance();
		attendance.setStaffId(staff_id);
		attendance.setWorkingStatus(workingStatus);
		
		return mybatis.insert("AttendanceRepository.insertStartAt", attendance);
			 
	}

	// 출근 기록 및 이름 출력
	public Attendance selectStartAt(Attendance staffId) {
		System.out.println("==> selectStartAt() 호출");
		
		return mybatis.selectOne("AttendanceRepository.selectStartAt", staffId);
		
	}

	// 세션에 저장된 id를 가지고 workingStatus 구하기
	@Override
	public String getWorkingStatusByLoginId(Integer staffId) {
		return mybatis.selectOne("AttendanceRepository.selectWorkingStatusByLoginId", staffId);
	}

	// 로그인 아이디로 사원의 정보 조회
	@Override
	public Attendance getStaffInfoByLoginId(Integer staffId) {
		System.out.println("==> getStaffInfoByLoginId() 호출");
		
		return mybatis.selectOne("AttendanceRepository.selectStaffInfoByLoginId", staffId);
	}

	// 최초 로그인시 로그인 아이디로 working_history테이블에 해당 사원의 staffId 넣어주기
	@Override
	public void insertDefaultStaffIdByLoginId(Integer staffId) {
		
		System.out.println(" == > insertDefaultStaffIdByLoginId() 호출====> ");
		
		mybatis.selectOne("AttendanceRepository.insertDefaultStaffIdByLoginId", staffId);
	}

	// 최초 로그인시 로그인 아이디로 사원 정보 검색
	@Override
	public Attendance getStaffInfoDefault(Integer staffId) {
		
		return mybatis.selectOne("AttendanceRepository.selectStaffInfoDefault", staffId);
	}
	
}

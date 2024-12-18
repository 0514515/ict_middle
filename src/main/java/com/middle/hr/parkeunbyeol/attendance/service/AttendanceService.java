package com.middle.hr.parkeunbyeol.attendance.service;

import java.util.List;

import com.middle.hr.parkeunbyeol.attendance.vo.Attendance;

public interface AttendanceService {
	
	// CRUD
	
	// 오늘 날짜 기준 "출근"인 데이터 조회
	Boolean searchWorkingHistoryByStaffId(Integer staff_id);
	
	// 출근 시간 입력하기
	void insertRecode(Integer staff_id, String workingStatus);

	// 퇴근 시간 입력하기	
	void updateRecode(Integer staff_id, String workingStatus);
	
	// 사원의 출근 시간 조회
	Attendance selectStartAt(Attendance staffId);
	
	// 로그인 아이디로 사원의 출근 상태 조회
	String getWorkingStatusByLoginId(Integer staffId);
	
	// 로그인 아이디로 사원의 정보 조회_첫번째
	Attendance getStaffInfoByLoginId(Integer staffId);
	
	// 로그인 아이디로 사원 정보 검색_초기
//	Attendance getStaffInfoDefault(Integer staffId);
	
	// 최초 로그인시 로그인 아이디로 working_history테이블에 해당 사원의 staffId 넣어주기
	void insertDefaultStaffIdByLoginId(Integer staffId);

}
  
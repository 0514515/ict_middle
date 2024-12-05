package com.middle.hr.parkeunbyeol.attendance.service;

import java.util.List;

import com.middle.hr.parkeunbyeol.attendance.vo.Attendance;

public interface AttendanceService {
	
	// CRUD
	// 출근 기록 등록 세션의 staff_id를 인자로 넘겨준다.
	void insertStartAt(Integer staff_id, String workingStatus);

	// 사원의 출근 시간 조회
	Attendance selectStartAt(Attendance staffId);
	
	// 로그인 아이디로 사원의 출근 상태 조회
	String getWorkingStatusByLoginId(Integer staffId);
	
	// 로그인 아이디로 사원의 정보 조회
	Attendance getStaffInfoByLoginId(Integer staffId);
	
	// 최초 로그인시 로그인 아이디로 working_history테이블에 해당 사원의 staffId 넣어주기
	void insertDefaultStaffIdByLoginId(Integer staffId);

}
  
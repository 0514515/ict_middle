package com.middle.hr.parkeunbyeol.attendance.repository;

import java.util.List;

import com.middle.hr.parkeunbyeol.attendance.vo.Attendance;

public interface AttendanceRepository {
	
	// 오늘 날짜 기준 "출근"인 데이터 유무 확인
	public Boolean searchWorkingHistoryByStaffId(Integer staff_id);
	
	// StartAt= 출근 기록 입력
	public Integer insertRecode(Integer staff_id, String workingStatus);
	
	// EndAt = 퇴근 시간 입력
	public Integer updateRecode(Integer staff_id, String workingStatus);
	
	// StartAt 출근 기록 및 이름 출력
	public Attendance selectStartAt(Attendance staffId);
	
	// 세션id로 workingStatus 구하기
	public String getWorkingStatusByLoginId(Integer staffId);
	
	// 로그인 아이디로 사원의 정보 조회
	public Attendance getStaffInfoByLoginId(Integer staffId);
	
	// 최초 로그인시 로그인 아이디로 working_history 테이블에 해당 사원의 staff_Id 입력
	public void insertDefaultStaffIdByLoginId(Integer staffId); 

	
	// 로그인 아이디로 사원 정보 조회 최초값
//	public Attendance getStaffInfoDefault(Integer staffId);
	 
}

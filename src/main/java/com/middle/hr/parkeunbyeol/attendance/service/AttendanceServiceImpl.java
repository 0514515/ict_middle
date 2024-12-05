package com.middle.hr.parkeunbyeol.attendance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.middle.hr.parkeunbyeol.attendance.repository.AttendanceRepository;
import com.middle.hr.parkeunbyeol.attendance.vo.Attendance;

@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	AttendanceRepository attendanceRepository;
	
	// 로그인 된 id로 working_status와 출근 기록 입력
	@Override
	public void insertStartAt(Integer staff_id, String workingStatus) {
		
		attendanceRepository.insertStartAt(staff_id, workingStatus);  
		
	}
	
	// 로그인 아이디로 사원의 출근 시간 조회
	@Override
	public Attendance selectStartAt(Attendance staffId) {
	
		return attendanceRepository.selectStartAt(staffId);
	}
	
	
	// 로그인 아이디로 사원의 출근 상태 조회
	@Override
	public String getWorkingStatusByLoginId(Integer staffId) {
		 
		return attendanceRepository.getWorkingStatusByLoginId(staffId);
		 
	}

	// 로그인 아이디로 사원의 정보 조회 첫번째
	@Override
	public Attendance getStaffInfoByLoginId(Integer staffId) {
		
		return attendanceRepository.getStaffInfoByLoginId(staffId);
	}

	// 최초 로그인시 로그인 아이디로 working_history 테이블에 해당사원의 staffId 입력
	@Override
	public void insertDefaultStaffIdByLoginId(Integer staffId) {
		attendanceRepository.insertDefaultStaffIdByLoginId(staffId);  
		
	}

	// 최초 로그인시 로그인 아이디로 사원 정보 검색 _ 초기
	@Override
	public Attendance getStaffInfoDefault(Integer staffId) {
		
		return attendanceRepository.getStaffInfoDefault(staffId);
	}

	

   
}

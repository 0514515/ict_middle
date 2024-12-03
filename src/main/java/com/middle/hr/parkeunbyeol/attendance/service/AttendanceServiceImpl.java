package com.middle.hr.parkeunbyeol.attendance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.middle.hr.parkeunbyeol.attendance.repository.AttendanceRepository;
import com.middle.hr.parkeunbyeol.attendance.vo.Attendance;

@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	AttendanceRepository attendanceRepository;
	
	// 로그인 된 id로 출근 기록 입력
	@Override
	public void insertStartAt(Integer staff_id) {
		
		attendanceRepository.insertStartAt(staff_id); 
		
	}
	 
	public void selectStartAt(Integer staff_id) {
	
		attendanceRepository.selectStartAt(staff_id);
	}
  
}

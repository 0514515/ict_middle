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
	
	// 출근 기록 입력
	@Override
	public void insertStartAt(Attendance attendance) {
		
		attendanceRepository.insertStartAt(attendance);
		
	}
	
	public void selectStartAt(Integer staff_id) {
	
		attendanceRepository.selectStartAt(staff_id);
	}
  
}

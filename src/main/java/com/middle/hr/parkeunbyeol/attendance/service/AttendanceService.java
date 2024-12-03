package com.middle.hr.parkeunbyeol.attendance.service;

import java.util.List;

import com.middle.hr.parkeunbyeol.attendance.vo.Attendance;

public interface AttendanceService {
	
	// CRUD
	// 출근 기록 등록 / vo에 있는 거 모두 인자로 넣어줌
	void insertStartAt(Attendance attendance);

	void selectStartAt(Integer staff_id); 
	
}
  
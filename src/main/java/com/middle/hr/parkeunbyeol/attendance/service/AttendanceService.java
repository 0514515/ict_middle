package com.middle.hr.parkeunbyeol.attendance.service;

import java.util.List;

import com.middle.hr.parkeunbyeol.attendance.vo.Attendance;

public interface AttendanceService {
	
	// CRUD
	// 출근 기록 등록 세션의 staff_id를 인자로 넘겨준다.
	void insertStartAt(Integer staff_id);

	void selectStartAt(Integer staff_id); 
	
}
  
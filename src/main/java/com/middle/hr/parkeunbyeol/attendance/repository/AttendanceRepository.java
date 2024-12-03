package com.middle.hr.parkeunbyeol.attendance.repository;

import java.util.List;

import com.middle.hr.parkeunbyeol.attendance.vo.Attendance;

public interface AttendanceRepository {
	
	// StartAt= 출근 기록 입력
	public void insertStartAt(Attendance attendance);
	
	// StartAt 출근 기록 출력
	public void selectStartAt(Integer staff_id);
	
}

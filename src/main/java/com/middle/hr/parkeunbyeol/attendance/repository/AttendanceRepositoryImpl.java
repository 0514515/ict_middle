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
	public void insertStartAt(Attendance attendance) {
		System.out.println("==> insertStartAt() 호출");
		
		mybatis.insert("AttendanceRepository.insertStartAt", attendance);
		
		return;
		
	}

	// 출근 기록 출력
	public void selectStartAt(Integer staff_id) {
		System.out.println("==> selectStartAt() 호출");
		
		mybatis.selectList("AttendanceRepository.selectStartAt", staff_id);
		
	}
	
}

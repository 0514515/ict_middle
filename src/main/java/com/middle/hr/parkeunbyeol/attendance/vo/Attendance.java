package com.middle.hr.parkeunbyeol.attendance.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class Attendance {
	
	private String 	historyId;		// 근무 이력 id
	private String 	startAt;		// 출근 이력
	private String 	endAt;			// 퇴근 이력
	private String	workingStatus; 	// 출퇴근 상태
	private Integer	companyId;		// 회사id
	private Integer	staffId;		// 사원id
	private String	rank;			// 직책
	private String 	name;			// 사원이름
	private String 	deptName; 		// 부서이름
}
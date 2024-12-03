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
	
	private String 	history_id;		// 근무 이력 id
	private String 	start_at;		// 출근 이력
	private String 	end_at;			// 퇴근 이력
	private Integer	working_status; 	// 출퇴근 상태
	private Integer	company_id;		// 회사id
	private Integer staff_id;		// 사원id
	
}

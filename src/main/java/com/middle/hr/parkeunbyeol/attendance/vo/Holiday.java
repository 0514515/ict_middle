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
public class Holiday {

	public Integer 	id;					// 휴가id
	public String 	type;				// 휴가구분(이름)
	public String	startedAt;			// 휴가 시작 일시
	public String 	endedAt;			// 휴가 종료 일시
	public String	startedTime;		// 휴가 시작 시간
	public String	endedTime;			// 휴가 종료 시간	
	public String 	reasonOfRequest;	// 사유
	public String	processedAt;		// 처리 일자
	public String 	createdAt;			// 데이터 생성일
	public String 	updatedAt;			// 최종 정보 변경일
	public Integer 	companyId;			// 회사 id
	public Integer 	requestedFromId;	// 요청자 id
	public Integer 	requestedToId;		// 허가id

	////////////////////
	public String managerName;		// 관리자 이름
	
	////////////////////
	
	private Integer	staffId;		// 사원id
	private String 	name;			// 사원이름
	private String 	deptName; 		// 부서이름
	private Integer	managerId;		// 담당자 id
}

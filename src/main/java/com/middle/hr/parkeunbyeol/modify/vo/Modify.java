package com.middle.hr.parkeunbyeol.modify.vo;

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
public class Modify {

	// 근무 기록 테이블
	private Integer historyId;		// 근무 이력 id	
	private String  startedAt;		// 출근 일시
	private String	endedAt;		// 퇴근 일시
	private String 	workingStatus;	// 상태
	private String 	createdAt;		// 데이터 생성일
	private String	updatedAt;		// 최종 정보 변경일
	private Integer	companyId;		// 회사id
	private Integer	staffId;		// 직원id
	
	
	// 근무 기록 수정 테이블
	private Integer modifyId;				// 근무 수정 id
	private String 	afterStartingTime;		// 변경 출근 시각
	private String 	afterEndingTime;		// 변경 퇴근 시각
	private String	reasonOfModification;	// 변경 사유
	private String 	certificationDocument;	// 증빙 서류
	private Integer status;					// 상태
	private String	completedAt;			// 처리일자
	private String 	createdAtOfModify;		// 데이터생성일
	private String 	updatedAtOfModify;		// 최종 정보 변경일
	private Integer requestedFromId;		// 요청자id
	private Integer requestedToId;			// 허가자 id
	
	
	
	//////////////////////
	private String workingTime; 	// 근무시간 (퇴근시간-출근시간)
	private String insertDate;		// 일시
	private String name;			// 사원 이름
	private String workingSign; 	// 근태이상 or 정상 처리
	private String managerName;		// 담당자 이름

	
}

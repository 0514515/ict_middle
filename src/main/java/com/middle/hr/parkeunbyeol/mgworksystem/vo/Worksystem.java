package com.middle.hr.parkeunbyeol.mgworksystem.vo;

import java.util.Date;

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
public class Worksystem {

	private String	workSystemId;		 	// 근무제 id
	private String	workSystemName;			// 근무제 이름
	private String 	workSystemStartedAt; 	// 출근 시간
	private String	workSystemEndedAt; 		// 퇴근 시간
	private Integer activingStatus;			// 활성 상태
	private String 	createdAt; 				// 데이터 생성일
	private String 	updateAt; 				// 최종 정보 변경일
	private Integer companyId; 				// 회사 id number
	
	
	// 추가
	private Integer staffId;		//사원 id number
    private String staffName;		//사원 이름	
    private String departmentName;	//부서 이름
    
}

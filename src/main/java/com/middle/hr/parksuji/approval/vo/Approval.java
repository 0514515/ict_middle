package com.middle.hr.parksuji.approval.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Approval {

	private Integer id; // 결재id
	private String draftedAt; // 기안일시
	private String documentAt; // 결재문서 파일 경로 
	private Integer status; //결재상태 
	private String title;  // 제목
	private Integer currentSigningStaff; // 현재 결재 순번
	private String reasonOfReturn; // 반려 사유 내용
	private String createdAt; // 데이터 생성일
	private String updatedAt;  // 최종 정보 변경일
	private String documentNumber; // 문서번호
	private Integer staffId;  // 사원 id number
	private Integer companyId; // 회사 id number 
	
}

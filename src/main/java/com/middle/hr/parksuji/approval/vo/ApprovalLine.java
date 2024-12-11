package com.middle.hr.parksuji.approval.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Component
@NoArgsConstructor
@AllArgsConstructor
public class ApprovalLine {
	private Integer id;        // 결재 라인 id (시퀀스) 
	private Integer approvalId;       // 결재 id => approval id와 같음
	private Integer type;      // 유형
	private Integer signed;    // 결재 여부
	private Integer priority;  // 순번
	private String signedAt;   // 결재 일시
	private String createdAt;   // 데이터 생성일
	private String updatedAt;   // 최종 정보 변경일
	
	
//	id  | id2 (결재 ID) | priority (순번) | 기타 필드들
//	-----------------------------------------------
//	1   | 123          | 1               | ...
//	2   | 123          | 2               | ...
//	3   | 123          | 3               | ...
//	4   | 124          | 1               | ...
//	5   | 124          | 2               | ...  
	
	
}

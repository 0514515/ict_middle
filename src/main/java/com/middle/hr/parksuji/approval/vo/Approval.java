package com.middle.hr.parksuji.approval.vo;

import java.util.List;

import org.springframework.stereotype.Component;

import com.middle.hr.parkjinuk.staff.vo.Staff;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Component
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
	private Integer staffId;  // 사원 id number  (결재자) 
	private Integer companyId; // 회사 id number 
	
	private String departmentName; // department name(부서명) 
	
	private String formTitle; // document_form name (양식명) 
	
	// 스마트 에디터에서 입력된 html 내용을 담는 필드
	private String noticeContent; 
	private List<ApprovalLine> approvalLines; 
	
}

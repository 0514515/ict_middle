package com.middle.hr.parksuji.approval.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Forms {
	
	private Integer id; // 양식 id 자동 증가되는 Primary Key
	private String path; // 파일 경로
	private String title;  // 결재 양식명 필드 
	private String createdAt; // 문서 생성한 시간 
	private String updatedAt; // 문서 수정한 시간 
	private String documentType; // 문서 구분 선택
	private Integer companyId; // 회사id
	private Integer staffId; // 사원id 
	private String formContent; // 스마트 에디터에서 입력된 html 내용을 담는 필드
	private String name; 
}

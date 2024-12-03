package com.middle.hr.parksuji.approval.vo;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Data
public class Forms {
	
	private Integer id; // 양식 id 자동 증가되는 Primary Key
	private String path; // 파일 경로
	private String title;  // 결재 양식명 필드 
	private String created_at; // 문서 생성한 시간 
	private String updated_at; // 문서 수정한 시간 
	private String document_type; // 문서 구분 선택
	private Integer company_id; // 회사id
	private Integer staff_id; // 사원id 
	private String form_content; // 스마트 에디터에서 입력된 html 내용을 담는 필드
	private String name; 
}

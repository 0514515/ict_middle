package com.middle.hr.parksuji;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Setter
@Getter
@ToString
@Component
@RequiredArgsConstructor
public class writeDraftFormVO {

	// 스마트 에디터에서 입력된 html 내용을 담는 필드
	private String noticeContent; 
	
	// 다른 필요한 필드들 
	private String approver;  // 결재자
	private String approvalStatus; // 결재 상태 
	
}

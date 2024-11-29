package com.middle.hr.parksuji;

import java.io.UnsupportedEncodingException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ApprovalController {

	// 전자결재 홈 
	@GetMapping("approval")
	public String getApprovalPage() {
		return "/approval/home";
	}
	
	// 기안 작성하기 
	@GetMapping("approval/writeDraft")
	public String writeDraft() {
		return "/approval/writeDraft"; 
	}
	
	// 기안 작성하기 _ 결재 상신 완료 
	@GetMapping("approval/writeDraft/completionDraft")
	public String CompletionDraft() {
		return "/approval/completionDraft"; 
	}
	
	// html 입력 내용 저장하기 
	@PostMapping("/save")
	public String saveWriteDraftForm(@RequestParam("notice_content") String noticeContent, Model model) {
		
		// noticeContent는 SmartEditor에서 입력한 HTML 내용(textarea 안의 내용)
		System.out.println("Received content: " + noticeContent);  // html이 제대로 넘어오는지 확인 
		
		writeDraftFormVO writeDraftForm = new writeDraftFormVO();
		writeDraftForm.setNoticeContent(noticeContent); // SmartEditor에서 입력한 HTML 저장
		
		model.addAttribute("writeDraftForm", writeDraftForm); // writeDraftForm 이름으로 Model에 객체 담기
		return "/approval/completionDraft";  // html을 렌더링할 결과 페이지 
		
	}
	
	// 결재 받을 문서
	@GetMapping("approval/history/sent")
	public String getSentApprovalList() {
		return "/approval/sentApprovalList";
	}
	
	// 결재 할 문서 
	@GetMapping("approval/history/received")
	public String getReceivedApprovalList() {
		return "/approval/receivedApprovalList";
	}
	
	// 임시보관함
	@GetMapping("approval/temp")
	public String getTempStorage() {
		return "/approval/tempStorage";
	}
	
	// 임시보관함 - 회수 문서 상세화면
	@GetMapping("approval/temp/retrievedDoc")
	public String retrievedDocument() {
		return "/approval/retrievedDocument";
	}
	
	// 임시보관함 - 임시저장 문서 상세화면
	@GetMapping("approval/temp/tempStorageDoc")
	public String tempStorageDocument() {
		return "/approval/tempStorageDocument";
	}
	
	
	// 결재양식관리
	@GetMapping("approval/approvalForm")
	public String approvalForm() {
		return "/approval/approvalForm";
	}
	
	// 결재양식관리 - 양식 생성하기
	@GetMapping("approval/approvalForm/CreateForm")
	public String createApprovalForm() {
		return "/approval/createApprovalForm";
	}
	
	
	// 관리자 - 전자결재 문서 통합 관리 
	@GetMapping("management/approval")
	public String approvalManagement() {
		return "/approval/approvalManagement";
	}
	
	
}
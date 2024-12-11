package com.middle.hr.parksuji.approval.service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.middle.hr.parkjinuk.staff.service.StaffService;
import com.middle.hr.parkjinuk.staff.vo.RootCompany;
import com.middle.hr.parkjinuk.staff.vo.Staff;
import com.middle.hr.parksuji.approval.repository.FormRepositoryImpl;
import com.middle.hr.parksuji.approval.vo.Approval;
import com.middle.hr.parksuji.approval.vo.ApprovalLine;
import com.middle.hr.parksuji.approval.vo.Forms;
import com.middle.hr.parksuji.approval.vo.StaffInfo;

@Service
public class FormServiceImpl implements FormService {

	@Autowired
	private FormRepositoryImpl formRepository; 

	@Autowired
	private StaffService staffService;
	
	// DB에 저장 
	@Override
	public void insertForm(Forms forms) {
		formRepository.insertForm(forms);  
	}

	@Override
	public void updateForm(Forms forms) {
		formRepository.updateForm(forms);
		
	}

	@Override
	public List<Integer> deleteForm(List<Integer> formIds) {
		if (formIds != null && !formIds.isEmpty()) {
	        System.out.println("삭제할 아이디들: " + formIds); // 한 번에 삭제할 ID 로그
	        formRepository.deleteById(formIds); // 리스트로 삭제
		}
		return formIds; 
	}

	@Override
	public Forms getFormById(Integer id) {
		return formRepository.getFormById(id);
	}
	
	@Override
	public Integer getRecentFormId(String loginId) {
		return formRepository.getRecentFormId(loginId); 
	}

	@Override
	public Map<String, Object> getFormList(String loginId, String documentType,String searchOption, String searchKeyword, Integer pageNum,
			Integer pageSize) {
		return formRepository.getFormList(loginId, documentType, searchOption, searchKeyword, pageNum, pageSize);
	}

	@Override
	public List<Forms> getApprovalForm() {
		return formRepository.getApprovalForm(); 
	}

	@Override
	public RootCompany searchCompanyTreeDataByLoginId(String loginId) {
		return formRepository.selectCompanyTreeDataByLoginId(loginId);
	}

	@Override
	public StaffInfo getStaffByLoginId(String loginId) {
		return formRepository.getStaffByLoginId(loginId);
	}

	@Override
	public Approval processApprovalDraft(Approval approval, List<Staff> approvalLine, List<Staff> referenceLine, String loginId) throws IOException {

		 // HTML 콘텐츠 저장 및 경로 반환
		String filePath = saveHtmlToFile(approval.getNoticeContent());
		approval.setDocumentAt(filePath); // 파일 경로 설정
		
		// Approval 저장(Id 자동 생성)
		formRepository.saveApproval(approval); 
	
		// ApprovalLine 초기화 및 순번 설정
		List<ApprovalLine> approvalLineList = initializeApprovalLines(approvalLine, approval.getId());
		
		// 첫번째 결재자 설정 
		if (!approvalLine.isEmpty()) {
		    Long staffId = approvalLine.get(0).getStaffId();
		    if (staffId != null) {
		        approval.setCurrentSigningStaff(staffId);  // 첫 번째 결재자
		        formRepository.updateApprovalCurrentSigningStaff(approval); // DB에 반영
		    } else {
		        System.out.println("첫 번째 결재자의 StaffId가 null입니다.");
		    }
		} else {
		    System.out.println("approvalLine이 비어 있습니다.");
		}
		
		// ApprovalLine 저장
		formRepository.saveApprovalLine(approvalLineList); 
		System.out.println("Approval 및 ApprovalLine 저장 완료. Approval ID: " + approval.getId());
		
		return approval;
	}

	// ApprovalLine 초기화 및 순번 설정
	private List<ApprovalLine> initializeApprovalLines(List<Staff> inputStaffInfos, Integer approvalId) {  // approvalId = approval.getId()
        List<ApprovalLine> approvalLineList = new ArrayList<>();
        LocalDateTime now = LocalDateTime.now();

        for (int i = 0; i < inputStaffInfos.size(); i++) {
            Staff staff = inputStaffInfos.get(i); // StaffInfo 객체
            ApprovalLine line = new ApprovalLine();  // ApprovalLine 객체 생성

            line.setApprovalId(approvalId);               // Approval ID 연결 : formRepository.save(approval) 호출 후 approval.getId()로 ID를 가져와 ApprovalLine의 id2 필드에 설정
            line.setType(1);                              // 기본 결재 타입
            line.setSigned(0);                            // 결재 대기 상태
            line.setPriority(i + 1);                      // 순번 설정
            line.setCreatedAt(now.toString());            // 생성일시
            line.setUpdatedAt(now.toString());            // 변경일시

            approvalLineList.add(line);
            System.out.println("[FormServiceImpl] approvalLineList :" + approvalLineList);
        }

        return approvalLineList;   // 호출한 processApprovalDraft에 리턴값 반환  
    }
	
	
   	public String saveHtmlToFile(String formContent) throws IOException{
		// 네트워크 공유 폴더의 경로 (절대 경로 사용)
	     String uploadDirectory = "\\\\DESKTOP-B94HRMS\\file\\approval\\uploads\\forms"; // 네트워크 공유 폴더 경로
	    
	     // HTML 콘텐츠를 파일로 저장
		 // 스마트에디터에서 작성된 HTML 콘텐츠 : 폼에서 입력받은 본문 내용을 approval 객체의 noticeContent에 바인딩
			String fileName = "form_" + UUID.randomUUID().toString() + ".html"; // 파일명, uuid로 생성하는 방법  
			File file = new File(uploadDirectory, fileName); // 실제 파일 객체 생성
			
			// 파일 경로 확인
		   System.out.println("[/draft_save] Saving file to: " + file.getAbsolutePath());
			
		// HTML 콘텐츠를 파일로 작성
		   try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
		        writer.write(formContent);
		    }
		   System.out.println("HTML 파일이 저장되었습니다: " + file.getAbsolutePath());
		   return file.getAbsolutePath(); // 저장된 파일의 경로 반환
		    
	}	

}

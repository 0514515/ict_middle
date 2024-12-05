package com.middle.hr.parksuji.approval.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.middle.hr.parkjinuk.staff.service.StaffService;
import com.middle.hr.parksuji.approval.service.FormService;
import com.middle.hr.parksuji.approval.vo.Forms;
import com.middle.hr.parksuji.approval.vo.writeDraftFormVO;

@Controller
public class ApprovalController {
	
	@Autowired
	private FormService formService;  // FormService에서 DB 처리
	
	@Autowired
	private StaffService staffService;
	
	private void deleteFiles(List<Forms> FormList) {
		if(FormList == null || FormList.size() == 0) {
			return; 
		}
		System.out.println("delete formList =====>" + FormList);
		
		FormList.forEach(form -> {
			try {
			// 파일 경로 생성
			//Path file = Paths.get(UPLOAD_DIRECTORY, form.getUploadPath(), form.getUuid() + "_" + form.getFileName());
			// 파일이 존재하면 삭제 
			//Files.deleteIfExists(file);
			} catch(Exception e) {
				System.err.println("[컨트롤러]파일삭제시 에러 : " + e.getMessage());
			}
			
			
		});
		
		
	}

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
	
	// 기안 작성시 html 입력 내용 저장하기 
	@PostMapping("/save")  // form action값 기입
	public String saveWriteDraftForm(@RequestParam("draftTitle") String draftTitle, // input name값 가져오기 
									@RequestParam("notice_content") String noticeContent, 
									Model model) {
		
		// noticeContent는 SmartEditor에서 입력한 HTML 내용(textarea 안의 내용)
		 System.out.println("Received content: " + draftTitle); 
		// System.out.println("Received content: " + noticeContent);  // html이 제대로 넘어오는지 확인 
		
		// writeDraftFormVO 객체 생성하고 값 설정
		writeDraftFormVO writeDraftForm = new writeDraftFormVO();
		writeDraftForm.setDraftTitle(draftTitle);
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
	
	
	// 양식관리 - 양식 목록 
	@GetMapping("approval/approvalForm")
	public String getFormList(Model model) {
		List<Forms> list = formService.getFormList();
		model.addAttribute("formList", list);
		return "/approval/approvalForm";
	}
	

	
	// 양식관리 - 삭제 
	@PostMapping("approval/approvalForm")
	public String deleteForm(@RequestBody Map<String, List<Integer>> requestBody) {  // @RequestBody : json형식으로 데이터 전할 때 body에 데이터를 포함하여 전송 
		List<Integer> formIds = requestBody.get("formIds");
		System.out.println("Received content: " + formIds);  // 확인용 로그  
		// 선택된 양식 ID들로 삭제 처리 
		if(formIds != null && !formIds.isEmpty()) {
			formService.deleteForm(formIds);
		}
		return "redirect:/approval/approvalForm";  // 삭제 후 목록 페이지로 리다이렉트 
	}
	
	
	// 양식관리 - 양식 생성하기
	@GetMapping("approval/approvalForm/CreateForm")
	public String createApprovalForm(Forms forms) {
		return "/approval/createApprovalForm";
	}
	
	

	
	
	// 양식 생성시 html 입력 내용 저장하기 ( 공유 네트워크에 저장시 사용하는 방법 )
	// 저장 후 양식 생성 완료 화면 출력 
	@PostMapping("/form_save")  // form action값 기입 
	public String saveCreateForm(@RequestParam("title") String title,  // input name값 가져오기 
									@RequestParam("documentType") String documentType,  // input name값 가져오기
									@RequestParam("formContent") String formContent,  // input name값 가져오기
									Model model, HttpSession session) throws IOException {
		
		System.out.println("Received content: " + title);  // html이 제대로 넘어오는지 확인 
		System.out.println("Received content: " + documentType);  // html이 제대로 넘어오는지 확인 
		System.out.println("Received content: " + formContent);  // html이 제대로 넘어오는지 확인 
		
		 // 네트워크 공유 폴더의 경로 (절대 경로 사용)
	    String uploadDirectory = "\\\\DESKTOP-B94HRMS\\file\\approval\\uploads\\forms"; // 네트워크 공유 폴더 경로
		
		// 1. HTML 콘텐츠를 파일로 저장
		// String fileName = "form_" + System.currentTimeMillis() + ".html"; // 파일명, 날짜로 생성하는 방법
		String fileName = "form_" + UUID.randomUUID().toString() + ".html"; // 파일명, uuid로 생성하는 방법  
		File file = new File(uploadDirectory, fileName); // 실제 파일 객체 생성
		
		// 파일 경로 확인
	    System.out.println("Saving file to: " + file.getAbsolutePath());
		
		 // HTML 콘텐츠를 파일로 작성
	    try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
	        writer.write(formContent);
	    } catch (IOException e) {
	        e.printStackTrace();
	        throw new IOException(" HTML content를 파일로 작성하는 데 실패했습니다.", e);
	    }
		
		// Forms 객체 생성하여 값 설정
		Forms forms = new Forms();  // vo 
		forms.setTitle(title); // 양식 제목 
		forms.setDocumentType(documentType); // 문서 구분
		forms.setFormContent(formContent); // html 콘텐츠
		forms.setPath(uploadDirectory + "\\" + fileName); // 파일 경로 
		
		//세션에서 로그인 아이디 받아오기
		String loginId = session.getAttribute("loginId").toString();
		
		//로그인 아이디로 회사 번호 가져오기
		Integer companyId = staffService.searchCompanyIdByLoginId(loginId);
		
		//로그인 아이디로 사번 가져오기
		Integer staffId = staffService.searchStaffIdByLoginId(loginId);
		
		//회사 번호와 사번을 forms에 set
		forms.setCompanyId(companyId);
		forms.setStaffId(staffId);
		
		// FormService를 통해 DB에 저장
		formService.insertForm(forms);
		
		// CURRVAL을 사용하여 방금 저장된 formId를 가져오기 (이미 생성된 ID를 가져옴)
		// FormService에서 formId를 가지고 forms 가져오는 코드
		Integer formId = formService.getRecentFormId(loginId);
		System.out.println(" ================> 컨트롤러 : " + formId);
	//	forms = new Forms();
	//	forms.setId(formId);
		
		// 모델에 forms 객체 추가 
		//model.addAttribute("formId", formId);
		
		// 양식 생성 완료 페이지로 이동
		return "redirect:approval/approvalForm/detail?formId=" + formId; 
		
	}
	
	
	
	
	// 양식관리 - 양식 생성 완료 화면  
//	@GetMapping("approval/completionCreateForm")
//	public String completionCreateForm(@RequestParam("formId") Integer formId, Model model) {
//		// formId를 모델에 추가하여 양식 상세 정보를 보여줄 수 있도록 처리
//	    model.addAttribute("formId", formId);
//	    return "approval/completionCreateForm";
//	}
	
	
	// 양식관리 - 상세보기 페이지 
	@GetMapping("approval/approvalForm/detail")
	public String getFormById(Integer formId, Model model) throws IOException {
		System.out.println("--------------> [approval/approvalForm/detail]  id:" + formId);
		Forms forms = formService.getFormById(formId); // formId 로 양식의 상세 정보 조회 
		System.out.println("--------------> [컨트롤러][approval/approvalForm/detail]" + forms.toString());
		
		 // DB에서 가져온 경로를 사용하여 파일 내용 읽기
	    String filePath = forms.getPath();  // DB에 저장된 파일 경로
	    System.out.println("File path: " + filePath);
	    String formContent = readFileFromNetworkShare(filePath);  // 네트워크 공유 폴더에서 HTML 내용 읽기
	    System.out.println("formContent: " + formContent);
	    
	    // 읽어온 formContent를 모델에 추가
	    model.addAttribute("formContent", formContent); // 파일 내용 전달
		model.addAttribute("forms", forms); // 양식 상세 정보를 모델에 추가 
		return "/approval/completionCreateForm"; 
	} 
	
	public String readFileFromNetworkShare(String filePath) throws IOException {
	    StringBuilder content = new StringBuilder();

	    // 파일 경로에 대한 BufferedReader 객체 생성
	    File file = new File(filePath);
	    System.out.println("Reading from file: " + file.getAbsolutePath());  // 읽을 파일의 절대 경로 확인
	    
	    if (file.exists()) {
	        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
	            String line;
	            while ((line = reader.readLine()) != null) {
	                content.append(line).append("\n");  // \n을 사용하여 줄바꿈 추가,  // 읽은 내용 추가
	            }
	        }
	    } else {
	        throw new IOException("파일을 찾을 수 없습니다: " + filePath);  // 파일 경로 확인
	    }

	    return content.toString();
	}
	

	// 관리자 - 전자결재 문서 통합 관리 
	@GetMapping("management/approval")
	public String approvalManagement() {
		return "/approval/approvalManagement";
	}
	
	// 기안 작성시 html 입력 내용 저장하기 ( 개인 컴퓨터에 저장시 사용하는 방법 ) 	
	/*	
	@Autowired
    private ServletContext servletContext; // ServletContext를 자동 주입
	
	@PostMapping("/form_save")  // form action값 기입 
	public String saveCreateForm(@RequestParam("title") String title,  // input name값 가져오기 
									@RequestParam("document_type") String document_type,  // input name값 가져오기
									@RequestParam("form_content") String form_content,  // input name값 가져오기
									Model model, HttpServletRequest request) throws IOException {
		
		System.out.println("Received content: " + title);  // html이 제대로 넘어오는지 확인 
		System.out.println("Received content: " + document_type);  // html이 제대로 넘어오는지 확인 
		System.out.println("Received content: " + form_content);  // html이 제대로 넘어오는지 확인 
		
		 // 서버 실제 경로 찾기 (ServletContext 사용) String uploadDirectory =
		 servletContext.getRealPath("/resources/approval/uploads/forms");
 
		
		// 1. HTML 콘텐츠를 파일로 저장
		String fileName = "form_" + System.currentTimeMillis() + ".html"; // 파일명 설정 
		File file = new File(uploadDirectory, fileName); // 실제 파일 객체 생성
		
		 // HTML 콘텐츠를 파일로 작성
	    try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
	        writer.write(form_content);
	    } catch (IOException e) {
	        e.printStackTrace();
	        throw new IOException(" HTML content를 파일로 작성하는 데 실패했습니다.", e);
	    }
		
		// Forms 객체 생성하여 값 설정
		Forms forms = new Forms();  // vo 
		forms.setTitle(title); // 양식 제목 
		forms.setDocument_type(document_type); // 문서 구분
		forms.setForm_content(form_content); // html 콘텐츠
		forms.setPath(uploadDirectory + "/" + fileName); // 파일 경로 
		
		 // FormService를 통해 DB에 저장
		formService.insertForm(forms); 
		
		// 모델에 forms 객체 추가 
		model.addAttribute("forms", forms);
		
		// 양식 생성 완료 페이지로 이동
		return "/approval/completionCreateForm"; 
		
	}  */
	
	
	
}
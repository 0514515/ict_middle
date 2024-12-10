package com.middle.hr.parksuji.approval.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.middle.hr.parkjinuk.staff.service.StaffService;
import com.middle.hr.parkjinuk.staff.vo.RootCompany;
import com.middle.hr.parksuji.approval.service.FormService;
import com.middle.hr.parksuji.approval.vo.Approval;
import com.middle.hr.parksuji.approval.vo.Forms;
import com.middle.hr.parksuji.approval.vo.StaffInfo;
import com.middle.hr.parksuji.approval.vo.writeDraft;

@Controller
public class ApprovalController {
	
	@Autowired
	private FormService formService;  // FormService에서 DB 처리
	
	@Autowired
	private StaffService staffService;
	

	// 전자결재 홈 
	@GetMapping("approval")
	public String getApprovalPage() {
		return "/approval/home";
	}
	
	// 기안 작성시 로그인아이디로 이름, 직책, 부서명 자동입력 
	@GetMapping("approval/writeDraft")
	public String getDraftWriterInfoByLoginId(HttpSession session, Model model) {	
	 
		//세션에서 로그인 아이디 받아오기
		String loginId = session.getAttribute("loginId").toString();
		
		// 세션에 loginId가 존재하지 않으면 예외 처리
	    if (loginId == null || loginId.isEmpty()) {
	        throw new IllegalArgumentException("로그인 세션이 만료되었거나, 로그인되지 않았습니다.");
	    }
		
		StaffInfo staffInfo = formService.getStaffByLoginId(loginId); // 로그인id로 staffInfo 객체 조회 
		
		// staffInfo가 null이면 예외 처리
	    if (staffInfo == null) {
	        throw new IllegalArgumentException("로그인 ID에 해당하는 직원 정보를 찾을 수 없습니다.");
	    }
		
		model.addAttribute("departmentName", staffInfo.getDepartmentName()); // 부서명
		model.addAttribute("name", staffInfo.getName());  // 이름
		model.addAttribute("rank", staffInfo.getRank()); // 직책 
	
		return "/approval/writeDraft"; 
	}
	
	// 모달 - 결재 양식 목록 DB에서 모달창으로 불러오기  
	@GetMapping("approval/getApprovalForm")
	@ResponseBody  // ajax로 불러올 때 사용
	public List<Forms> getApprovalForm() throws IOException {
		System.out.println("여기****************");
		List<Forms> formList = formService.getApprovalForm(); // getApprovalForm 통해서 forms 정보 가져와 담기 
		System.out.println("===> [컨트롤러][approval/getApprovalForm]" + formList.toString());
		
		// 각 양식의 HTML 내용을 네트워크 공유 폴더에서 읽어와서 추가
		for(Forms forms : formList) {
			String filePath = forms.getPath();  // DB에 저장된 파일 경로
			String formContent = readFileFromNetworkShare(filePath);  // 네트워크 공유 폴더에서 HTML 내용 읽기(아래 부분에 있음) 
				   forms.setFormContent(formContent); 
				   System.out.println("===> [컨트롤러][approval/getApprovalForm => forms]" + forms.toString());
		}
		
		// 최종적으로 HTML 내용을 포함한 양식 목록을 반환하기 전에 확인
	    System.out.println("===> [컨트롤러][getApprovalForm] 반환할 formList: " + formList);
		
		return formList;  // 최종적으로 HTML 내용을 포함한 양식 목록 반환
	}
	
	
	
	// 모달 - 결재선 db에서 불러오고 선택하기  
	// 회사 조직 트리구조 데이터 조회용 ajax
	@GetMapping("approval/company/tree")
	@ResponseBody  
	public RootCompany getCompanyTreeData(HttpSession session) {  // RootCompany => vo
		
		RootCompany rootCompany = formService.searchCompanyTreeDataByLoginId(session.getAttribute("loginId").toString());
		
		return rootCompany;
	}
	
	
	
	// 기안 작성 후 결재상신 버튼 클릭시 폼 제출되며 불러오는 컨트롤러  
	@PostMapping("/draft_save")  // form action값 기입    // @ ModelAttribute : 폼 데이터를 객체에 자동으로 바인딩하는 역할 
	public String saveWriteDraft(@ModelAttribute Approval approval, 
								@RequestParam("approvalLines") String approvalLinesJson, // 결재라인 
								@RequestParam("approval_form") String formName, // 양식명
								@RequestParam("draftedAt") String draftedAt, // 기안일자
								Model model, HttpSession session) throws IOException {
								  
		
	  	//세션에서 로그인 아이디 받아오기
  		String loginId = session.getAttribute("loginId").toString();
  		
  		if (loginId == null) {
  		    throw new IllegalArgumentException("loginId가 null입니다.");
  		}
  		
  		// approvalLinesJson 결재선, 참조선 파싱
  	    ObjectMapper objectMapper = new ObjectMapper();
  	    List<StaffInfo> approvalLines = objectMapper.readValue(approvalLinesJson, new TypeReference<List<StaffInfo>>() {});
  		
  	    // 양식명, 기안일자 
  	    System.out.println("양식명 : " + formName ); // formName을 approval 객체에 설정
  	    System.out.println("기안일자 : " + draftedAt ); 
  	    
  		// 서비스 레이어에 모든 처리 위임 
  		formService.processApprovalDraft(approval, approvalLines, loginId);
		
  	    // 양식 생성 완료 페이지로 이동
  		return "redirect:approval/completionDraft?approvalId=" + approval.getId();
  		 
		
	}
	
	
	
	
	// 기안 작성 후 결재 상신 완료 
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
		writeDraft writeDraftForm = new writeDraft();
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
	
	
	// 양식 목록 페이지 
	@GetMapping("approval/approvalForm")
	public String getFormList(String documentType, String searchOption, String searchKeyword, Integer pageNum, Model model, HttpSession httpSession) {
		
		// 기본값 (첫 페이지 로딩 시 searchOption, searchKeyword가 null임)
		if (searchOption == null)
			searchOption = "title";
		if (searchKeyword == null)
			searchKeyword = "";
		if (pageNum == null || pageNum < 0)
			pageNum = 1;
		
		String loginId = httpSession.getAttribute("loginId").toString();
		
		// 검색 옵션과 키워드로 페이지네이션 검색 (회사 검색)
		Map<String, Object> result = formService.getFormList(loginId, documentType, searchOption, searchKeyword, pageNum, 10);

		model.addAttribute("formList", result.get("formList"));
		model.addAttribute("totalPage", result.get("totalPages")); // 최대 페이지
		model.addAttribute("pageNum", pageNum + ""); // 현재 페이지

		// 검색 도구 값 유지용
		model.addAttribute("documentType", documentType); 
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchKeyword", searchKeyword);
		
		System.out.println("[컨트롤러 : approval/approvalForm]model====> " + model + toString());
		
		return "/approval/approvalForm";
	}
	
	
	// 양식 생성하기
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
	
	// 네트워크 공유 폴더에서 HTML 내용 읽기
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
	
	
	// 양식관리 - 삭제 
	@PostMapping("approval/approvalForm")
	public String deleteForm(@RequestBody Map<String, List<Integer>> requestBody) {  // @RequestBody : json형식으로 데이터 전할 때 body에 데이터를 포함하여 전송 
		List<Integer> formIds = requestBody.get("formIds");
		System.out.println("Received content: " + formIds);  // 확인용 로그  
		// 선택된 양식 ID들로 삭제 처리 
		if(formIds != null && !formIds.isEmpty()) {
	        // DB에서의 양식 삭제 
	        formService.deleteForm(formIds);
			
		}
		
		return "redirect:/approval/approvalForm";  // 삭제 후 목록 페이지로 리다이렉트 
	}

	// 양식관리 - 상세페이지에서 수정 버튼을 눌렀을 때 기존 데이터 가져오기 
	@GetMapping("approval/approvalForm/edit")
	public String getFormDetail(@RequestParam("formId") Integer formId, Model model,  HttpSession session) {
		
		//세션에서 로그인 아이디 받아오기
		String loginId = session.getAttribute("loginId").toString();
		
		//로그인 아이디로 회사 번호 가져오기
		Integer companyId = staffService.searchCompanyIdByLoginId(loginId);
		
		//로그인 아이디로 사번 가져오기
		Integer staffId = staffService.searchStaffIdByLoginId(loginId);
		
		// formId로 수정할 양식 데이터를 DB에서 가져오기 
		Forms forms = formService.getFormById(formId);
		forms.setCompanyId(companyId);
		forms.setStaffId(staffId);
		
		// formContent가 파일로 저장되어 있기 때문에, 해당 파일의 내용을 읽어온다.
		if(forms.getPath() !=null) {
			try {
				// 파일 경로 읽기
				File file = new File(forms.getPath());
				StringBuilder contentBuilder = new StringBuilder();
				try(BufferedReader reader = new BufferedReader(new FileReader(file))){
					String line; 
					while((line = reader.readLine()) != null) {
						contentBuilder.append(line).append("\n");
					}
				}
				// 파일 내용을 formContent에 설정
				forms.setFormContent(contentBuilder.toString()); 
			}catch(IOException e) {
				e.printStackTrace(); // 파일 읽기 중 에러 처리 
			}
			
		}
		
		// 가져온 양식 데이터를 모델에 추가
		model.addAttribute("forms", forms);
		
		System.out.println("--->[컨트롤러]" + forms.toString());
		
		// 수정 페이지로 이동
		return "/approval/updateApprovalForm"; 
	}
	
	// 양식관리 - 수정 완료 버튼을 눌렀을 때 
	@PostMapping("approval/approvalForm/completionEdit")
	public String updateForm(@RequestParam("formId") Integer formId,
				            @RequestParam("title") String title,
				            @RequestParam("documentType") String documentType,
				            @RequestParam("formContent") String formContent
				           ) throws IOException {
		
		// html이 제대로 넘어오는지 확인
		System.out.println("Received content: " + formId); 
		System.out.println("Received content: " + title);   
		System.out.println("Received content: " + documentType);   
		System.out.println("Received content: " + formContent);   
		
		// 1. 수정할 양식 데이터를 DB에서 가져오기 
		Forms existingForm = formService.getFormById(formId);
		
		// 2. 기존 파일 경로 가져오기 
		String filePath = existingForm.getPath(); 
		
		// 3. formContent 파일로 덮어쓰기 (기존 파일 덮어쓰기) 
		try(BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))){
			writer.write(formContent); // 수정된 formContent를 파일에 덮어쓰기 
		}catch(IOException e) {
			e.printStackTrace();
			throw new IOException("파일을 덮어쓰는 중 오류 발생", e); // 예외처리 
		}
		
		// 4. 기존 데이터에 수정된 값 덮어쓰기 (파일 경로 포함)  
		existingForm.setTitle(title);  // 제목 수정
		existingForm.setDocumentType(documentType);  // 문서 구분 수정
		existingForm.setFormContent(formContent);  // 양식 내용 수정(여기에서는 경로로만 사용) 
		
		
		// 5. 수정된 폼(Forms 객체)을 DB에 저장
		formService.updateForm(existingForm);
			
		// 수정 완료 후 해당 양식의 상세 페이지로 리다이렉트
	    return "redirect:/approval/approvalForm/detail?formId=" + formId;   
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
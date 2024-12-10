package com.middle.hr.parksuji.approval.service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.middle.hr.parkjinuk.staff.vo.RootCompany;
import com.middle.hr.parksuji.approval.vo.Approval;
import com.middle.hr.parksuji.approval.vo.ApprovalLine;
import com.middle.hr.parksuji.approval.vo.Forms;
import com.middle.hr.parksuji.approval.vo.StaffInfo;

public interface FormService {

	// CRUD 기능의 메소드 구현
	
	// 폼 양식 등록 
	void insertForm(Forms forms);
	
	// 폼 양식 수정
	void updateForm(Forms forms);
	
	// 폼 양식 삭제 
	List<Integer> deleteForm(List<Integer> formIds);
	
	// 폼id로 폼 양식 조회 
	Forms getFormById(Integer id);
	
	// 최근 폼id값 
	Integer getRecentFormId(String loginId); 
	
	// 폼 목록 조회 
	//List<Forms> getFormList();
	Map<String, Object> getFormList(String loginId, String documentType, String searchOption, String searchKeyword, Integer pageNum, Integer pageSize);

	// 양식 목록 가져오기  
	List<Forms> getApprovalForm();

	// 로그인아이디로 사원 정보 받아오기 
	StaffInfo getStaffByLoginId(String loginId);
	
	// 결재 작성 후 폼 저장
	void processApprovalDraft(Approval approval, List<StaffInfo> approvalLines, String loginId) throws IOException; 
	
	String saveHtmlToFile(String formContent) throws IOException; 
	
	
	// 회사 조직 트리구조 데이터 조회용
	RootCompany searchCompanyTreeDataByLoginId(String loginId);
	
	
	
}	

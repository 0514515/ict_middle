package com.middle.hr.parksuji.approval.service;

import java.util.List;
import java.util.Map;

import com.middle.hr.parksuji.approval.vo.Forms;

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
	
}	

package com.middle.hr.parksuji.approval.service;

import java.util.List;

import com.middle.hr.parksuji.approval.vo.Forms;

public interface FormService {

	// CRUD 기능의 메소드 구현
	
	// 폼 양식 등록 
	void insertForm(Forms forms);
	
	// 폼 양식 수정
	void updateForm(Forms forms);
	
	// 폼 양식 삭제 
	void deleteForm(List<Integer> formIds);
	
	// 폼 양식 조회 
	Forms getForm(Forms forms);
	
	// 폼 목록 조회 
	List<Forms> getFormList();
}

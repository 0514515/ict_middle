package com.middle.hr.parksuji.approval.repository;

import java.util.List;
import java.util.Map;

import com.middle.hr.parksuji.approval.vo.Forms;

public interface FormRepository {

	public void insertForm(Forms forms);
	
	public void updateForm(Forms forms);
	
	List<Integer> deleteById(List<Integer> formIds);
	
	public Forms getFormById(Integer id);
	
	public Integer getRecentFormId(String loginId);
	
	//List<Forms> getFormList(); 
	
	// 목록 검색
	Map<String, Object> getFormList(String loginId, String searchOption, String documentType, String searchKeyword, Integer pageNum,
			Integer pageSize);
	
	List<Forms> getApprovalForm(); 
		
		
}

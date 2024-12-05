package com.middle.hr.parksuji.approval.repository;

import java.util.List;

import com.middle.hr.parksuji.approval.vo.Forms;

public interface FormRepository {

	public void insertForm(Forms forms);
	
	public void updateForm(Forms forms);
	
	public void deleteById(List<Integer> formIds);
	
	public Forms getFormById(Integer id);
	
	public Integer getRecentFormId(String loginId);
	
	List<Forms> getFormList(); 
	
}

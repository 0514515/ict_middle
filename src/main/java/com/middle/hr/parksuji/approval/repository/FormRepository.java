package com.middle.hr.parksuji.approval.repository;

import java.util.List;

import com.middle.hr.parksuji.approval.vo.Forms;

public interface FormRepository {

	public void insertForm(Forms forms);
	
	public void updateForm(Forms forms);
	
	void deleteById(Integer formId);
	
	public Forms getForm(Forms forms);
	
	List<Forms> getFormList(); 
	
}

package com.middle.hr.parksuji.approval.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.middle.hr.parksuji.approval.repository.FormRepositoryImpl;
import com.middle.hr.parksuji.approval.vo.Forms;

@Service
public class FormServiceImpl implements FormService {

	@Autowired
	private FormRepositoryImpl formRepository; 
	
	// DB에 저장 
	@Override
	public void insertForm(Forms forms) {
		formRepository.insertForm(forms);  
	}

	@Override
	public void updateForm(Forms forms) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteForm(Forms forms) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Forms getForm(Forms forms) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Forms> getFormList() {
		return formRepository.getFormList(); 
	}

}

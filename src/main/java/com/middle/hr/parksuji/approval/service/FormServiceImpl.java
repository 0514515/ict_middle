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
	public void deleteForm(List<Integer> formIds) {
		for (Integer formId : formIds) {
			System.out.println("Deleting form with ID: " + formId); // 삭제하는 ID 로그 찍기
			formRepository.deleteById(formId); // formRepository의 deleteById 메서드를 이용해 삭제
		}
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

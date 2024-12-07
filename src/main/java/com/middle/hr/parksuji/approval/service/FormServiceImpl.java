package com.middle.hr.parksuji.approval.service;

import java.util.List;
import java.util.Map;

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
		formRepository.updateForm(forms);
		
	}

	@Override
	public List<Integer> deleteForm(List<Integer> formIds) {
		if (formIds != null && !formIds.isEmpty()) {
	        System.out.println("삭제할 아이디들: " + formIds); // 한 번에 삭제할 ID 로그
	        formRepository.deleteById(formIds); // 리스트로 삭제
		}
		return formIds; 
	}

	@Override
	public Forms getFormById(Integer id) {
		return formRepository.getFormById(id);
	}
	
	@Override
	public Integer getRecentFormId(String loginId) {
		return formRepository.getRecentFormId(loginId); 
	}

	@Override
	public Map<String, Object> getFormList(String loginId, String documentType,String searchOption, String searchKeyword, Integer pageNum,
			Integer pageSize) {
		return formRepository.getFormList(loginId, documentType, searchOption, searchKeyword, pageNum, pageSize);
	}

	@Override
	public List<Forms> getApprovalForm() {
		return formRepository.getApprovalForm(); 
	}

//	@Override
//	public List<Forms> getFormList() {
//		return formRepository.getFormList(); 
//	}


	

}

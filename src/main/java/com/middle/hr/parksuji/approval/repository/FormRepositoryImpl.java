package com.middle.hr.parksuji.approval.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middle.hr.parksuji.approval.vo.Forms;

@Repository
public class FormRepositoryImpl implements FormRepository{

	@Autowired
	private SqlSessionTemplate mybatis; 
	
	@Override
	public void insertForm(Forms forms) {
		System.out.println("===> Mybatis insertForm() 호출");
		mybatis.insert("FormRepository.insertForm", forms);
		
	}

	@Override
	public void updateForm(Forms forms) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteById(Integer formId) {
		System.out.println("===> Mybatis deleteById() 호출");
		mybatis.delete("FormRepository.deleteForm", formId);
	}

	@Override
	public Forms getForm(Forms forms) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Forms> getFormList() {
		System.out.println("===> Mybatis getFormList() 호출");
		List<Forms> result = mybatis.selectList("FormRepository.getFormList"); // selectList : 여러개 받을거야 => 리턴값 List<BoardVO>  // mapper의 namespace를 적어준다(BoardDAO).
		// DB로부터 받은 데이터를 확인 
		for(Forms forms : result) {
			System.out.println(forms.toString());
		}
		return result; 
	}

}

package com.middle.hr.parkjinuk.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.middle.hr.parkjinuk.common.repository.CommonRepository;
import com.middle.hr.parkjinuk.common.vo.Company;

@Service
public class CommonServiceImpl implements CommonService{

	@Autowired
	CommonRepository commonRepository;
	
	//회사 생성
	@Override
	public Integer createCompany(Company company) {
		
		return commonRepository.insertCompany(company);
	}
	
	
}

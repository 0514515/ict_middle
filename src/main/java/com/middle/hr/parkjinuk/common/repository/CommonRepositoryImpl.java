package com.middle.hr.parkjinuk.common.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middle.hr.parkjinuk.common.vo.Company;

@Repository
public class CommonRepositoryImpl implements CommonRepository{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//회사 insert
	@Override
	public Integer insertCompany(Company company) {
		
		return mybatis.insert("CommonRepository.insertCompany", company);
	}

	
}

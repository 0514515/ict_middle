package com.middle.hr.parkjinuk.common.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middle.hr.parkjinuk.common.vo.Administrator;
import com.middle.hr.parkjinuk.common.vo.Company;

@Repository
public class CommonRepositoryImpl implements CommonRepository {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 회사 insert
	@Override
	public Integer insertCompany(Company company) {

		return mybatis.insert("CommonRepository.insertCompany", company);
	}

	// 회사 목록 페이지네이션 조회
	@Override
	public Map<String, Object> selectCompanyList(String searchOption, String searchKeyword, Integer pageNum, Integer pageSize) {
	    // 검색 조건에 맞는 전체 레코드 수 조회
	    Map<String, Object> params = new HashMap<>();
	    params.put("searchOption", searchOption);
	    params.put("searchKeyword", searchKeyword);

	    int totalCount = mybatis.selectOne("CommonRepository.selectCompanyCount", params);

	    // 전체 페이지 수 계산
	    int totalPages = (int) Math.ceil((double) totalCount / pageSize);

	    // RowBounds를 사용하여 페이지네이션 적용
	    RowBounds rowBounds = new RowBounds((pageNum - 1) * pageSize, pageSize);

	    // 회사 조회
	    List<Company> companyList = mybatis.selectList("CommonRepository.selectCompanyList", params, rowBounds);

	    // 결과를 맵으로 반환
	    Map<String, Object> result = new HashMap<>();
	    result.put("companyList", companyList); // 페이지네이션된 결과
	    result.put("totalCount", totalCount);   // 전체 레코드 수
	    result.put("totalPages", totalPages);   // 전체 페이지 수

	    return result;
	}

	// 관리자 생성
	@Override
	public Integer insertCompanyAdministrator(Administrator administrator) {
		
		return mybatis.insert("CommonRepository.insertCompanyAdministrator", administrator);
	}
	
	// 관리자 목록 페이지네이션 조회
	@Override
	public Map<String, Object> selectCompanyAdministratorList(String searchOption, String searchKeyword,
			Integer pageNum, Integer pageSize) {
		// 검색 조건에 맞는 전체 레코드 수 조회
	    Map<String, Object> params = new HashMap<>();
	    params.put("searchOption", searchOption);
	    params.put("searchKeyword", searchKeyword);

	    int totalCount = mybatis.selectOne("CommonRepository.selectCompanyAdministratorCount", params);

	    // 전체 페이지 수 계산
	    int totalPages = (int) Math.ceil((double) totalCount / pageSize);

	    // RowBounds를 사용하여 페이지네이션 적용
	    RowBounds rowBounds = new RowBounds((pageNum - 1) * pageSize, pageSize);

	    // 관리자 조회
	    List<Administrator> administratorList = mybatis.selectList("CommonRepository.selectCompanyAdministratorList", params, rowBounds);

	    // 결과를 맵으로 반환
	    Map<String, Object> result = new HashMap<>();
	    result.put("administratorList", administratorList); // 페이지네이션된 결과
	    result.put("totalCount", totalCount);   // 전체 레코드 수
	    result.put("totalPages", totalPages);   // 전체 페이지 수

	    return result;
	}

	


}

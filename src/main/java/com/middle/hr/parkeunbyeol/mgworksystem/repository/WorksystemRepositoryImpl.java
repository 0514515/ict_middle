package com.middle.hr.parkeunbyeol.mgworksystem.repository;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.ognl.MemberAccess;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middle.hr.parkeunbyeol.mgworksystem.vo.Staff;
import com.middle.hr.parkeunbyeol.mgworksystem.vo.Worksystem;

@Repository
public class WorksystemRepositoryImpl implements WorksystemRepository {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 회사 id와 근무제 입력하기
	@Override
	public void insertWorkSystemByCompanyId(Worksystem worksystem) {
		System.out.println("==> insertWorkSystemByCompanyId() 호출==>");
		
		mybatis.insert("Worksystem.insertWorkSystemByCompanyId", worksystem);
		
	}

	// 회사 id로 근무제 정보 끌어오기
	@Override
	public List<Worksystem> selectTimeByWorkName(String workName) {
		System.out.println("==>selectTimeByWorkName() 호출 ===> ");
		
		return mybatis.selectList("Worksystem.selectTimeByWorkName", workName);
	}

	
	
	// 회사 id로 사원 정보 얻어오기
	@Override 
	public Map<String, Object> searchStaffList(Integer companyId, Integer pageNum, Integer pageSize) {
		System.out.println("==>searchStaffList() 호출==>");
		
		Map<String, Object> paramOne = new HashMap<String, Object>();
		paramOne.put("companyId", companyId);
		
		// 페이지 수 가져오기
		int totalCount = mybatis.selectOne("Worksystem.selectStaffListCount", paramOne);
		
		// 전체 페이지 수 계산
		int totalPage = (int) Math.ceil((double) totalCount / pageSize);
		
		System.out.println("전체 페이지 확인 :  " + totalPage);
		
		// RowBounds를 사용하여 페이지네이션 적용
		RowBounds rowBounds = new RowBounds((pageNum - 1) * pageSize, pageSize);
		
		// vo가 Staff인 결과값
		/*List<Staff> staff = mybatis.selectList("Worksystem.selectStaffListOnStaff", companyId, rowBounds);*/
		
	    Map<String, Object> paramTwo = new HashMap<String, Object>();
	    paramTwo.put("companyId", companyId);

		// 전체 부서 목록
		List<Worksystem> worksystem = mybatis.selectList("Worksystem.selectStaffListOnWorksystem", paramTwo,rowBounds);
	
		// 결과 값 hashMap으로 받기
		Map<String, Object> resultList = new HashMap<String, Object>();
		
		//resultList.put("staffList", staff); // staff 리스트
		resultList.put("workSystemList", worksystem); // 근무제 리스트
		resultList.put("totalCount", totalCount); // 전체 레코드 수
		resultList.put("totalPage", totalPage); // 전체 페이지수
		
		return resultList;
	}

	// 회사 id와 부서명으로 해당 사원 조회
	@Override
	public Map<String, Object> searchStaffBycompanIdDeptname(Integer companyId, String department, Integer pageNum,
			Integer pageSize) {
		System.out.println("==>staffListByCompanyIdDeptName() 호출 ==>");
		
		Map<String, Object> paramOne = new HashMap<String, Object>();
		paramOne.put("companyId", companyId);
		paramOne.put("department", department);
		
		// 페이지 수 가져오기
		int totalCount = mybatis.selectOne("Worksystem.selectStaffListByDepartmentCount", paramOne);
		
		// 전체 페이지 수 계산
		int totalPage = (int) Math.ceil((double) totalCount / pageSize);
		
		System.out.println("전체 페이지 확인 :  " + totalPage);
		
		// RowBounds를 사용하여 페이지네이션 적용
		RowBounds rowBounds = new RowBounds((pageNum - 1) * pageSize, pageSize);
		
		Worksystem worksystem = new Worksystem();
		worksystem.setCompanyId(companyId);
		worksystem.setDepartmentName(department);
		 
		// vo가 staff인 결과값
		List<Worksystem> staffListByCompanyIdDeptName = mybatis.selectList("Worksystem.selectStaffBycompanIdDeptName", worksystem,rowBounds);
		
		// 결과를 맵으로 반환
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("staffListByCompanyIdDeptName", staffListByCompanyIdDeptName);
		result.put("totalCount", totalCount);
		result.put("totalPage", totalPage);
		
		return result;
	}
	

}

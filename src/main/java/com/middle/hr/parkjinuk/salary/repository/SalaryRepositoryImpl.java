package com.middle.hr.parkjinuk.salary.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middle.hr.parkjinuk.salary.vo.Commission;
import com.middle.hr.parkjinuk.salary.vo.Salary;
import com.middle.hr.parkjinuk.salary.vo.StaffCommission;
import com.middle.hr.parkjinuk.staff.vo.Staff;

@Repository
public class SalaryRepositoryImpl implements SalaryRepository {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 로그인 아이디로 기본급 항목 전체 조회
	@Override
	public List<Salary> selectAllSalaryByLoginId(String loginId) {
		return mybatis.selectList("SalaryRepository.selectBaseSalaryByLoginId", loginId);
	}

	// 해당하는 기본급 항목을 받고있는 사원들 조회
	@Override
	public List<Staff> selectStaffByBaseSalary(Salary salary) {
		return mybatis.selectList("SalaryRepository.selectStaffInfoByBaseSalary", salary);
	}

	// 기본급 생성
	@Override
	public Integer insertSalary(Salary salary) {
		return mybatis.insert("SalaryRepository.insertSalary", salary);
	}

	// 기본급 업데이트
	@Override
	public Integer updateSalary(Salary salary) {
		return mybatis.insert("SalaryRepository.updateSalary", salary);
	}

	// 기본급 삭제
	@Override
	public Integer deleteSalary(Salary salary) {
		return mybatis.insert("SalaryRepository.deleteSalary", salary);
	}

	// 사원의 기본급 업데이트
	@Override
	public Integer updateStaffSalary(List<Staff> staffList) {
		// 배치 처리용 세션 열기
		SqlSession sqlSession = mybatis.getSqlSessionFactory().openSession(ExecutorType.BATCH, false);

		try {
			// 리스트의 각 staff에 대해 UPDATE 쿼리 실행
			for (Staff staff : staffList) {
				sqlSession.update("SalaryRepository.updateStaffBaseSalary", staff);
			}

			// 배치 후 커밋
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}

		return staffList.size();
	}

	// 기본급을 포함하여 사원 정보 조회
	@Override
	public Map<String, Object> selectStaffWithSalaryByLoginId(String loginId, String searchOption, String searchKeyword,
			Integer pageNum, Integer pageSize) {
		// 검색 조건에 맞는 전체 레코드 수 조회
		Map<String, Object> params = new HashMap<>();
		params.put("searchOption", searchOption);
		params.put("searchKeyword", searchKeyword);
		params.put("loginId", loginId);

		int totalCount = mybatis.selectOne("SalaryRepository.selectStaffCountWithSalaryByLoginId", params);

		// 전체 페이지 수 계산
		int totalPages = (int) Math.ceil((double) totalCount / pageSize);

		// RowBounds를 사용하여 페이지네이션 적용
		RowBounds rowBounds = new RowBounds((pageNum - 1) * pageSize, pageSize);

		// 사원 조회
		List<Salary> staffList = mybatis.selectList("SalaryRepository.selectStaffWithSalaryByLoginId", params,
				rowBounds);

		// 결과를 맵으로 반환
		Map<String, Object> result = new HashMap<>();
		result.put("staffList", staffList); // 페이지네이션된 결과
		result.put("totalCount", totalCount); // 전체 레코드 수
		result.put("totalPages", totalPages); // 전체 페이지 수

		return result;
	}

	// 추가수당 항목 전체 조회
	@Override
	public List<Commission> selectAllCommissionByLoginId(String loginId) {
		return mybatis.selectList("SalaryRepository.selectAllCommissionByLoginId", loginId);
	}

	// 추가수당 항목 추가
	@Override
	public Integer insertCommission(Commission commission) {
		return mybatis.insert("SalaryRepository.insertCommission", commission);
	};

	// 추가 수당 업데이트
	@Override
	public Integer updateCommission(List<Commission> commission) {
		// 배치 처리용 세션 열기
		SqlSession sqlSession = mybatis.getSqlSessionFactory().openSession(ExecutorType.BATCH, false);

		try {
			// 리스트의 각 staff에 대해 UPDATE 쿼리 실행
			for (Commission comm : commission) {
				sqlSession.update("SalaryRepository.updateCommission", comm);
			}

			// 배치 후 커밋
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}

		return commission.size();

	};

	// 추가 수당을 받는 사원 조회
	@Override
	public List<StaffCommission> selectStaffCommission(List<Commission> commissionList) {
		if (commissionList == null || commissionList.isEmpty()) {
			return new ArrayList<>();
		}

		Map<String, Object> param = new HashMap<>();
		param.put("commissionList", commissionList);
		return mybatis.selectList("SalaryRepository.selectStaffCommission", param);
	}

	// 사원 추가 수당 지급
	@Override
	public Integer insertStaffCommission(List<StaffCommission> staffCommission) {
		// 배치 처리용 세션 열기
		SqlSession sqlSession = mybatis.getSqlSessionFactory().openSession(ExecutorType.BATCH, false);

		try {
			// 리스트의 각 staff에 대해 UPDATE 쿼리 실행
			for (StaffCommission sc : staffCommission) {
				sqlSession.update("SalaryRepository.insertStaffCommission", sc);
			}

			// 배치 후 커밋
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}

		return staffCommission.size();
	};

	// 추가 수당 지급 삭제
	@Override
	public Integer deleteStaffCommission(List<StaffCommission> staffCommission) {
		// 배치 처리용 세션 열기
		SqlSession sqlSession = mybatis.getSqlSessionFactory().openSession(ExecutorType.BATCH, false);

		try {
			// 리스트의 각 staff에 대해 UPDATE 쿼리 실행
			for (StaffCommission sc : staffCommission) {
				sqlSession.update("SalaryRepository.deleteStaffCommission", sc);
			}

			// 배치 후 커밋
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
		return staffCommission.size();
	}
	
	// 급여 명세 : 사원의 기본급과 수당들 조회
	@Override
	public List<Staff> selectStaffWithBasicSalaryAndStaffCommissions(List<Staff> staff){
		return mybatis.selectList("SalaryRepository.selectStaffWithBasicSalaryAndStaffCommissions",staff);
	};
}

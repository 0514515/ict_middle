package com.middle.hr.parkjinuk.staff.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middle.hr.parkjinuk.staff.vo.Department;
import com.middle.hr.parkjinuk.staff.vo.Login;
import com.middle.hr.parkjinuk.staff.vo.Staff;

@Repository
public class StaffRepositoryImpl implements StaffRepository {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 사원 목록 검색
	@Override
	public Map<String, Object> selectStaffList(String loginId, String searchOption, String searchKeyword,
			Integer pageNum, Integer pageSize) {
		// 검색 조건에 맞는 전체 레코드 수 조회
		Map<String, Object> params = new HashMap<>();
		params.put("searchOption", searchOption);
		params.put("searchKeyword", searchKeyword);
		params.put("loginId", loginId);

		int totalCount = mybatis.selectOne("StaffRepository.selectStaffCount", params);

		// 전체 페이지 수 계산
		int totalPages = (int) Math.ceil((double) totalCount / pageSize);

		// RowBounds를 사용하여 페이지네이션 적용
		RowBounds rowBounds = new RowBounds((pageNum - 1) * pageSize, pageSize);

		// 사원 조회
		List<Staff> staffList = mybatis.selectList("StaffRepository.selectStaffList", params, rowBounds);

		// 결과를 맵으로 반환
		Map<String, Object> result = new HashMap<>();
		result.put("staffList", staffList); // 페이지네이션된 결과
		result.put("totalCount", totalCount); // 전체 레코드 수
		result.put("totalPages", totalPages); // 전체 페이지 수

		return result;
	}

	// 로그인 id로 회사 id 조회
	@Override
	public Integer selectCompanyIdByLoginId(String loginId) {
		return mybatis.selectOne("StaffRepository.selectCompanyIdByLoginId", loginId);
	}

	// 로그인 아이디로 사원 기본키 id 조회
	@Override
	public Integer selectStaffIdByLoginId(String loginId) {
		return mybatis.selectOne("StaffRepository.selectStaffIdByLoginId", loginId);
	}

	// 로그인 아이디로 사원 정보 조회
	@Override
	public Staff selectStaffInformationByLoginId(String loginId) {
		return mybatis.selectOne("StaffRepository.selectStaffInformationByLoginId", loginId);
	}

	// 로그인 아이디로 사원 정보와 권한 목록 조회
	@Override
	public Map<String, Object> selectStaffAndAuthorityByLoginId(String loginId, String searchOption,
			String searchKeyword, Integer pageNum, Integer pageSize) {
		// 검색 조건에 맞는 전체 레코드 수 조회
		Map<String, Object> params = new HashMap<>();
		params.put("searchOption", searchOption);
		params.put("searchKeyword", searchKeyword);
		params.put("loginId", loginId);

		int totalCount = mybatis.selectOne("StaffRepository.selectStaffAndAuthorityCountByLoginId", params);

		// 전체 페이지 수 계산
		int totalPages = (int) Math.ceil((double) totalCount / pageSize);

		// RowBounds를 사용하여 페이지네이션 적용
		RowBounds rowBounds = new RowBounds((pageNum - 1) * pageSize, pageSize);

		// 사원 조회
		List<Staff> staffList = mybatis.selectList("StaffRepository.selectStaffAndAuthorityByLoginId", params,
				rowBounds);

		// 결과를 맵으로 반환
		Map<String, Object> result = new HashMap<>();
		result.put("staffList", staffList); // 페이지네이션된 결과
		result.put("totalCount", totalCount); // 전체 레코드 수
		result.put("totalPages", totalPages); // 전체 페이지 수

		return result;
	}

	// 사원 권한 업데이트 (일괄)
	@Override
	public Integer updateStaffAuthority(List<Staff> staffList) {
		// 배치 처리용 세션 열기
		SqlSession sqlSession = mybatis.getSqlSessionFactory().openSession(ExecutorType.BATCH, false);

		try {
			// 리스트의 각 staff에 대해 UPDATE 쿼리 실행
			for (Staff staff : staffList) {
				sqlSession.update("StaffRepository.updateStaffAuthority", staff);
			}

			// 배치 후 커밋
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}

		return staffList.size(); // 처리된 항목 수 반환
	}
	
	// 회사 id로 부서 전체 조회
	@Override
	public List<Department> selectDepartmentByCompanyId(Integer companyId) {
		return mybatis.selectList("StaffRepository.selectDepartmentByCompanyId", companyId);
	}
	
	// (페이지네이션) 부서 정보를 포함하여 사원 정보 조회
	@Override
	public Map<String, Object> selectStaffWithDepartmentByLoginId(String loginId, String searchOption,
			String searchKeyword, Integer pageNum, Integer pageSize) {
		// 검색 조건에 맞는 전체 레코드 수 조회
				Map<String, Object> params = new HashMap<>();
				params.put("searchOption", searchOption);
				params.put("searchKeyword", searchKeyword);
				params.put("loginId", loginId);

				int totalCount = mybatis.selectOne("StaffRepository.selectStaffWithDepartmentCountByLoginId", params);

				// 전체 페이지 수 계산
				int totalPages = (int) Math.ceil((double) totalCount / pageSize);

				// RowBounds를 사용하여 페이지네이션 적용
				RowBounds rowBounds = new RowBounds((pageNum - 1) * pageSize, pageSize);

				// 사원 조회
				List<Staff> staffList = mybatis.selectList("StaffRepository.selectStaffWithDepartmentByLoginId", params,
						rowBounds);

				// 결과를 맵으로 반환
				Map<String, Object> result = new HashMap<>();
				result.put("staffList", staffList); // 페이지네이션된 결과
				result.put("totalCount", totalCount); // 전체 레코드 수
				result.put("totalPages", totalPages); // 전체 페이지 수

				return result;
	}

	// 사원 생성
	@Override
	public Integer insertStaff(Staff staff) {
		return mybatis.insert("StaffRepository.insertStaff", staff);
	}

	// 로그인
	@Override
	public String login(Login login) {
		return mybatis.selectOne("StaffRepository.login", login);
	}



	

}

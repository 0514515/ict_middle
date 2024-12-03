package com.middle.hr.parkjinuk.staff.repository;

import com.middle.hr.parkjinuk.common.vo.Company;
import com.middle.hr.parkjinuk.staff.vo.Login;
import com.middle.hr.parkjinuk.staff.vo.Staff;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class StaffRepositoryImpl implements StaffRepository{

    @Autowired
    private SqlSessionTemplate mybatis;

    // 사원 목록 검색
    @Override
    public Map<String, Object> selectStaffList(String loginId, String searchOption, String searchKeyword, Integer pageNum, Integer pageSize) {
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
        List<Company> staffList = mybatis.selectList("StaffRepository.selectStaffList", params, rowBounds);

        // 결과를 맵으로 반환
        Map<String, Object> result = new HashMap<>();
        result.put("staffList", staffList); // 페이지네이션된 결과
        result.put("totalCount", totalCount);   // 전체 레코드 수
        result.put("totalPages", totalPages);   // 전체 페이지 수

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
    	return mybatis.selectOne("StaffRepository.selectStaffIdByLoginId",loginId);
    }

    // 사원 생성
    @Override
    public Integer insertStaff(Staff staff) {
        return mybatis.insert("StaffRepository.insertStaff",staff);
    }

    // 로그인
	@Override
	public String login(Login login) {
		return mybatis.selectOne("StaffRepository.login",login);
	}
}

package com.middle.hr.parkjinuk.staff.repository;

import java.util.Map;

import com.middle.hr.parkjinuk.staff.vo.Login;
import com.middle.hr.parkjinuk.staff.vo.Staff;

public interface StaffRepository {

    // 사원 목록 검색
    Map<String, Object> selectStaffList(String loginId, String searchOption, String searchKeyword, Integer pageNum, Integer pageSize);

    // 로그인 아이디로 회사 id 조회
    Integer selectCompanyIdByLoginId(String loginId);

    // 사원 생성
    Integer insertStaff(Staff staff);
    
    // 로그인
    String login(Login login);
}

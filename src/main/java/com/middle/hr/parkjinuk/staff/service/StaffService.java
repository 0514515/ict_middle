package com.middle.hr.parkjinuk.staff.service;

import java.util.Map;

import com.middle.hr.parkjinuk.staff.vo.Login;
import com.middle.hr.parkjinuk.staff.vo.Staff;

public interface StaffService {


    // 사원 목록 검색
    Map<String, Object> searchStaffList(String loginId, String searchOption, String searchKeyword, Integer pageNum, Integer pageSize);

    // 로그인 아이디로 회사 id 조회
    Integer searchCompanyIdByLoginId(String loginId);
    
    // 로그인 아이디로 사원 기본키 id 조회
    Integer searchStaffIdByLoginId(String loginId);

    // 사원 생성
    Integer createStaff(Staff staff);
    
    // 로그인
    String login(Login login);
}

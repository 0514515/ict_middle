package com.middle.hr.parkjinuk.staff.service;

import com.middle.hr.parkjinuk.staff.repository.StaffRepository;
import com.middle.hr.parkjinuk.staff.vo.Login;
import com.middle.hr.parkjinuk.staff.vo.Staff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class StaffServiceImpl implements StaffService {

    @Autowired
    StaffRepository staffRepository;
    
    // 사원 목록 검색
    @Override
    public Map<String, Object> searchStaffList(String loginId,String searchOption, String searchKeyword, Integer pageNum, Integer pageSize) {
        return staffRepository.selectStaffList(loginId, searchOption, searchKeyword, pageNum, pageSize);
    }

    // 로그인 아이디로 회사 id 검색
    @Override
    public Integer searchCompanyIdByLoginId(String loginId) {
        return staffRepository.selectCompanyIdByLoginId(loginId);
    }
    
    // 로그인 아이디로 사원 기본키 id 조회
    @Override
    public Integer searchStaffIdByLoginId(String loginId) {
    	return staffRepository.selectStaffIdByLoginId(loginId);
    }

    // 사원 생성
    @Override
    public Integer createStaff(Staff staff) {
        return staffRepository.insertStaff(staff);
    }

    // 로그인
	@Override
	public String login(Login login) {
		return staffRepository.login(login);
	}
}

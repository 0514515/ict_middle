package com.middle.hr.parkjinuk.staff.vo;

import java.util.List;

import com.middle.hr.parkjinuk.salary.vo.StaffCommission;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class Staff {

	private Long staffId;		//사원 id number
    private Long companyId;		//회사 id number
    private Long departmentId;	//부서 id number
    private Long basicSalaryId;	//기본급 id number
    private String basicSalaryName;	//기본급 이름
    private String departmentName;	//부서 이름
    private String staffName;		//사원 이름
    private String rank;			//직급
    private String phoneNumber;		//전화번호
    private String email;			//이메일
    private String hiredDate;		//입사일
    private String loginId;			//로그인 아이디
    private String password;		//비밀번호
    private String picture;			//프로필 이미지 경로
    private String sign;			//도장(서명) 이미지 경로
    private String address;			//거주지 주소
    private String gender;			//성별
    private String birthdate;		//생년월일
    private Long authority;			//권한
    private Integer basicSalaryAmount;			//기본급 액수
    private List<StaffCommission> staffCommissionList; // 수당 목록
}

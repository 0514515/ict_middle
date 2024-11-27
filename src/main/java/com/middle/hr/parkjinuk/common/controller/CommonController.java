package com.middle.hr.parkjinuk.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {

	//회사 목록 페이지
	@GetMapping("super/company")
	public String getCompanyList() {
		return "common/companyList";
	}
	
	//회사 등록 페이지
	@GetMapping("super/company/registration")
	public String getCompanyAddForm() {
		return "common/companyRegistrationForm";
	}
	
	//회사 관리자 목록 페이지
	@GetMapping("super/administrator")
	public String getCompanyAdmisitratorList() {
		return "common/companyAdministratorList";
	}
	
	//회사 관리자 등록 페이지
	@GetMapping("super/administrator/registration")
	public String getCompanyAdministratorAddForm() {
		return "common/companyAdministratorRegistrationForm";
	}
}

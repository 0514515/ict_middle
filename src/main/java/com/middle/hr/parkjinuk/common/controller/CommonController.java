package com.middle.hr.parkjinuk.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {

	@GetMapping("super/company")
	public String getCompanyList() {
		
		return "common/companyList";
	}
	
	@GetMapping("super/company/new")
	public String getCompanyAddForm() {
		return "common/companyAddForm";
	}
	
	@GetMapping("super/administrator")
	public String getCompanyAdmisitratorList() {
		return "common/companyAdministratorList";
	}
	
	@GetMapping("super/administrator/new")
	public String getCompanyAdministratorAddForm() {
		return "common/companyAdministratorAddForm";
	}
}
